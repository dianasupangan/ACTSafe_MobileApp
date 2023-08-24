<?php include('server.php'); 
include('header.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Infected List</title>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="adminHomepage.php"><img src="assets/img/FINAL LOGO.png" alt="" class="img-fluid">
      </a></h1>
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a  href="adminHomepage.php">Home</a></li>
          <li><a class="active" href="infected.php">Infected </a></li>
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

    <br>

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">
        <br>
        <div class="section-title">
          <h2>List</h2>
          <p>Infected User</p>
        </div>
      
        <main id="main">
      
          <div class="container" data-aos="fade-up">
            <div class="row">
              <div class="col-lg-2 col-md-6 d-flex align-items-stretch"></div>
              <div class="col-lg-8 col-md-6 d-flex align-items-stretch">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">Id No.</th>
                      <th scope="col">Name</th>
                      <!--<th scope="col">Program</th> -->
                      <th scope="col">Infection Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                      $records = mysqli_query($db,
                        "SELECT a.id_number, a.first_name, a.last_name, b.covid_infection_status
                        FROM user a, health_declaration_form b, health_declaration_form c
                        WHERE b.id_number=a.id_number AND c.id_number=a.id_number AND c.covid_infection_status = 'Yes'"
                      ); // fetch data from database

                      while($data = mysqli_fetch_array($records))
                          {
                    ?>
                    <tr>
                      <th scope="row"><a href="userProfile.php?id_number=<?php echo $data['id_number']; ?>"><?php echo $data['id_number']; ?></a></th>
                      <td><?php echo $data['first_name']. " ". $data['last_name'] ?></td>
                      <!-- <td>BS-IS</td> -->
                      <td><?php echo $data['covid_infection_status']; ?></td>
                    </tr>
                    <?php
                          }
                    ?>
                     </tbody>
                </table>
              </div>
        
            </div>
          </div>
        </main><!-- End #main -->          
        </div>
      </div>
      <br><br>
      <div class="container" data-aos="fade-up">
    </section><!-- End Features Section -->
  </main><!-- End #main -->
</body>

</html>