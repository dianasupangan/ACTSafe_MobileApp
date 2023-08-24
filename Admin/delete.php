<?php require_once 'server.php';
  if(isset($_GET['deleteid'])){
        $id_number = $_GET['deleteid'];
        
        $sql="DELETE FROM student_user_info WHERE id_number = '$id_number'";
        $result = mysqli_query($db,$sql);

        $sql="DELETE FROM staff_user_info WHERE id_number = '$id_number'";
        $result = mysqli_query($db,$sql);

        $sql="DELETE FROM user WHERE id_number = '$id_number'";
        $result = mysqli_query($db,$sql);

      if($result){
          echo "Data deleted successfully";
          header('location:adminHomepage.php');
      } else {
      die(mysqli_error($db));
      } 
  }
?>
