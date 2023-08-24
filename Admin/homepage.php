<?php include('server.php');
include('header.php'); 
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Gate Homepage</title>
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
          <h2>Choose</h2>
          <p>Admin Role</p>
        </div>

        <br><br>
        <div class="row">
          <div class="col-md-4 d-flex align-items-stretch">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><a href="adminHomepage.php">Admin</a></h5>
                <p class="fst-italic text-center">Manage users</p>
                <p class="card-text">Create and Delete accounts. Update the Covid-19 Infection Status of students.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex align-items-stretch">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><a href="entryGateHomepage.php">Entrance Gate</a></h5>
                <p class="fst-italic text-center">Placed on the entrance gate of school</p>
                <p class="card-text">Check student temperature upon entry and identify their Covid 19 infection status or read if they can enter</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex align-items-stretch">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><a href="exitGateHomepage.php">Exit Gate</a></h5>
                <p class="fst-italic text-center">Placed on the exit gate of school</p>
                <p class="card-text">Check student temperature upon exit and identify their Covid 19 infection status or read if they can enter</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Events Section -->
  </main><!-- End #main -->
</body>

</html>