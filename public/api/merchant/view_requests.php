<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/public/api_response/response.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/helpers/api_auth.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/email_sending_service/controllers/merchants_controller.php";

header('content-type: application/json');

$request_data = json_decode(file_get_contents('php://input'), true);
$request_ref = $request_data['reference'];
// var_dump($request_reference);
// exit;

if (!empty($_COOKIE['jwt'])) {

    $cookie_jwt = $_COOKIE['jwt'];
    $api = new ApiAuth();
    //if valid jwt, returns the logged in merchant's record as array
    $valid_merchant = $api->verify_jwt($cookie_jwt);

    if ($valid_merchant) {

        $merchant_id = $valid_merchant['merchant_id'];
        $merchant = new MerchantController();
        $email_request = $merchant->view_email_request($request_ref, $merchant_id);

        if (empty($email_request)) {
            $api = new Response();
            http_response_code(404);
            $api->generate_response("No Request Found", 404);
        } //forbidden if merchant sends reference of someone else's request 
        else if ($email_request === 403) {
            $api = new Response();
            http_response_code(403);
            $api->generate_response("Forbidden", 403);
        } else {
            $api = new Response();
            http_response_code(200);
            //params passed message, status code, data
            $api->generate_response(null, null, $email_request);
        }
    } else {
        $api = new Response();
        http_response_code(401);
        $api->generate_response("unauthorized", 401);
    }
} else {

    $api = new Response();
    http_response_code(401);
    $api->generate_response("Unothorized", 401);
}
