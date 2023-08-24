<?php
session_start();

$username = "";
$email = "";
$errors = array();

//connect to the database
$db = mysqli_connect( 'localhost', 'root', '', 'isproj2' ); 

//LOGIN
if (isset($_POST['login'])) {
    $admin_id = ($_POST['admin_id']);
    $password = ($_POST['password']);


    if (empty($admin_id)){
        array_push($errors, "Admin ID is required");
    }
    if (empty($password)){
        array_push($errors, "Password is required");
    }
    if (count($errors) == 0) {
        $query = "SELECT * FROM admin WHERE admin_id = '$admin_id' AND password = '$password'";
        $result = mysqli_query($db, $query);
        $user = "SELECT * FROM user";
        $userResult = mysqli_query($db, $user);

        if(mysqli_num_rows($userResult) > 0 && mysqli_num_rows($result) == 1) {
            $_SESSION['admin_id'] = $admin_id;
            $_SESSION['success'] = "You are now logged in";
            header('location: homepage.php');//redirect to homepage
        } elseif(mysqli_num_rows($userResult) == 0 && mysqli_num_rows($result) == 1) {
            $_SESSION['admin_id'] = $admin_id;
            $_SESSION['success'] = "You are now logged in";
            header('location: InitialAddMultiple(Staff).php');//redirect to homepage
        }else {
            array_push($errors, "Wrong username/password combination");
        } 

    }
}

//  logout
if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['username']);
    header('location: index.php');
}

//addUserStudent
if (isset($_POST['add_student'])) {

    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    //
    $data = vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    $data = strval($data);
    
      $uuid = ($_POST['uuid']);
      $first_name = ($_POST['first_name']);
      $last_name = ($_POST['last_name']);
      $id_number = ($_POST['id_number']);
      $year = ($_POST['year']);
      $school = ($_POST['school']);
      $program = ($_POST['program']);
      $password = ($_POST['password']);
      $confirm_pass = ($_POST['confirm_pass']);

     

  if ($password != $confirm_pass){
      array_push($errors, "The two passwords should match");
  } else{
    if (count($errors) == 0) {
        
        $hashedPassword = hash('sha256', $password);
        
        $user =  "INSERT INTO user (id_number, uuid, first_name, last_name, user_type, password)
        VALUES('$id_number', '$data', '$first_name', '$last_name',  'Student', '$hashedPassword')";
        mysqli_query($db, $user);
  
        $student =  "INSERT INTO student_user_info (id_number, school, program, year)
        VALUES('$id_number', '$school', '$program',  '$year')";
        mysqli_query($db, $student);
        header('location: adminHomepage.php');//redirect to homepage
    }  
  }
   
  
}

//addUserStaff
if (isset($_POST['add_staff'])) {
    
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    //
    $data = vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    
    $uuid = ($_POST['uuid']);
    $first_name = ($_POST['first_name']);
    $last_name = ($_POST['last_name']);
    $id_number = ($_POST['id_number']);
    $department = ($_POST['department']);                      
    $position = ($_POST['position']);
    $password = ($_POST['password']);
    $confirm_pass = ($_POST['confirm_pass']);

    //$passwordHash = password_hash($password, PASSWORD_DEFAULT);

    if ($password != $confirm_pass) {
        array_push($errors, "The two passwords should match");
    } else {
    if (count($errors) == 0) {

      $hashedPassword = hash('sha256', $password);

      $query =  "INSERT INTO user (id_number, uuid, first_name, last_name, user_type, password)
      VALUES('$id_number', '$data',  '$first_name', '$last_name', 'Staff', '$hashedPassword' )";
      mysqli_query($db, $query);
      
      $staff =  "INSERT INTO staff_user_info (id_number, department, position)
      VALUES('$id_number', '$department', '$position')";
      mysqli_query($db, $staff);
      header('location: adminHomepage.php');//redirect to homepage
    }
  }  
}

