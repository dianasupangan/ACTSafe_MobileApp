<?php 
// 'localhost', 'root', '', 'isproj2' 
$conn = mysqli_connect( 'localhost', 'root', '', 'isproj2' );

if(!$conn){
    die("Connection Failed: " . mysqli_connect_etrror()); 
}
$connect = connect();

    // Get the data
    $user = array();
    $sql = "SELECT *  FROM users";

    if($result = mysqli_query($connect,$sql))
    {
      $count = mysqli_num_rows($result);

      $cr = 0;
      while($row = mysqli_fetch_assoc($result))
      {
          $user[$cr]['id']    = $row['id_number'];
          $user[$cr]['first_name']  = $row['first_name'];
          $user[$cr]['last_name'] = $row['last_name'];
          $user[$cr]['user_type'] = $row['user_type'];
          $user[$cr]['password'] = $row['password'];         
          $cr++;
      }
    }

    $json = json_encode($user);
    echo $json
?>