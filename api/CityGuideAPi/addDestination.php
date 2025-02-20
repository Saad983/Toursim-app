<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if(isset($_POST['name']) && isset($_POST['descripion']) && isset($_POST['city_id']) && isset($_POST['address']))
{
     $name = $_POST['name'];
     $description = $_POST['descripion'];  // Fixed typo in description
     $city_id = $_POST['city_id'];  // Fixed variable name
     $address = $_POST['address'];  // Fixed variable name

    // Make sure to match these column names with your database table
    $query = "INSERT INTO `destinations` (`destination_name`, `description`, `city_id`, `address`) 
              VALUES ('$name', '$description', '$city_id', '$address')";

    $cmd = mysqli_query($conn, $query);
      
    if($cmd)
    {
       echo json_encode(["success" => 1, "msg" => "Destination Inserted."]);
    }
    else
    {
      echo json_encode(["success" => 0, "msg" => "Destination Not Inserted!"]);
    }
}
else
{
   echo json_encode(["success" => 0, "msg" => "Please fill all the required fields!"]);
}
?>
