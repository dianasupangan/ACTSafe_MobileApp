<?php 
// 'localhost', 'root', '', 'isproj2' 
$conn = mysqli_connect( 'localhost', 'root', '', 'isproj2' );

if(!$conn){
    die("Connection Failed: " . mysqli_connect_etrror()); 
}

?>