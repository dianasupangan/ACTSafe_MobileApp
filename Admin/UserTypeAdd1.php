<?php include('server.php'); 
include('header.php'); 
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: adminHomepage.php');
}?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>User Profile</title>
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

  <main id="main">
    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">
        <div class="container" data-aos="fade-up">
  
          <div class="row">
  
            <div class="col-lg-3 col-md-6">
              
            </div>
  
            <div class="col-lg-3 col-md-6 mt-4 mt-md-0">
              <div class="box">
                <h3>Student</h3>
                <ul>
                  <li>Create new Student profile</li>
                </ul>
                <div class="btn-wrap">
                  <a href="AddUserStudent.php" class="btn-buy">Continue</a>
                </div>
              </div>
            </div>
  
            <div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
              <div class="box">
                <h3>Staff</h3>
                <ul>
                  <li>Create new Staff profile</li>
                </ul>
                <div class="btn-wrap">
                  <a href="AddUserStaff.php" class="btn-buy">Continue</a>
                </div>
              </div>
            </div>
  
          </div>
  
        </div>
      </section><!-- End Pricing Section -->

  </main><!-- End #main -->
</body>

</html>