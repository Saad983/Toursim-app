<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if(isset($_POST['email']))
{ 
     $email=$_POST['email'];
     $pwd=$_POST['pwd'];

    $query="SELECT *
               FROM users 
            WHERE email='$email'
            and pwd='$pwd'";

    $cmd = mysqli_query($conn,$query);
    $row=mysqli_fetch_row($cmd);  
    $type=$row[5];
    
    if($type=='user') 
    {
       echo json_encode(["success"=>1,"msg"=>$type]);
    }
    else
    {
      echo json_encode(["success"=>0,"msg"=>$type]);
    }
}
else
{
   echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}

?>