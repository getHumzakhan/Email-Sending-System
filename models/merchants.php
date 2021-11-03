<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/config/db/database.php";

class Merchants extends DataBase
{
    private $merchant_id;
    private $user_name;
    private $email;
    private $password;
    private $credit_amount;
    private $img_url;
    private $jwt;

    public function __Merchants()
    {
        parent::__construct();
    }

    //creates a new merchant's record
    public function insert($signup_data)
    {
        try {
            $query = "INSERT INTO merchants (user_name,email,pass,img_url)
            VALUES ('$signup_data->name','$signup_data->email','$signup_data->pass','$signup_data->img_url')";
            $this->get_connection()->exec($query);
            return true;
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }

    public function set_merchant($merchant_data)
    {
        $this->merchant_id = $merchant_data[0]['merchant_id'];
        $this->user_name = $merchant_data[0]['user_name'];
        $this->email = $merchant_data[0]['email'];
        $this->password = $merchant_data[0]['pass'];
        $this->credit_amount = $merchant_data[0]['credit_amount'];
        $this->img_url = $merchant_data[0]['img_url'];
        $this->jwt = $merchant_data[0]['jwt'];
    }

    public function get_merchant()
    {
        return array(
            "merchant_id" => $this->merchant_id,
            "user_name" => $this->user_name,
            "email" => $this->email,
            "pass" => $this->password,
            "credit_amount" => $this->credit_amount,
            "img_url" => $this->img_url,
            "jwt" => $this->jwt
        );
    }
    public function find_merchant($merchant_credentials)
    {
        $email = $merchant_credentials->email;

        try {
            $conn = $this->get_connection();
            $statement = "SELECT * FROM merchants WHERE email=:email";
            $stmt = $conn->prepare($statement);
            $stmt->bindParam(":email", $email);
            $stmt->execute();
            $stmt->setFetchMode($conn::FETCH_ASSOC);
            $merchant_data = $stmt->fetchAll();

            if (empty($merchant_data)) {
                return false;
            } else {
                $this->set_merchant($merchant_data);
                return true;
            }
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }

    public function set_merchant_jwt($jwt, $merchant_id)
    {
        try {
            $conn = $this->get_connection();
            $statement = "UPDATE merchants SET jwt = :jwt WHERE merchant_id=:id";
            $stmt = $conn->prepare($statement);
            $stmt->bindParam(":jwt", $jwt);
            $stmt->bindParam(":id", $merchant_id);
            $stmt->execute();
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }

    public function find_merchant_jwt($jwt)
    {
        try {
            $conn = $this->get_connection();
            $statement = "SELECT * FROM merchants WHERE jwt=:jwt";
            $stmt = $conn->prepare($statement);
            $stmt->bindParam(":jwt", $jwt);
            $stmt->execute();
            $stmt->setFetchMode($conn::FETCH_ASSOC);
            $merchant_data = $stmt->fetchAll();
            if (empty($merchant_data)) {
                return false;
            } else {
                $this->set_merchant($merchant_data);
                return true;
            }
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }

    public function update_merchant_credit($merchant_id, $credit_amount)
    {
        $updated_credit = $credit_amount - 0.0489;
        try {
            $conn = $this->get_connection();
            $statement = "UPDATE merchants SET credit_amount=:updated_amount WHERE merchant_id=:merchant_id";
            $stmt = $conn->prepare($statement);
            $stmt->bindParam(":updated_amount", $updated_credit);
            $stmt->bindParam(":merchant_id", $merchant_id);
            $stmt->execute();
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
}