//Postive test
if (isset($_POST['positiveTest'])) {
    $id_number = ($_POST['id_number']);
    $status = ($_POST['status']);

    if($status == 'No'){
        $user =  "DELETE FROM positive_test WHERE id_number = $id_number";
        mysqli_query($db, $user);
        header('location: adminHomepage.php');
    } elseif($status == 'Yes'){
        //Update Health Declaration
        $update = "UPDATE health_declaration_form SET covid_infection_status = 'Yes' WHERE health_declaration_form.id_number = $id_number";

        mysqli_query($db, $update);

        

        //Send Email to infected
        $email_sql = "SELECT contact_info.email_address FROM contact_info WHERE id_number = $id_number";
        $email_result = mysqli_query($db, $email_sql);
        if(mysqli_num_rows($email_result) == 1){
            while($row = mysqli_fetch_assoc($email_result)){
                $email = $row['email_address'];
                $subject = "Positive COVID-19 Test Result: Approval and Next Steps";
                $body = "Dear Student,
                I hope this email finds you well. I wanted to inform you that your recent COVID-19 test result indicating a positive diagnosis has been reviewed and approved.
                
                This positive result suggests that you are currently infected with the COVID-19 virus. It is important to remain vigilant and adhere to the recommended safety measures to protect yourself and others.
                
                Please be advised that you should continue to follow the guidelines and recommendations provided by healthcare professionals and local health authorities. It is crucial to prioritize your health and take necessary precautions to prevent the spread of the virus.
                
                Self-isolate at home.
                Monitor for symptoms.
                Follow healthcare guidelines for further guidance.
                
                If you have any concerns or require further information, please feel free to reach out to us. We are here to assist you.
                
                Take care,
                ACTSafe Team
                 ";
                $headers = "actsafe2023@gmail.com";
                
                if ( mail($email, $subject, $body, $headers)) {
                    echo("Email successfully sent to $email...");
                } else {
                    echo("Email sending failed...");
                }
            }
        }

        //Get Uuid
        $user_device_id = "SELECT uuid FROM user WHERE id_number = $id_number;"; 
        $user_device_id_result = mysqli_query($db, $user_device_id);
        while($row = mysqli_fetch_assoc($user_device_id_result)){
            $device_id = $row['uuid'];


            //Get exposed users
            $exposed_users = "SELECT id_number FROM scanned_devices WHERE uuid = '$device_id';";
            $exposed_users_result = mysqli_query($db, $exposed_users);

            while($row = mysqli_fetch_assoc($exposed_users_result)){
                $exposed_id_number = $row['id_number'];
                $exposed_date = date('m/d/Y');
                $update_health_dec = "UPDATE health_declaration_form SET exposed = 'Yes', exposed_date = '$exposed_date'  WHERE health_declaration_form.id_number = $exposed_id_number;";
                if (mysqli_query($db, $update_health_dec)){
                    //Send email to exposed
                    $email_sql = "SELECT contact_info.email_address FROM contact_info WHERE id_number = $exposed_id_number";
                    $email_result = mysqli_query($db,$email_sql);
                    if(mysqli_num_rows($email_result) == 1){
                        while($row = mysqli_fetch_assoc($email_result)){
                            $email = $row['email_address'];
                            $subject = "Urgent Notice: Potential COVID-19 Exposure";
                            $body = "Dear Student,

                            You have been exposed to someone who has tested positive for COVID-19. Please take immediate precautions to safeguard your health and others around you.
                            
                            Self-isolate at home.
                            Monitor for symptoms.
                            Consider getting tested.
                            Follow healthcare guidelines for further guidance.
                            
                            Take care,
                            ACTSafe Team
                            ";
                            $headers = "actsafe2023@gmail.com";
                            
                            if ( mail($email, $subject, $body, $headers)) {
                                echo("Email successfully sent to $email...");
                            } else {
                                echo("Email sending failed...");
                            }
                        }
                    }

                    //Send email to parents
                    $guardian_id_sql = "SELECT guardian_id FROM guardian WHERE id_number = $exposed_id_number";
                    $guardian_id_sql_result = mysqli_query($db,$guardian_id_sql);

                    if(mysqli_num_rows($guardian_id_sql_result) == 1){
                        while($row = mysqli_fetch_assoc($guardian_id_sql_result)){
                            $guardian_id = $row['guardian_id'];
                            $guardian_email_sql = "SELECT email_address FROM guardian_contact_info WHERE guardian_id = '$guardian_id'";
                            $guardian_email_result = mysqli_query($db,$guardian_email_sql);
                            if(mysqli_num_rows($guardian_email_result) == 1){
                                while($row = mysqli_fetch_assoc($guardian_email_result)){
                                    $guardian_email = $row['email_address'];
                                    
                                    $subject = "Urgent Notice: Potential COVID-19 Contact Notification for Your Dependent";
                                    $body = "Important: Student under your care is exposed to COVID-19.

                                    Be advised that your dependent has a potential threat of having COVID-19. Please monitor their health closely.
                                    
                                    Please be advised that you should continue to follow the guidelines and recommendations provided by healthcare professionals and local health authorities. It is crucial to prioritize your health and take necessary precautions to prevent the spread of the virus.
                                    
                                    Take care,
                                    ACTSafe Team
                                    
                                    ";
                                    $headers = "actsafe2023@gmail.com";
                                    
                                    if ( mail($guardian_email, $subject, $body, $headers)) {
                                        echo("Email successfully sent to $guardian_email...");
                                    } else {
                                        echo("Email sending failed...");
                                    }
                                }
                            }
                        }
                    }

            header('location: adminHomepage.php');
                } else {
                    echo "Not updated";
                    die();
                }
            }
        }

        // Delete positive test submission
        $delete =  "DELETE FROM positive_test WHERE id_number = $id_number";
        if(mysqli_query($db, $delete)){
        header('location: adminHomepage.php');
        }
    }
}


