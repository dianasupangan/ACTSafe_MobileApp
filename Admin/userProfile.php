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
  <br><br>

    <main id="main">
      
      <?php
        $id_number = $_GET['id_number']; 
      ?>
      <div class="container">
        <div class="main-body" data-aos="fade-up">
        
              <!-- Breadcrumb -->
              <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active">Student Profile</li>
                </ol>
              </nav>
              <!-- /Breadcrumb -->
        
              <?php

                $records = mysqli_query($db,
                  "SELECT * FROM user WHERE id_number='$id_number'"
                ); // fetch data from database

                while($data = mysqli_fetch_array($records))
                    {
              ?>
              <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <div class="mt-3">
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
                        if($data['covid_infection_status'] == 'No' && $data['contact_infected'] == 'No' && $data['traveled_overseas'] == 'No' && $data['contact_overseas_travel'] == 'No'){?>
                        <span class="btn-success" style="background-color:green;" >Not Exposed</span>
                        <?php 
                        }
                        elseif($data['covid_infection_status'] == 'Yes' || $data['contact_infected'] == 'Yes' || $data['traveled_overseas'] == 'Yes' || $data['contact_overseas_travel'] == 'Yes'){?>
                        <span class="btn-success" style="background-color:red;" > Exposed</span>
                        <?php
                        } ?>
                      </li>
                    </ul>
                  </div>
                </div>
                <?php 
                  }
                  ?>
                <div class="col-md-8">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-3">
                          
                          <h6 class="mb-0">Full Name</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">

                        <?php 
                            $records = mysqli_query($db,
                            "SELECT first_name, last_name FROM user WHERE id_number='$id_number'"
                            ); // fetch data from database
                            
                            while($data = mysqli_fetch_array($records))
                              {
                          ?>
                          <h6 class="mb-0"><?php echo $data['first_name']. " ".$data['last_name'] ?></h6>
                          <?php
                              } ?>
                        </div>
                      </div>
                      <hr>

                      
                      <?php 
                            $records = mysqli_query($db,
                            "SELECT * FROM contact_info WHERE id_number='$id_number'"
                            ); // fetch data from database
                            
                            while($data = mysqli_fetch_array($records))
                              {
                          ?>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Email</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                        <?php echo $data['email_address']?>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Phone No.</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                        <?php echo $data['phone_number']?>
                        </div>
                      </div>
                      <?php
                        } ?>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Address</h6>
                        </div>
                        <?php 
                          $records = mysqli_query($db,
                          "SELECT street, city FROM address WHERE id_number='$id_number'"
                          ); // fetch data from database
                                                  
                          while($data = mysqli_fetch_array($records))
                              {
                          ?>
                        <div class="col-sm-9 text-secondary">
                        <?php echo $data['street']. ", ".$data['city'] ?>
                        </div>
                        <?php
                              } ?>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-12">
                          <a class="btn btn-outline-success"  href="ViewContact.php?id_number=<?php echo $id_number; ?>">View Contact Info</a>
                        </div>
                      </div>
                    </div>
                  </div>
    
                  <div class="row gutters-sm">
                    <div class="col-sm-6 mb-3">
                      <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                          <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-success mr-2">Health</i>Declaration</h6>
                          <small>Cleared for entry</small>
                          
                          <?php 
                            $records = mysqli_query($db,
                            "SELECT * FROM health_declaration_form WHERE id_number='$id_number'"
                            ); // fetch data from database
                                                    
                            while($data = mysqli_fetch_array($records))
                                {
                                  if($data['covid_infection_status'] == 'No' && $data['contact_infected'] == 'No' && $data['traveled_overseas'] == 'No' && $data['contact_overseas_travel'] == 'No'){
                          ?>
                          <div class="material-icons text-success mr-2">
                            <b>Yes</b>
                          </div>
                          
                          <?php
                            }
                            elseif($data['covid_infection_status'] == 'Yes' || $data['contact_infected'] == 'Yes' || $data['traveled_overseas'] == 'Yes' || $data['contact_overseas_travel'] == 'Yes'){
                              ?>
                              <div class="material-icons text-success mr-2">
                                <b style="color:red;">No</b>
                              </div>
                          <?php
                            }?>
                          <small>Last Updated</small>
                          <div class="font-italic">
                            <p><?php echo $data['exposed_date'] ?></p>
                          </div>
                          <?php
                            }?>
                          <a class="btn btn-outline-success mt-auto" href="ViewHealthDec.php?id_number=<?php echo $id_number; ?>">View Health Declaration</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 mb-3">
                      <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                          <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-success mr-2">Covid-19</i>Symptoms</h6>
                          <small>Symptoms Experienced</small>
                          <div class="material-icons text-success mr-2">
                          <?php 
                            $records = mysqli_query($db,
                            "SELECT * FROM symptoms_form WHERE id_number='$id_number'"
                            ); // fetch data from database
                                                    
                            while($data = mysqli_fetch_array($records))
                                {
                                  if($data['fever'] == 'No' && $data['dry_cough'] == 'No' && $data['fatigue'] == 'No' && $data['bodyaches'] == 'No' && $data['runny_nose'] == 'No' && $data['sore_throat'] == 'No' && $data['breath_shortness'] == 'No' && $data['diarrhea'] == 'No' && $data['headache'] == 'No' && $data['loss_smell_taste'] == 'No'){
                          ?>
                            <p>None</p>
                          <?php 
                            }
                            elseif($data['fever'] || 'Yes' && $data['dry_cough'] == 'Yes' || $data['fatigue'] == 'Yes' || $data['bodyaches'] == 'Yes' || $data['runny_nose'] == 'Yes' || $data['sore_throat'] == 'Yes' || $data['breath_shortness'] == 'Yes' || $data['diarrhea'] == 'Yes' || $data['headache'] == 'Yes' || $data['loss_smell_taste'] == 'Yes'){?>
                            <p style='color:red;'>Yes</p>
                          <?php 
                            }
                          ?>
                          </div>
                          <small>Last Updated</small>
                          <div class="font-italic">
                            <p><?php echo $data['date_updated'] ?></p>
                          </div>
                          <?php 
                            } ?>
                            <a class="btn btn-outline-success mt-auto" href="ViewSymptoms.php?id_number=<?php echo $id_number; ?>">View Symptoms</a>
                          
                        </div>
                      </div>
                    </div>
                  </div>
    
    
    
                </div>
              </div>
    
            </div>
        </div>
    </main><!-- End #main -->
</body>

</html>