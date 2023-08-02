<?php 
$username="actsafe";
$password="123";
$host="localhost";
$db_name="actsafe_user";

$db = mysqli_connect( 'localhost', 'root', '', 'isproj2' );

if(!$db)
{
   header("Content-Type: JSON");
    $response['status'] = 'Can\'t connect to Database';
    echo json_encode($response,JSON_PRETTY_PRINT);
}

?>