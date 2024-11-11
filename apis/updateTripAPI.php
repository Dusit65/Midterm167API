<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT"); //GET = check getAll , POST = insert , PUT = update , DELETE = delete
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

require_once "./../connectdb.php";
require_once "./../models/trip.php";

//create instant object
$connDB = new ConnectDB();
$trip = new Trip($connDB->getConnectionDB());

//receive value from client 
$data = json_decode(file_get_contents("php://input"));

//set value to Model variable
$trip->trip_id = $data->trip_id;
$trip->user_id = $data->user_id;
$trip->start_date = $data->start_date;
$trip->end_date = $data->end_date;
$trip->location_name = $data->location_name;
$trip->latitude = $data->latitude;
$trip->longitude = $data->longitude;
$trip->cost = $data->cost;

//กรณี แก้ไข ต้องตรวจสอบก่อนว่ามีการอัพโหลดรูปภาพหรือไม่
if (isset($data->tripImage) && isset($data->tripImage2) && isset($data->tripImage3)){
    //------------------------จัดการรูป อัปโหลด ใช้base64---------------------------------
    //เอารูปที่ส่งมาซึ่งเป็นbase64 เก็บไว้ในตัวแปรตัวหนึ่ง
    $picture_temp = $data->tripImage;
    $picture_temp2 = $data->tripImage2;
    $picture_temp3 = $data->tripImage3;
    //ตั้งชื่อรูปใหม่เพื่อใช้กับbase 64
    $picture_filename = "pic1_" . uniqid() . "_" . round(microtime(true)*1000) . ".jpg";
    $picture_filename2 = "pic2_" . uniqid() . "_" . round(microtime(true)*1000) . ".jpg";
    $picture_filename3 = "pic3_" . uniqid() . "_" . round(microtime(true)*1000) . ".jpg";
    //เอารูปที่ส่งมาซึ้งเป็นbase64 แปลงให้เป็นรูปภาพ แล้วเอาไปไว้ที่ pickupload/food/
    //file_putcontents(ที่อยู่ของรูป, ตัวไฟล์ที่จะอัพโหลด);
    file_put_contents( "./../pickupload/trip/".$picture_filename, base64_decode(string: $picture_temp));
    file_put_contents( "./../pickupload/trip/".$picture_filename2, base64_decode(string: $picture_temp2));
    file_put_contents( "./../pickupload/trip/".$picture_filename3, base64_decode(string: $picture_temp3));
    //เอาชื่อไฟล์ไปกำหนให้กับตัวแปรที่จะเก็บลงตารางฐานข้อมูล
    $trip->tripImage = $picture_filename;
    $trip->tripImage2 = $picture_filename2;
    $trip->tripImage3 = $picture_filename3;
    //---------------------------------------------------------------------------------
    }else{
        $trip->tripImage = "";
        $trip->tripImage2 = "";
        $trip->tripImage3 = "";
    }


//call checking username and PitemPrice function
$result = $trip ->updateTripAPI();

if ($result == true){
    //inset update delete complete
    echo json_encode(array("message" => "1"));
}else{
    //inset update delete fail  
    echo json_encode(array("message" => "0"));
}
