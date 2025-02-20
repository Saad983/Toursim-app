<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");

require 'db_connection.php';

// Check if required parameters are present
if(isset($_POST['dest_id'])) {
    // Sanitize input to prevent SQL injection
    $dest_id = $_POST['dest_id'];
    $person_price = $_POST['per_person_price'];
    $tPerson = $_POST['total_person'];


    // Prepare the query
    $query = "INSERT INTO booking_cart(destination_id , per_person_price ,total_persons ,total_price) VALUES ($dest_id , $person_price , $tPerson , ($person_price * $tPerson));";


    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        $last_id = mysqli_insert_id($conn); // POST the last inserted ID
    echo json_encode([
        "success" => 1,
        "msg" => "Booking successfully added.",
        "id" => $last_id
    ]);
    } else {
    // Capture and display the error for debugging
        $error = mysqli_error($conn);
        echo json_encode([
        "success" => 0,
        "msg" => "Database error: Unable to insert booking.",
        "error" => $error
    ]);
}
}
?>
