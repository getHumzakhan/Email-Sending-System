<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/models/email_requests.php";

class RequestController
{
    public function set_email_request($email_request, $merchant_id)
    {
        $request = new EmailRequests();
        $request->insert_request_data($email_request, $merchant_id);
    }
}
