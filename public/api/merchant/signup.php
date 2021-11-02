<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/public/api_response/response.php";
require_once '../../../helpers/validator.php';
require_once '../../../controllers/merchants_controller.php';

header('content-type: application/json');
$api = new Response();

$signup_data = json_decode(file_get_contents('php://input'));

//check if username, email or pass is empty
if (empty($signup_data->name) | empty($signup_data->email) | empty($signup_data->pass)) {
    $msg = "Name, Email, or Password Can Not Be Empty";
    $status_code = "400";
    $response->generate_response($msg, $status_code);
    http_response_code(400);
    exit;
}

//create objects for data format validation
$name = new Validator();
$email = new Validator();
$password = new Validator();

if ($name->has_non_alphabet($signup_data->name)) {

    //setting response properties
    $msg = "Name can not contain non alphabets";
    $status_code = "400";
    $api->generate_response($msg, $status_code);
    http_response_code(400);
    exit;
}
if (!$email->is_valid($signup_data->email)) {

    //setting response properties
    $msg = "Invalid email pattern";
    $status_code = "400";
    $api->generate_response($msg, $status_code);
    http_response_code(400);
    exit;
}
if ($password->matches($signup_data->pass, $signup_data->confirm_pass)) {

    if (
        $password->has_invalid_pattern($signup_data->pass) or
        $password->has_invalid_pattern($signup_data->confirm_pass)
    ) {
        $msg = "Invalid password pattern, only numbers, alphabets and these _!@#$%^&*() special chars allowed";
        $status_code = "400";
        $api->generate_response($msg, $status_code);
        http_response_code(400);
        exit;
    }
} else {

    $msg = "Passwords does not match";
    $status_code = "400";
    $api->generate_response($msg, $status_code);
    http_response_code(400);
    exit;
}

if (isset($signup_data->img_url)) {

    $signup_data->img_url = base64_encode($signup_data->img_url);
}

$merchant = new MerchantController();
$merchant->sign_up($signup_data);
