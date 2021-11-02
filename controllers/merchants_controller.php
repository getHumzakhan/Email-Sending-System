<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/models/merchants.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/public/api_response/response.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/helpers/api_auth.php";

use \Mailjet\Resources;

class MerchantController
{

    //receives associative array
    public function sign_up($signup_data)
    {
        $merchant = new Merchants(); //model class
        $signup_success = $merchant->insert($signup_data);
        if ($signup_success) {
            $msg = "You Have Successfully Signed Up";
            $status_code = 201;
            $api = new Response();
            $api->generate_response($msg, $status_code);
            http_response_code(201);
        }
    }

    public function log_in($merchant_credentials)
    {
        //receives merchant data upon verification
        $merchant_data = $this->verify_credentials($merchant_credentials);

        $msg = "Welcome " . $merchant_data['user_name'];
        $status_code = 200;

        $api = new Response();
        http_response_code(200);
        $api->generate_response($msg, $status_code);
        $this->set_jwt($merchant_data);
    }

    //returns merchant data as associative array if credential matches in db
    public function verify_credentials($merchant_credentials)
    {
        $merchant = new Merchants();    //model class
        if ($merchant->find_merchant($merchant_credentials))  //set merchant object if data found in db
        {
            $email = $merchant_credentials->email;
            $pass = $merchant_credentials->pass;
            $merchant_data = $merchant->get_merchant();

            if ($merchant_data['email'] === $email && $merchant_data['pass'] === $pass) {
                return $merchant_data;  //associative array
            } else {
                $api = new Response();
                http_response_code(401);
                $api->generate_response("Invalid Credentials", "401");
                exit;
            }
        } else {
            $api = new Response();
            http_response_code(404);
            $api->generate_response("No Record Found", "404");
            exit;
        }
    }

    //set jwt in cookie as well as DB
    public function set_jwt($merchant_data)
    {
        $auth = new ApiAuth();
        $jwt = $auth->generate_jwt($merchant_data);
        $merchant_id = $merchant_data['merchant_id'];

        $merchant = new Merchants();
        $merchant->set_merchant_jwt($jwt, $merchant_id);
        setrawcookie("jwt", $jwt, time() + 86400);
    }

    public function get_mail_body($from, $recipient_email, $cc, $cc_name, $bcc, $bcc_name, $recipient_name, $sub, $body)
    {
        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => $from,
                        'Name' => "Ahood Khalid"
                    ],
                    'To' => [
                        [
                            'Email' => $recipient_email,
                            'Name' => $recipient_name
                        ]
                    ],
                    'Cc' => [
                        [
                            'Email' => $cc,
                            'Name' => $cc_name
                        ]
                    ],
                    'Bcc' => [
                        [
                            'Email' => $bcc,
                            'Name' => $bcc_name
                        ]
                    ],
                    'Subject' => $sub,
                    'TextPart' => $body
                ]
            ]
        ];
        return $body;
    }

    public function send_email($email_request)
    {
        $from = $email_request['email_struct']['from'];
        $to = $email_request['email_struct']['recipient_email'];
        $name = $email_request['email_struct']['recipient_name'];
        $cc = $email_request['email_struct']['cc'];
        $cc_name = $email_request['email_struct']['cc_name'];
        $bcc = $email_request['email_struct']['bcc'];
        $bcc_name = $email_request['email_struct']['bcc_name'];
        $sub = $email_request['email_struct']['subject'];
        $body = $email_request['email_struct']['body'];
        $mail_body = $this->get_mail_body($from, $to, $cc, $cc_name, $bcc, $bcc_name, $name, $sub, $body);

        $mj = new \Mailjet\Client('08f530332cc9bfb5b52b3a95801a7068', '0c47c2e4580a03c298e3a9689c1fbf8c', true, ['version' => 'v3.1']);
        $response = $mj->post(Resources::$Email, ['body' => $mail_body]);
        if ($response->success()) {
            return $response->getData();
        } else {
            return false;
        }
    }


    // CODE STRUCT USED FOR SENDING EMAIL VIA LOCALHOST
    // $to_email = $email_struct['recipient_email'];
    // $subject = $email_struct['subject'];
    // $body = "Hi, This is test email send by PHP Script";
    // $headers = array(
    //     'From' => $email_struct['from'],
    //     'Reply-To' => $email_struct['from'],
    //     'X-Mailer' => 'PHP/' . phpversion()
    // );

    // if (mail($to_email, $subject, $body, $headers)) {
    //     echo "Email successfully sent to $to_email...";
    // } else {
    //     echo "Email sending failed...";
    // }
}
