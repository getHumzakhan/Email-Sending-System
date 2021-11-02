<?php

$email_struct = json_decode(file_get_contents('php://input'), true);

if (!empty($_COOKIE['jwt'])) {

    $cookie_jwt = $_COOKIE['jwt'];
    $api = new ApiAuth();
    if ($api->verify_jwt($cookie_jwt)) {
        $merchant = new MerchantController();
        $merchant->send_email($email_struct);
    } else {
        $api = new Response();
        http_response_code(401);
        $api->generate_response("Unothorized", 401);
    }
} else {
    $api = new Response();
    http_response_code(401);
    $api->generate_response("Unothorized", 401);
}
