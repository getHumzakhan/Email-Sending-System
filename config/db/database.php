<?php
class DataBase
{
    private $server_name = "localhost";
    private $username = "root";
    private $password = "Am_N6532";
    private $db_name = "email_sending_system";
    private $connection = null;

    //connecting database and setting connection property of class with connection object
    public function __construct()
    {
        try {
            $conn = new PDO("mysql:host=$this->server_name;dbname=$this->db_name", $this->username, $this->password);
            // set the PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->connection=$conn;
          } catch(PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
          }
    }
    //getting database connection reference / identifier
    public function get_connection()
    {
        return $this->connection;
    }
    public function close_connection()
    {
        $this->connection = null;
    }
}
