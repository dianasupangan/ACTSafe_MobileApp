<?php include('server.php'); 
include('header.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: adminHomepage.php');
}?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Delete User Search</title>

  <script>
        function confirmdelete() {
            return confirm("Are you sure you want to delete?");
        }
    </script>

</head> 

<body>

 <!-- ======= Header ======= -->
 <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="adminHomepage.php"><img src="assets/img/FINAL LOGO.png" alt="" class="img-fluid">
      </a></h1>
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="active" href="adminHomepage.php">Home</a></li>
          <li><a href="infected.php">Infected </a></li>
          <li><a href="EditUserList.php">Edit User List</a></li>&nbsp;

          <?php if (isset($_SESSION['admin_id'])): ?>
            <li><a  style="color: red;" href="homepage.php?logout='1'">Logout</a></li>
            <?php endif ?>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <br><br><br>
  <br><br>
<div class="container my-5">

</div>
<main>
  <div class="container my-5">
  <form method="post" class ="center">
        <input type="type" placeholder="Search" name="search">
        <button class="btn btn-success btn-sm" name="submit">Search</button>
    </form>
  </div>
    
    <div class="container my-5">
        <table class="table">
        <thead>
          <tr>
            <th scope="col">Id Number</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">User Type</th>
          </tr>
        </thead>
           <?php
           if(isset($_POST['submit'])){
               $search=$_POST['search'];
               $sql="SELECT * FROM user WHERE id_number like '%$search%'";
               
               $result=mysqli_query($db,$sql);
               if($result){
                while($row=mysqli_fetch_assoc($result)){
                    $id_number=$row['id_number'];
                    $first_name=$row['first_name'];
                    $last_name=$row['last_name'];
                    $user_type=$row['user_type'];
                    
                    echo '<tr>
                    <th scope="row">'.$id_number.'</th>
                    <th>'.$first_name.'</th>
                    <th>'.$last_name.'</th>
                    <th>'.$user_type.'</th>
                    
                    <td>
                    <button class="btn btn-success"><a href="delete.php? deleteid='.$id_number.'" class="text-light" onclick="return confirmdelete();">Delete</a></button>  
                    </tr>';
                }
              } else{
                  echo '<h2 class=:text-danger>Data not found</h2>';

                }
            }
           ?>
        
        </table>
    </div>
        </main>
</body> 
</html>