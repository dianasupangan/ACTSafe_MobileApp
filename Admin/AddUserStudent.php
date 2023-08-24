<?php include('server.php'); 
include('header.php');
    //not allow access if not logged in
    if (empty($_SESSION['admin_id'])){
        header('location: adminHomepage.php');
}?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Add New Student</title>
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

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container" data-aos="fade-up">
        
            <div class="section-title">
                <h2>Edit User list</h2>
                <p>Add New User</p>
              </div>
  
              <div class="container" data-aos="fade-up">

                <div class="row mt-5">
                    <div class="col-lg-2 mt-5 mt-lg-0">
                 </div>      
                 
                <div class="col-lg-8 mt-5 mt-lg-0">
                    <p style="color:gray; font-size: 13px;">Required Information*</p>

                
                    <form method="POST" action="AddUserStudent.php?device_id=" enctype="multipart/form-data" style="margin: 0px 1px 0px;">
                        
                        <!-- display validation error -->
                        
                        <div class="row">
                               
                        <div class="col-md-6 form-group">
                        <input type="hidden" name="uuid" id="uuid"  value="<?php echo $data?>">
                          <input type="text" name="first_name" class="form-control" placeholder="First Name*" required>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                          <input type="text" class="form-control" name="last_name" placeholder="Last Name*" required>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6 form-group">
                          <input type="text" name="id_number" class="form-control" placeholder="ID Number*" required>
                           
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                          <input type="text" class="form-control" name="year" placeholder="Year*" required>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6 form-group">
                          <input type="text" name="school" class="form-control" placeholder="School*" required>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                          <input type="text" class="form-control" name="program" placeholder="Program*" required>
                        </div>
                      </div>
                      <br>
                      <div class="form-group mt-3">
                        <input type="password" class="form-control" name="password" placeholder="Password*" required>
                      </div>
                   
                      <div class="form-group mt-3">
                        <input type="password" class="form-control" name="confirm_pass" placeholder="Confirm Password*" required>
                      </div>
                      <br>
                        <div class="form-group">
                            <button type="submit" name="add_student" class="btn btn-success">Add Student</button>
                        </div>
                    </form>
        
                  </div>
        
                </div>
        
              </div>
  
        </div>
      </section><!-- End Contact Section -->

  </main><!-- End #main -->
</body>

</html>