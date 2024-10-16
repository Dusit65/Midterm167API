<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT"); //POST, PUT, DELETE
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

require_once "./../connectdb.php";
require_once "./../models/user.php";

//create instant object
$connDB = new ConnectDB();
$user = new User($connDB->getConnectionDB());

//receive value from client 
$data = json_decode(file_get_contents("php://input"));

//set value to Model variable
$user->user_id = $data->user_id;
$user->username = $data->username;
$user->password = $data->password;
$user->email = $data->email;

//call checking username and PitemPrice function    
$result = $user ->updateUser();

if ($result == true){
    //inset update delete complete
    echo json_encode(array("message" => "1"));
}else{
    //inset update delete fail
    echo json_encode(array("message" => "0"));
}