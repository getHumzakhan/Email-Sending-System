<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/public/api_response/response.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/helpers/api_auth.php";
require_once '../../../helpers/validator.php';
require_once '../../../controllers/merchants_controller.php';
require_once '../../../controllers/requests_controller.php';
header('content-type: application/json');

$email_request = json_decode(file_get_contents('php://input'), true);

if (!empty($_COOKIE['jwt'])) {

    $cookie_jwt = $_COOKIE['jwt'];
    $api = new ApiAuth();
    //if valid jwt, returns the logged in merchant's record as array
    $valid_merchant = $api->verify_jwt($cookie_jwt);

    if ($valid_merchant) {
        //sending email
        $merchant = new MerchantController();
        $response = $merchant->send_email($email_request);
        if (!empty($response)) {
            $api = new Response();
            http_response_code(200);
            $api->generate_response("Email Sent", 200);
        }

        //registering email request data in db regardless the response is success or failure.
        $email = new RequestController();
        $email->set_email_request($email_request, $valid_merchant['merchant_id']);

        //sending response object to provided webhook
    } else {
        $api = new Response();
        http_response_code(401);
        $api->generate_response("Unothorized", 401);
    }
} else {
    $api = new Response();
    http_response_code(401);
    $api->generate_response("Unothorized", 401);
}
