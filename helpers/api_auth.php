<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/models/merchants.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/vendor/autoload.php";

use Firebase\JWT\JWT;

class ApiAuth
{
    //passed current merchant's database record
    public function generate_jwt($merchant_data)
    {
        //define jwt payload
        $payload = array(
            "iss" => "localhost",
            "iat" => time(),
            "exp" => time() + 86400,
            "aud" => "merchant",
            "data" => array(
                "id" => $merchant_data['merchant_id'],
                "user_name" => $merchant_data['user_name'],
                "email" => $merchant_data['email']
            )
        );
        $secret_key = "Am40_23%xW";
        $jwt = JWT::encode($payload, $secret_key);

        return $jwt;
    }

    public function verify_jwt($cookie_jwt)
    {
        $merchant_table = new Merchants();
        if ($merchant_table->find_merchant_jwt($cookie_jwt))    //set merchant's object if jwt found & returns true
        {
            return $merchant_table->get_merchant();
        } else {
            return false;
        }
    }
}
