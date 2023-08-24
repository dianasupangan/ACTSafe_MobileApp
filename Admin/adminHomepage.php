<?php include('server.php'); 
include('header.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin Homepage</title>
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

    <section id="events" class="events">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>For Approval</h2>
          <p>Covid Test</p>
        </div>

        <br><br>
        <div class="row">
          <div class="col-md-6 d-flex align-items-stretch">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><a href="PositiveTestList.php">Positive</a></h5>
                <p class="fst-italic text-center">Positive Covid-19 test result for approval</p>
                <p class="card-text">Check submitted Covid-19 Test document submitted by students or staff in order to start the contact tracing process and remove their access to the gates of the university.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><a href="NegativeTestList.php">Negative</a></h5>
                <p class="fst-italic text-center">Negative Covid-19 test result for approval</p>
                <p class="card-text">Check submitted Covid-19 Test document submitted by students or staff return their access to the gates of the university.</p>
              </div>
            </div>

          </div>
        </div>

      </div>
    </section><!-- End Events Section -->

    <!-- ======= Popular Courses Section ======= -->
    <section id="popular-courses" class="courses">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>SY 2022-2023</h2>
          <p>Undergraduate Schools</p>
        </div>

        <div class="row" data-aos="zoom-in" data-aos-delay="100">

          <?php

              $records = mysqli_query($db,
                "SELECT DISTINCT school FROM student_user_info"
              ); // fetch data from database

              while($data = mysqli_fetch_array($records))
                  {
          ?>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="course-item">
              <img src="assets/img/course-1.jpg" class="img-fluid" alt="...">
              <div class="course-content">
                <h3><a href="course.php?school=<?php echo $data['school']; ?>"><?php echo $data['school']; ?></a></h3>
                <a href="course.php?school=<?php echo $data['school']; ?>">See Programs</a>
              </div>
            </div>
          </div> <!-- End Course Item-->

          <?php

                  }
            ?>


        </div>

      </div>
    </section><!-- End Popular Courses Section -->
   
    <!--STAFF-->
    <section id="popular-courses" class="courses">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>SY 2022-2023</h2>
          <p>sTAFF & Departments</p>
        </div>

        <div class="row" data-aos="zoom-in" data-aos-delay="100">

          
        <?php

          $records = mysqli_query($db,
            "SELECT DISTINCT department FROM staff_user_info"
          ); // fetch data from database

          while($data = mysqli_fetch_array($records))
              {
        ?>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
          <div class="course-item">
          <img src="assets/img/course-1.jpg" class="img-fluid" alt="...">
          <div class="course-content">
            <h3><a href="department.php?department=<?php echo $data['department']; ?>"><?php echo $data['department']; ?></a></h3>
            <a href="department.php?department=<?php echo $data['department']; ?>">See Staff</a>
          </div>
          </div>
          </div> <!-- End Course Item-->

        <?php
          }
        ?>
        </div>

      </div>
    </section><!-- End Popular Courses Section -->

  </main><!-- End #main -->


</body>

</html>