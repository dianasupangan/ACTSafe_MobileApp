<?php
date_default_timezone_set("Asia/Hong_Kong");

$servername = "localhost";

$conn = mysqli_connect( 'localhost', 'id20438063_actsafe', '$9gPi-4h[Q1C\n{&', 'id20438063_isproj2' );

$api_key_value = "tPmAT5Ab3j7F9";

$api_key= $sensor = $location = $value1 = $value2 = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $api_key = test_input($_POST["api_key"]);
    if($api_key == $api_key_value) {
        $temp = test_input($_POST["temperature"]);
        $date_time = date("Y-m-d h:i:s");

        $sql = "DELETE FROM temp
            WHERE id NOT IN (
            SELECT id
            FROM (
                SELECT id
                FROM temp
                ORDER BY id DESC
                LIMIT 20
            ) foo
            );";

        mysqli_query($conn, $sql);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } 
        
        $sql = "UPDATE temp SET temp='$temp', date_time='$date_time' WHERE id=119";
        
        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully";
        } 
        else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    
        $conn->close();
    }
    else {
        echo "Wrong API Key provided.";
    }

}
else {
    echo "No data posted with HTTP POST.";
}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}