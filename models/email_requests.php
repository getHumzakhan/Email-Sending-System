<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/config/db/database.php";

class EmailRequests extends DataBase
{
    private $email_request_id;
    private $email_reference;
    private $webhook_url;
    private $from;
    private $to;
    private $cc;
    private $bcc;
    private $subject;
    private $body;
    private $merchant_id;
    private $date_time;

    public function __EmailRequests()
    {
        parent::__construct();
    }
    public function set_email_request($email)
    {
    }

    //creates a new record of email request in db
    public function insert_request_data($email_request, $merchant_id)
    {
        try {
            $conn = $this->get_connection();
            $statement = "INSERT INTO email_requests(request_reference, webhook_url, _from, _to, _cc, _bcc, _subject,_body, merchant_id)
            VALUES (:req_reference, :webhook, :_from, :_to, :_cc, :_bcc, :_subject, :_body, :merchant_id )";
            $stmt = $conn->prepare($statement);

            $stmt->bindParam(':req_reference', $email_request['reference']);
            $stmt->bindParam(":webhook", $email_request['webhook_url']);
            $stmt->bindParam(":_from", $email_request['email_struct']['from']);
            $stmt->bindParam(":_to", $email_request['email_struct']['recipient_email']);
            $stmt->bindParam(":_cc", $email_request['email_struct']['cc']);
            $stmt->bindParam(":_bcc", $email_request['email_struct']['bcc']);
            $stmt->bindParam(":_subject", $email_request['email_struct']['subject']);
            $stmt->bindParam(":_body", $email_request['email_struct']['body']);
            $stmt->bindParam(":merchant_id", $merchant_id);
            $stmt->execute();
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }

    //finds email request against provided reference and upon success, loads the current object
    public function get_email_request($request_reference, $merchant_id)
    {
        try {
            $conn = $this->get_connection();
            $statement = "SELECT * FROM email_requests WHERE request_reference=:req_reference";
            $stmt = $conn->prepare($statement);
            $stmt->bindParam(':req_reference', $request_reference);
            $stmt->execute();
            $stmt->setFetchMode($conn::FETCH_ASSOC);
            $email_request = $stmt->fetchAll();

            if (empty($email_request)) {
                return null;
            } else {

                if ($email_request[0]['merchant_id'] === $merchant_id) {
                    return $email_request;
                } else {
                    return 403;
                }
            }
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
}
