<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/public/api_response/response.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/helpers/validator.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/controllers/merchants_controller.php";

header('content-type: application/json');
$api = new Response();

$merchant_credentials = json_decode(file_get_contents('php://input'));

if (!empty($merchant_credentials->email) and !empty($merchant_credentials->pass)) {
    //create validator objects to perform credentials validation
    $email = new Validator();
    $password = new Validator();

    //check if email is not valid
    if (!$email->is_valid($merchant_credentials->email)) {
        //setting response properties
        $msg = "Invalid email pattern";
        $status_code = "400";
        $api->generate_response($msg, $status_code);
        http_response_code(400);
        exit;
    }

    //check if password has invalid pattern
    if ($password->has_invalid_pattern($merchant_credentials->pass)) {
        $msg = "Invalid password pattern, only numbers, alphabets and these _!@#$%^&*() special chars allowed";
        $status_code = "400";
        $api->generate_response($msg, $status_code);
        http_response_code(400);
        exit;
    }

    $merchant = new MerchantController();
    $merchant->log_in($merchant_credentials);
} else {
    $msg = "Email, or Password Can Not Be Empty";
    $status_code = "400";
    $api->generate_response($msg, $status_code);
    http_response_code(400);
    exit;
}
