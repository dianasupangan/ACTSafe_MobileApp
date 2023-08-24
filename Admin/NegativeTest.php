<?php include('server.php'); 
include('header.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Negative Test Confirmation</title>
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

  <main id="main">

    <?php
        $id_number = $_GET['id_number']; 
      ?>
    <main id="main">
      <div class="container">
        <div class="main-body" data-aos="fade-up">
        
              <!-- Breadcrumb -->
              <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active">Negative Test Confirmation</li>
                </ol>
              </nav>
              <!-- /Breadcrumb -->

              <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <div class="mt-3">
                          <?php

                            $records = mysqli_query($db,
                              "SELECT * FROM user WHERE id_number='$id_number'"
                            ); // fetch data from database

                            while($data = mysqli_fetch_array($records))
                                {
                          ?>
                          <h4><?php echo $id_number?></h4>
                          <?php
                            if($data['user_type'] == 'Student')
                                {
                                  $records = mysqli_query($db,
                                  "SELECT * FROM student_user_info WHERE id_number='$id_number'"
                                ); // fetch data from database
                
                                while($data = mysqli_fetch_array($records))
                                    {
                          ?>
                          <p class="text-secondary mb-1"><?php echo $data['school']?></p>
                          <p class="text-muted font-size-sm"><?php echo $data['program']?></p>
                          <?php
                                    }
                            } 
                            elseif($data['user_type'] == 'Staff')
                                {
                                  $records = mysqli_query($db,
                                  "SELECT * FROM staff_user_info WHERE id_number='$id_number'"
                                ); // fetch data from database
                
                                while($data = mysqli_fetch_array($records))
                                    {
                          ?>
                          <p class="text-secondary mb-1"><?php echo $data['department']?></p>
                          <p class="text-muted font-size-sm"><?php echo $data['position']?></p>
                          <?php
                              }
                            } 
                          ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php 
                $records = mysqli_query($db,
                "SELECT * FROM health_declaration_form WHERE id_number='$id_number'"
                ); // fetch data from database
                
                while($data = mysqli_fetch_array($records))
                  {
              ?>
                  <div class="card mt-3">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">Covid-19 Status</h6>
                        <?php
                          if($data['covid_infection_status'] == "No"){
                        ?>
                        <span class="text-secondary">Negative</span>
                        <?php
                          }
                          elseif($data['covid_infection_status'] == "Yes"){
                        ?>
                        <span class="text-secondary" style="color:red;">Positive</span>
                        <?php
                          }
                          ?>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">Exposure Status</h6>
                        <?php 
                        if($data['contact_infected'] == 'No' && $data['traveled_overseas'] == 'No' && $data['contact_overseas_travel'] == 'No'){?>
                        <span class="btn-success" style="background-color:green;" >Not Exposed</span>
                        <?php 
                        if($data['contact_infected'] == 'Yes' || $data['traveled_overseas'] == 'Yes' || $data['contact_overseas_travel'] == 'Yes'){?>
                        <span class="btn-success" style="background-color:Orange;" > Exposed</span>
                        <?php
                        } ?>
                      </li>
                    </ul>
                  </div>
                </div>
                <?php 
                  }
                }
                  ?>
                <div class="col-md-8">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Submitted Covid-19 Test</h6>
                          <?php 
                            $records = mysqli_query($db,
                            "SELECT photo_link FROM negative_test WHERE id_number='$id_number'"
                            ); // fetch data from database

                            while($data = mysqli_fetch_array($records))
                                {
                          ?>
                          <a class="mb-0" href='<?php echo $data['photo_link']?>' target="_blank">See Photo</a>
                          <?php 
                            } ?>
                        </div>
                      </div>
                      <hr>
                      <?php
                            }
                          ?>  
                      <div class="row">
                        <div class="col-sm-12">

                        <form method="POST" action="NegativeTest.php" style="margin: 0px 1px 0px;">
                          <label for="name">What is the infection status of the user?</label>
                          <br>
                              <input class="form-control" type="hidden" value="<?php echo $id_number?>" name="id_number">
                              <input type="radio" id="css" name="status" value="Yes">
                              <label for="css">Infected</label>
                              <input type="radio" id="css" name="status" value="No">
                              <label for="css">Not Infected</label><br>
                          <div class="form-group">
                              <button type="submit" name="negativeTest" class="btn btn-success">Update Record</button>
                          </div>
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main><!-- End #main -->
  </main><!-- End #main -->
</body>

</html>