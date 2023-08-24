<?php include('server.php'); 
    include('header1.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ACTSafe - Health Declaration</title>
</head>

<body>

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
<br><br>
  <main id="main">

    <!-- retreat data from previous page -->
    <?php
      $id_number = $_GET['id_number']; 
    ?>

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Updated Health Declaration Form</h2>
        </div>

        <?php
          $records = mysqli_query($db,
          "SELECT * FROM health_declaration_form WHERE id_number= $id_number"
        ); // fetch data from database

        while($data = mysqli_fetch_array($records))
            {
        ?>

        <div class="row">  
        <div class="col-md-2 mt-5 mt-lg-0 d-flex align-items-center" ></div>
          <div class="col-md-8 mt-5 mt-lg-0 d-flex align-items-center" >
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-group">
                <label for="name">Have you been in close contact with persons in quarantine/probable case of COVID-19?</label>
                <p><?php echo $data['contact_infected']; ?></p>
              </div>
              
              <div class="form-group">
                <label for="name">Have you been traveling for the past few weeks overseas?</label>
                <p><?php echo $data['traveled_overseas']; ?></p>
              </div>
              
              <div class="form-group">
                <label for="name">Have you ever been in contact with covid-19 positive while traveling?</label>
                <p><?php echo $data['contact_overseas_travel']; ?></p>
              </div>             
              <div class="text-center"><a class="text-center" href='userProfile.php?id_number=<?php echo $id_number?>'>Close</a></div>
            </form>
          </div>
        </div>

        <?php
          }
        ?>
      </div>
    </section><!-- End Contact Section -->
  </main><!-- End #main -->
</body>
</html>