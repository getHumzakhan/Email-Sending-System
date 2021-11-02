<?php
class Validator
{
    public $name_pattern = "/[^a-z ]+/i";       //checks if name has any char except alphabets
    public $contact_num_pattern = "/[^0-9]+/";  //checks if contact_num has any char except integers
    public $password_pattern = "/[^0-9a-z_!@#$%^&*()]+|[ ]+/i"; //checks if password has spaces or any other character except those in patterns

    //returns true if string contains non alphabets
    public function has_non_alphabet($name)
    {
        return preg_match($this->name_pattern, $name);
    }

    //returns true if contact num contains non integer char
    public function has_non_integer($contact_num)
    {
        return preg_match($this->contact_num_pattern, $contact_num);
    }

    //returns true if password string contains spaces or any characters that are not allowed by pattern
    public function has_invalid_pattern($password){
        return preg_match($this->password_pattern, $password);
    }

    //returns true if email pattern is valid, else false
    public function is_valid($email)
    {
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public function matches($password,$confirm_password)
    {
        if($password === $confirm_password)
        return true;
        else
        false;
    }

}
