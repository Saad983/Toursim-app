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
     $qty=$_POST['qty'];
     $uprice=$_POST['uprice'];
     $total=$qty*$uprice;
     

    $query="INSERT INTO `shopping_cart` (`PROD_NAME`, `QTY`, `UNIT_PRICE`, `TOTAL`, `SHOP_ID`) VALUES ('$name', '$qty', '$uprice', '$total', NULL)";

    $cmd = mysqli_query($conn,$query);
      
    if($cmd)
    {
       $last_id = mysqli_insert_id($conn);    
       echo json_encode(["success"=>1,"msg"=>"Product Inserted.","id"=>$last_id]);
    }
    else
    {
      echo json_encode(["success"=>0,"msg"=>"Product Not Inserted!"]);
    }
}
else
{
   echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}

?>