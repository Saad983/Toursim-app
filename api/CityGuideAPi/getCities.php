<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';



    if(isset($_POST['O'])){
        $O = $_POST['O'];
        $S = $_POST['S'];
        $query="SELECT * FROM cities LIMIT $O , $S";
        $cmd = mysqli_query($conn,$query);      
        $json_array=array();    
        while($row=mysqli_fetch_assoc($cmd))
        {
        $json_array[]=$row;
        }
    
        $output=json_encode(['product'=>$json_array]);    // Yahan sy pta chal jata hau data kesy send ho rha hai 
        echo $output;
    }
    


?>