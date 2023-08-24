<?php include('server.php');
include('header2.php'); 
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: adminHomepage.php');
}?>
<!DOCTYPE html>  
  <head>
    <title>Add Multiple Users - STUDENT</title> 
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
          <br><br><br>
          <br><br>  

        <?php  
            if(isset($_POST["submit"])){
              // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
              $user_uuid = $user_uuid ?? random_bytes(16);
              assert(strlen($user_uuid) == 16);

              // Set version to 0100
              $user_uuid[6] = chr(ord($user_uuid[6]) & 0x0f | 0x40);
              // Set bits 6-7 to 10
              $user_uuid[8] = chr(ord($user_uuid[8]) & 0x3f | 0x80);

              // Output the 36 character UUID.
              $user_uuid = vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($user_uuid), 4));
              $user_uuid = strval($user_uuid);

              if($_FILES['file']['name'])
              {
              $filename = explode(".", $_FILES['file']['name']);
              if($filename[1] == 'csv')
              {
              $handle = fopen($_FILES['file']['tmp_name'], "r");
              while($data = fgetcsv($handle))
              {
              $first_name = mysqli_real_escape_string($db, $data[0]);  
              $last_name = mysqli_real_escape_string($db, $data[1]);
              $id_number = mysqli_real_escape_string($db, $data[2]);
              $year = mysqli_real_escape_string($db, $data[3]);
              $school = mysqli_real_escape_string($db, $data[4]);
              $program = mysqli_real_escape_string($db, $data[5]);
              $password = mysqli_real_escape_string($db, $data[6]);

            
              $hashedPassword = hash('sha256', $password);
        

              $user =  "INSERT INTO user (id_number, uuid, first_name, last_name, user_type, password)
              VALUES('$id_number', '$user_uuid', '$first_name', '$last_name', 'Student', '$hashedPassword' )";
              mysqli_query($db, $user);

              $query = "INSERT into student_user_info (id_number, year, school, program) 
              values('$id_number', '$year', '$school' ,'$program')";
              mysqli_query($db, $query);
              header('location: adminHomepage.php');//redirect to homepage
            }
            fclose($handle);
          
            }
            }
          }
        ?>  

    <main id="main">
      <div class="container">
        <div class="main-body" data-aos="fade-up">
        <div class="section-title">
          <h2>Edit User list</h2>
          <p>Add Multiple Students</p>
        </div>
        <form method="post" enctype="multipart/form-data">
            <div class="row gutters-sm">
              <div class="col-md-2"></div>
              <div class="col-md-8">
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Step 1</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        Create Excel File
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Step 2</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        Create Following Columns In Order:
                        <ul>
                          <li>First Name</li>
                          <li>Last Name</li>
                          <li>ID Number</li>
                          <li>Year Level</li>
                          <li>School</li>
                          <li>Program</li>
                          <li>Password</li>
                        </ul>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Step 3</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        Convert to CSV
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Step 4</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        Upload below
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                    <div >  
                      <label>Select CSV File:</label>
                      <input type="file" name="file" />
                        <br />
                      <input type="submit" name="submit" value="Import" class="btn btn-success" />
                    </div>
                     <div id="preloader"></div>
                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

                      <br><br><br><br>
                    </div>
                  </div>
                </div>
                </div>
            </div>
            </form>
          </div>
      </div>
      </div>
    </main><!-- End #main -->
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