//Negative test
if (isset($_POST['negativeTest'])) {
    $id_number = ($_POST['id_number']);
    $status = ($_POST['status']);

    if($status == 'Yes'){
        $user =  "DELETE FROM negative_test WHERE id_number = $id_number";
        mysqli_query($db, $user);
        header('location: adminHomepage.php');
    } elseif($status == 'No'){
        $update = "UPDATE health_declaration_form SET covid_infection_status = 'No' WHERE health_declaration_form.id_number = $id_number";
        mysqli_query($db, $update);
        $delete =  "DELETE FROM negative_test WHERE id_number = $id_number";
        mysqli_query($db, $delete);

        //Send Email
        $email_sql = "SELECT contact_info.email_address FROM contact_info WHERE id_number = $id_number";
        $email_result = mysqli_query($db, $email_sql);

        if(mysqli_num_rows($email_result) == 1){
            while($row = mysqli_fetch_assoc($email_result)){
                $email = $row['email_address'];
                $subject = "Negative COVID-19 Test Result: Approval and Next Steps";
                $body = "Dear Student,
                I hope this email finds you well. I wanted to inform you that your recent COVID-19 test result indicating a negative diagnosis has been reviewed and approved.
                
                This negative result suggests that you are currently not infected with the COVID-19 virus. However, it is still important to remain vigilant and adhere to the recommended safety measures to protect yourself and others.
                
                If you have any concerns or require further information, please feel free to reach out to us. We are here to assist you.
                
                Take care,
                ACTSafe Team
                ";
                $headers = "actsafe2023@gmail.com";
                
                if ( mail($email, $subject, $body, $headers)) {
                    echo("Email successfully sent to $email...");
                } else {
                    echo("Email sending failed...");
                }
            }
        header('location: adminHomepage.php');
        }
    }
}

//deleteStudent
if (isset($_POST['deleteStudent'])) {
    $deleteStudentInfo =  "TRUNCATE student_user_info";
    mysqli_query($db, $deleteStudentInfo);
    $deleteStudentUser =  "DELETE FROM user WHERE user_type = 'Student'";
    mysqli_query($db, $deleteStudentUser);
        header('location: DeleteMultipleUsers.php');
}

//deleteStaff
if (isset($_POST['deleteStaff'])) {
    $deleteStaffInfo =  "TRUNCATE staff_user_info";
    mysqli_query($db, $deleteStaffInfo);
    $deleteStaffUser =  "DELETE FROM user WHERE user_type = 'Staff'";
    mysqli_query($db, $deleteStaffUser);
        header('location: DeleteMultipleUsers.php');
}

///////////////////////////////////////////////////  GATE MODULE  ///////////////////////////////////////////////////
if(isset($_POST['searchEntrance']))
{
    $search = $_POST['searchEntrance'];

    $query = "SELECT * FROM entry_log WHERE id_number = '$search'";
    $result = mysqli_query($db, $query);

    //check if row with id number is created
    if(mysqli_num_rows($result) == 1) {
        //edit later
        $update = "UPDATE entry_log, temp
        SET entry_log.temperature = temp.temp, 
        entry_log.entry_timedate = temp.date_time
        WHERE entry_log.id_number = $search AND temp.id = 119";
         mysqli_query($db, $update);

         $select = "SELECT * FROM user WHERE id_number='$search'";
         $user_details = mysqli_query($db, $select);
         }elseif(mysqli_num_rows($result) == 0) {
         $insert = "INSERT INTO entry_log (id_number, temperature, entry_timedate) 
         SELECT $search, temp, date_time FROM temp WHERE ID = '119';";
         mysqli_query($db, $insert);

         $select = "SELECT * FROM user WHERE id_number='$search'";
         $user_details = mysqli_query($db, $select);                
     }   
    
}


if(isset($_POST['searchExit'])){
    $search = $_POST['searchExit'];

    $query = "SELECT * FROM exit_log WHERE id_number = '$search'";
    $result = mysqli_query($db, $query);

    //check if row with id number is created
    if(mysqli_num_rows($result) == 1) {
        //edit later
        $update = "UPDATE exit_log, temp
        SET exit_log.temperature = temp.temp, 
        exit_log.entry_timedate = temp.date_time
        WHERE exit_log.id_number = $search AND temp.id = 119";
        mysqli_query($db, $update);
        $select = "SELECT * FROM user WHERE id_number='$search'";
        $user_details = mysqli_query($db, $select);

    } elseif(mysqli_num_rows($result) == 0) {
        $insert = "INSERT INTO exit_log (id_number, temperature, exit_timedate) 
        SELECT $search, temp, date_time FROM temp WHERE ID = '119';";
        mysqli_query($db, $insert);

        $select = "SELECT * FROM user WHERE id_number='$search'";
        $user_details = mysqli_query($db, $select);                
        }   

    
    
}

?>