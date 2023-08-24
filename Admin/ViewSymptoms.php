<?php include('server.php'); 
include('header1.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: index.php');
}?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>ACTSafe - Symptoms</title>
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
          <h2>Updated Symptoms</h2>
          <p>View symptoms of account holder.</p>
        </div>

        <?php
          $records = mysqli_query($db,
          "SELECT * FROM symptoms_form WHERE id_number= $id_number"
        ); // fetch data from database

        while($data = mysqli_fetch_array($records))
            {
        ?>

        <div class="row">  
        <div class="col-md-2 mt-5 mt-lg-0 d-flex align-items-center" ></div>
            <div class="col-md-8 mt-5 mt-lg-0 d-flex align-items-center" >
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              
              <div class="row">
                
              <?php
              if($data['fever'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Fever</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['fever'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Fever</h2>
                  </label>
                </div>
                <?php
                  }
                ?>  
              <?php
              if($data['dry_cough'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Dry Cough</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['dry_cough'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Dry Cough</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              <?php
              if($data['fatigue'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Fatigue</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['fatigue'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Fatigue</h2>
                  </label>
                </div>
              <?php
                }
              ?>  

              <?php
                if($data['bodyaches'] == "Yes")
                    {
                ?>
                  <div class="col-md-6 mt-5 align-items-center">
                    <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                    <label class="lable_line" for="control_01">
                      <h2>Body Ache</h2>
                    </label>
                  </div>
                <?php
                    }
                    elseif($data['bodyaches'] == "No")
                    {
                ?>
                  <div class="col-md-6 mt-5 align-items-center">
                    <input type="checkbox" id="control_01" name="select" value="1">
                    <label class="lable_line" for="control_01">
                      <h2>Body Ache</h2>
                    </label>
                  </div>
                <?php
                  }
                ?>  

                <?php
              if($data['runny_nose'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Runny Nose</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['runny_nose'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Runny Nose</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              
              <?php
              if($data['sore_throat'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Sore Throat</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['sore_throat'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Sore Throat</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              
              <?php
              if($data['breath_shortness'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Breathing Shortness</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['breath_shortness'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Breathing Shortness</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              
              <?php
              if($data['diarrhea'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Diarhea</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['diarrhea'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Diarhea</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              
              <?php
              if($data['headache'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Headache</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['headache'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>Headache</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              
              <?php
              if($data['loss_smell_taste'] == "Yes")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1" checked="true">
                  <label class="lable_line" for="control_01">
                    <h2>Loss of Taste and Smell</h2>
                  </label>
                </div>
                <?php
                  }
                  elseif($data['loss_smell_taste'] == "No")
                  {
              ?>
                <div class="col-md-6 mt-5 align-items-center">
                  <input type="checkbox" id="control_01" name="select" value="1">
                  <label class="lable_line" for="control_01">
                    <h2>HeadLoss of Taste and Smellache</h2>
                  </label>
                </div>
              <?php
                }
              ?>  
              </div>

              <?php
            }
              ?>          
              <br>
              <div class="text-center"><a class="text-center" href='userProfile.php?id_number=<?php echo $id_number?>'>Close</a></div>
              </section>
            </form>
          </div>
        </div>
      </div>
    </section><!-- End Contact Section -->
  </main><!-- End #main -->
</body>
</html>