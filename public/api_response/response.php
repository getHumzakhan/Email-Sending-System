<?php
//DO NOT MANIPULATE THIS CLASS
class Response
{
    private $message;
    private $status_code;
    private $data;

    //getting response as associative array
    public function get_response_assoc()
    {
        if(empty($this->data))
        {
            $response = array(
                "message" => $this->message,
                "status_code" => $this->status_code
            );
        }
        else
        {
            $response = array(
                "message" => $this->message,
                "status_code" => $this->status_code,
                "data" => $this->data
            );
        }
        return $response;
    }

    //Creates response and responds to request.
    function generate_response($msg,$status_code)
    {
        $this->message = $msg;
        $this->status_code = $status_code;
        $this->respond_api();
    }
    public function respond_api()
    {
        echo json_encode($this->get_response_assoc());
    }
    
    // //setting response properties
    // public function set_response($message, $status_code,$data)
    // {
    //     $this->data = $data;
    //     $this->message = $message;
    //     $this->status_code = $status_code;
    // }
}
