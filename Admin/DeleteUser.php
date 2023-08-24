<?php include('server.php'); 
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: adminHomepage.php');
}?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Delete User</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/LOGO.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Mentor - v4.7.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="adminHomepage.php"><img src="assets/img/FINAL LOGO.png" alt="" class="img-fluid">
      </a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.php" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

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
  <main id="main">

    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Edit User list</h2>
          <p>Delete a User</p>
        </div>

        <div class="row">  
        <div class="col-md-2 mt-5 mt-lg-0 d-flex align-items-center" ></div>
          <div class="col-md-8 mt-5 mt-lg-0 d-flex align-items-center" >
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-group">
                <input type="text" class="form-control" name="id_number"  placeholder="ID Number" required>
              </div>
            </form>
            
          </div>
          <div class="col-md-2 mt-5 mt-lg-0 d-flex align-items-center">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="text-center"><button type="submit" onclick="location.href='adminHomepage.php'">Search</button></div>
            </form>
            
          </div>
          
          <div class="container" data-aos="fade-up">
            <div class="row">
              <div class="col-lg-2 col-md-6 d-flex align-items-stretch"></div>
              <div class="col-lg-8 col-md-6 d-flex align-items-stretch">
                <table class="table table-hover">
              
                  <tbody>
                  <?php
                    $sql="SELECT * FROM user";
                    $result=mysqli_query($db,$sql);

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
                            <button class="btn btn-success"><a href="delete.php? deleteid='.$id_number.'" class="text-light">Delete</a></button>

                          </tr>';
                          
                        }
                    }
                    ?>
      
                  </tbody>
                </table>
              </div>
        
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Contact Section -->
    

  </main><!-- End #main -->

  

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>