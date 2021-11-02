<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/config/db/database.php";

class EmailStatus extends DataBase
{
    private $status_id;
    private $status;
    private $status_code;
    private $request_reference;
    private $date_time;

    public function __EmailStatus()
    {
        parent::__construct();
    }

    public function insert_status_data($status, $status_code, $description, $request_reference)
    {
        echo "SSs";
        try {
            $conn = $this->get_connection();
            $statement = "INSERT INTO email_status(_status, _status_code,_description ,_request_reference)
            VALUES (:_status, :_status_code,:_description,:_request_reference)";
            $stmt = $conn->prepare($statement);

            $stmt->bindParam(':_status', $status);
            $stmt->bindParam(':_status_code', $status_code);
            $stmt->bindParam(':_description', $description);
            $stmt->bindParam(':_request_reference', $request_reference);
            $stmt->execute();
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
}
