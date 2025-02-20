<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

// Corrected the method to access $_GET
if(isset($_POST['id'])){
    $id = $_POST['id'];
    $O = $_POST['O'];
    $S = $_POST['S'];  // Use $_GET to access URL parameters
    $query = "SELECT * FROM destinations WHERE destinations.city_id = '$id'";  // Query with city_id filter
    $cmd = mysqli_query($conn, $query);      
    
    $json_array = array();    
    while($row = mysqli_fetch_assoc($cmd)){
        $json_array[] = $row;  // Adding each row to the array
    }
   
    $output = json_encode(['destinations' => $json_array]);    // Masla kya hai 
    echo $output;
}

?>
