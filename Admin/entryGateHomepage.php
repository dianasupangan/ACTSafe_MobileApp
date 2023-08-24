<?php include('server.php'); 
include('header1.php'); 

//not allow access if not logged in
if (empty($_SESSION['admin_id'])){
    header('location: index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ACTSafe - Gate</title>
</head>

<body OnLoad="document.myForm.searchEntrance.focus();">

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
    <script language="JavaScript" type="text/JavaScript">

      var x=8;//nr characters

      function submitT(t,f){

      if(t.value.length==x){

      f.submit()

      }

      }

      </script>
  </header><!-- End Header -->
<br><br><br><br>
  <main id="main">
    <div class="container">
      <div class="main-body" data-aos="fade-up">
      
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item active">User Profile</li>
              </ol>
            </nav>
            <!-- /Breadcrumb -->
            <form class="form-horizontal" name="myForm"action="#" method="post">
              <div class="row">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="email"><b>Search Student Information:</b>:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="searchEntrance" onkeyup="submitT(this,this.form)" placeholder="search here">
                    </div>
                </div>
                
              </div>
            </form>

    </br>
            <?php
            
		    	 if(!$user_details)
		    	 {
		    		echo '<tr>No data found</tr>';
		    	 }
		    	 else{
		    	 	foreach($user_details as $key=>$value)
		    	 	{
                        $id_number =  $value['id_number'];
		    	 		?>
            <div class="row gutters-sm ">
            <div class="col-md-2">
            </div>
              <div class="col-md-8">
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">ID Number</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $value['id_number']; ?>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">User</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $value['user_type']; ?>
                      </div>
                    </div>
                    <hr>
                    
                    <?php 
                        if($value['user_type'] == "Student"){
                        $records = mysqli_query($db,
                          "SELECT * FROM student_user_info WHERE id_number = '$id_number'"
                        ); // fetch data from database
                
                        while($data = mysqli_fetch_array($records))
                          {
                            ?>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">School</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $data['school']; ?>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Program</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $data['program']; ?>
                      </div>
                    </div>
                  </div>
                </div>
                <?php
                    }
                   }

                    elseif($value['user_type'] == "Staff"){
                    $records = mysqli_query($db,
                      "SELECT * FROM staff_user_info WHERE id_number = '$id_number'"
                    ); // fetch data from database
                    
                    while($data = mysqli_fetch_array($records))
                      {      
                    ?>


                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Department</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $data['department']; ?>
                      </div>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-sm-3">
                        <h6 class="mb-0">Position</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                      <?php echo $data['position']; ?>
                      </div>
                    </div>
                  </div>
                </div>
                        
                <?php
                    }
                      }
                      $records = mysqli_query($db,
                        "SELECT * FROM entry_log WHERE id_number = '$id_number'"
                      ); // fetch data from database

                      while($data = mysqli_fetch_array($records))
                        {
                ?>
                  <div class="card mt-3">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">Temperature</h6>
                        <span class="text-secondary"><?php echo $data['temperature']; ?> C</span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">Date</h6>
                        <span class="text-secondary"><?php echo $data['entry_timedate']; ?></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">Cleared For Entry:</h6>

                        <?php 
                            $records = mysqli_query($db,
                            "SELECT * FROM health_declaration_form WHERE id_number='$id_number'"
                            ); // fetch data from database
                                                    
                            while($data = mysqli_fetch_array($records))
                                {
                                  if($data['covid_infection_status'] == 'No' && $data['contact_infected'] == 'No' && $data['traveled_overseas'] == 'No' && $data['contact_overseas_travel'] == 'No'){
                          ?>
                        <span class="btn-success">Yes</span>
                        <?php
                            }
                            elseif($data['covid_infection_status'] == 'Yes' || $data['contact_infected'] == 'Yes' || $data['traveled_overseas'] == 'Yes' || $data['contact_overseas_travel'] == 'Yes'){
                        ?>
                        <span class="btn-danger">No</span>
                        <?php
                          }
                        }?>

                      </li>
                    </ul>
                  </div>
                </div>
                </div>
              </div>
              <br>

               <audio id="myAudio">
               <source src="notify.mp3" type="audio/mpeg">
               </audio>

               <script src="script.js"></script>

              <?php 
                $records = mysqli_query($db,
                "SELECT * FROM health_declaration_form a, entry_log b WHERE a.id_number=b.id_number AND a.id_number='$id_number'"
                ); // fetch data from database
                                                    
                while($data = mysqli_fetch_array($records))
                  {
                    $tempString = $data['temperature'];
                    $tempDouble = (double) $tempString;      
                    if($data['covid_infection_status'] == 'No' && $data['contact_infected'] == 'No' && $data['traveled_overseas'] == 'No' && $data['contact_overseas_travel'] == 'No' && $tempDouble < 38.0){
               ?>
              <div class="approved">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                <strong>Clear!</strong> This person is clear for entry.
              </div>  
            <?php
              }
              elseif($data['contact_infected'] == 'Yes' || $data['traveled_overseas'] == 'Yes' || $data['contact_overseas_travel'] == 'Yes'){
            ?>
            <div class="exposed">
              <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
              <strong>Warning!</strong> This person is not clear for entry.
            </div>  
            <?php
              }
              elseif($data['covid_infection_status'] == 'Yes'){
            ?>
            <div class="denied">
              <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
              <strong>Warning!</strong> This person is not clear for entry.
            </div>  
            <?php
              }
              elseif($tempDouble >= 37){
            ?>
            <div class="denied">
              <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
              <strong>Warning!</strong> Student temperature is high.
            </div>  
            <?php
              }
            }
              ?>
            </div>
            <?php
               }
		    	 	}
		    	 }
		    ?>
          </div>
      </div>
  </main><!-- End #main -->
</body>

</html>