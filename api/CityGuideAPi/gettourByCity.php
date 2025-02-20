<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';
if(isset($_GET['TID'])){
    $TID = $_GET['TID'];
    $query="SELECT * FROM tours WHERE city_id = '$TID'";
    $cmd = mysqli_query($conn,$query);      
    $json_array=array();    
    while($row=mysqli_fetch_assoc($cmd))
    {
     $json_array[]=$row;
    }
   
    $output=json_encode(['product'=>$json_array]);    
    echo $output;
}
else{
    echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}


?>

