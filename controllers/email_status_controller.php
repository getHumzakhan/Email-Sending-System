<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/models/email_status.php";

class EmailStatusController
{
    public function set_email_status($status, $status_code, $description, $request_reference)
    {
        $email_status = new EmailStatus();
        $email_status->insert_status_data($status, $status_code, $description, $request_reference);
    }
}
