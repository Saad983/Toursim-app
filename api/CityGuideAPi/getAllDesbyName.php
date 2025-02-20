<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if(isset($_POST['name']))
{
     $name=$_POST['name'];

    $query="SELECT * FROM destinations WHERE destinations.destination_name LIKE '%$name%'";
    $cmd = mysqli_query($conn,$query);      
    $json_array=array();    
    while($row=mysqli_fetch_assoc($cmd))
    {
     $json_array[]=$row;
    }
   
    $output=json_encode(['destinations'=>$json_array]);    
    echo $output;
}
else
{
   echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}

?>