<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/models/merchants.php";

class ApiAuth
{
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
