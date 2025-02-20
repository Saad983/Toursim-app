<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require 'db_connection.php';

// Debugging: Check database connection
if (!$conn) {
    die(json_encode(["success" => 0, "msg" => "Database connection failed!", "error" => mysqli_connect_error()]));
}

// Debugging: Print received parameters
if (!empty($_POST)) {
    print_r($_POST); // To check received parameters
    die();
}

if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['pwd'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];

    $query = "INSERT INTO `users` (`name`, `email`, `pwd`) 
              VALUES ('$name', '$email', '$pwd')";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        $last_id = mysqli_insert_id($conn);
        echo json_encode(["success" => 1, "msg" => "User Inserted.", "id" => $last_id]);
    } else {
        echo json_encode(["success" => 0, "msg" => "User Not Inserted!", "error" => mysqli_error($conn)]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please fill all the required fields!"]);
}
?>
