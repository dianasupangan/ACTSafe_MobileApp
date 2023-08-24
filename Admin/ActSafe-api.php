<?php
$db = mysqli_connect( 'localhost', 'id20438063_actsafe', '$9gPi-4h[Q1C\n{&', 'id20438063_isproj2' );

if(!$db)
{
   header("Content-Type: JSON");
    $response['status'] = 'Can\'t connect to Database';
    echo json_encode($response,JSON_PRETTY_PRINT);
}

if(isset($_POST["state"])){

    //Log In
    if ($_POST["state"] == "state_login"){
        $id_number = $_POST['id_number'];
        $password = $_POST['password'];
        $sql = "SELECT * FROM user WHERE id_number = '$id_number' AND password = '$password'";
        $result = mysqli_query($db,$sql);
        if(mysqli_num_rows($result) == 1){
            header("Content-Type: JSON");
            while($row = mysqli_fetch_assoc($result)){
                $response['id'] = $row['id_number'];
                $response['device_id'] = $row['uuid'];
                $response['first_name'] = $row['first_name'];
                $response['last_name'] = $row['last_name'];
                $response['user_type'] = $row['user_type'];
                $response['password'] = $row['password'];

                $is_active = "SELECT * FROM health_declaration_form WHERE id_number = '$id_number'";
                $is_active_result = mysqli_query($db,$is_active);  
                if(mysqli_num_rows($is_active_result) == 1){
                    $response['is_active'] = 'True';
                } else if(mysqli_num_rows($is_active_result) == 0){
                    $response['is_active'] = 'False';
                }

                $response['rows'] = mysqli_num_rows($result);
                $response['status'] = 'Success';
            }
            echo json_encode($response,JSON_PRETTY_PRINT);

        } elseif(mysqli_num_rows($result) < 1){
            header("Content-Type: JSON");
            $response['status'] = 'Invalid account';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }else {
            
            header("Content-Type: JSON");
            $response['status'] = 'Can\'t connect to Database';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    // Covid Infection Status
    if ($_POST["state"] == "state_check_health_declaration"){

        //Delete old data
        $delete_old_data = "DELETE FROM scanned_devices
        WHERE STR_TO_DATE(date, '%m/%d/%Y') < DATE_SUB(NOW(), INTERVAL 2 WEEK);";
        mysqli_query($db,$delete_old_data);  
        
        //Check covid and exposure status
        $id_number = $_POST['id_number'];
        $covid_status = "SELECT exposed, covid_infection_status, exposed_date FROM `health_declaration_form` WHERE id_number = '$id_number'";
        $covid_status_result = mysqli_query($db,$covid_status);  
        if(mysqli_num_rows($covid_status_result) == 1){
            header("Content-Type: JSON");
            while($row = mysqli_fetch_assoc($covid_status_result)){
                //Get date of exposre
                $exposure_date = new DateTime(($row['exposed_date']));
                $date_today = new DateTime(date('m/d/Y'));
                $abs_diff = $exposure_date->diff($date_today)->format("%a");
                $exposure_status = $row['exposed'];

                if($exposure_status == "Yes" && $abs_diff > 14){
                    $response['exposed'] = "No";
                } else {
                    $response['exposed'] = $row['exposed'];
                }

                $response['covid_infection_status'] = $row['covid_infection_status'];
                $response['status'] = "Success";
                echo json_encode($response,JSON_PRETTY_PRINT);
            }
        } else if(mysqli_num_rows($covid_status_result) == 0){
            $response['exposed'] = 'No';
            $response['covid_infection_status'] = 'No';
            $response['status'] = "Success";
            echo json_encode($response,JSON_PRETTY_PRINT);

        }else {
            
            header("Content-Type: JSON");
            $response['status'] = 'Can\'t connect to Database';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Initial Contact Information
    else if ($_POST["state"] == "state_initial_contact_info"){
        $id_number = (int)$_POST['id_number'];
        $phone_number = (int)$_POST['phone_number'];
        $email_address = $_POST['email_address'];
        
        //Guardian info
        $guardian_id = $_POST['guardian_id'];
        $first_name = (int)$_POST['first_name'];
        $last_name = $_POST['last_name'];
        $salutation = (int)$_POST['salutation'];
        $relationship = $_POST['relationship'];
    
        //Guardian Contact
        $g_phone_number = (int)$_POST['g_phone_number'];
        $g_email_address = $_POST['g_email_address'];
    
        $contact_sql = "INSERT INTO `contact_info` (`id_number`, `phone_number`, `email_address`) VALUES ('$id_number', '$phone_number', '$email_address');";
        $contact = mysqli_query($db,$contact_sql);
        $ginfo_sql = "INSERT INTO `guardian` (`guardian_id`, `id_number`, `first_name`, `last_name`, `salutation`, `relationship`) VALUES ('$guardian_id', '$id_number', '$first_name', '$last_name', '$salutation', '$relationship');";
        $ginfo = mysqli_query($db,$ginfo_sql);
        $ginfo_contact_sql = "INSERT INTO `guardian_contact_info` (`guardian_id`, `phone_number`, `email_address`) VALUES ('$guardian_id', '$g_phone_number', '$g_email_address');";
        $ginfo_contact = mysqli_query($db,$ginfo_contact_sql);
    
        if($ginfo){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Initial Health Declaration
    else if ($_POST["state"] == "state_initial_health_dec"){
        $id_number = (int)$_POST['id_number'];
        $covid_exposure_status = 'No';
        $date_today = date('m/d/Y');
        $covid_infection_status = 'No';
        $contact_infected = $_POST['contact_infected'];
        $traveled_overseas = $_POST['traveled_overseas'];
        $contact_overseas_travel = $_POST['contact_overseas_travel'];
    
        // echo $id_number . ' ' . gettype($date_today) . ' ' . $covid_infection_status . ' ' . $contact_infected . ' ' . $traveled_overseas . ' ' . $contact_overseas_travel;
    
        $sql = "INSERT INTO `health_declaration_form` (`id_number`, `exposed`, `exposed_date`, `covid_infection_status`, `contact_infected`, `traveled_overseas`, `contact_overseas_travel`) VALUES ($id_number, '$covid_exposure_status', '$date_today', '$covid_infection_status', '$contact_infected', '$traveled_overseas', '$contact_overseas_travel');";
    
        $edit = mysqli_query($db,$sql);
    
        if($edit){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Initial Symptoms
    else if ($_POST["state"] == "state_initial_symptoms"){
        $id_number = (int)$_POST['id_number'];
        $fever = $_POST['fever'];
        $dry_cough = $_POST['dry_cough'];
        $fatigue = $_POST['fatigue'];
        $bodyaches = $_POST['bodyaches'];
        $runny_nose = $_POST['runny_nose'];
        $sore_throat = $_POST['sore_throat'];
        $breath_shortness = $_POST['breath_shortness'];
        $diarrhea = $_POST['diarrhea'];
        $headache = $_POST['headache'];
        $loss_smell_taste = $_POST['loss_smell_taste'];
        $date_today = date('m/d/Y');
    
        
    
        $sql = "INSERT INTO `symptoms_form` (`id_number`, `fever`, `dry_cough`, `fatigue`, `bodyaches`, `runny_nose`, `sore_throat`, `breath_shortness`, `diarrhea`, `headache`, `loss_smell_taste`, `date_updated`) VALUES ($id_number, '$fever', '$dry_cough', '$fatigue', '$bodyaches', '$runny_nose', '$sore_throat', '$breath_shortness', '$diarrhea', '$headache', '$loss_smell_taste', '$date_today');";
        
        // header("Content-Type: JSON");
        // $response['sql'] = $sql;
        // echo json_encode($response,JSON_PRETTY_PRINT);
        $edit = mysqli_query($db,$sql);
    
        if($edit){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Update Contact Information update
    else if ($_POST["state"] == "state_update_contact_info"){
        $id_number = (int)$_POST['id_number'];
        $phone_number = (int)$_POST['phone_number'];
        $email_address = $_POST['email_address'];
        
        //Guardian info
        $guardian_id = $_POST['guardian_id'];
        $first_name = (int)$_POST['first_name'];
        $last_name = $_POST['last_name'];
        $salutation = (int)$_POST['salutation'];
        $relationship = $_POST['relationship'];
    
        //Guardian Contact
        $g_phone_number = (int)$_POST['g_phone_number'];
        $g_email_address = $_POST['g_email_address'];
    
        $contact_sql = "UPDATE `contact_info` SET `id_number`='$id_number',`phone_number`='$phone_number',`email_address`='$email_address' WHERE id_number=$id_number;";
        $contact = mysqli_query($db,$contact_sql);
        $ginfo_sql = "UPDATE `guardian` SET `guardian_id`='$guardian_id', `id_number`='$id_number', `first_name`='$first_name', `last_name`='$last_name', `salutation`='$salutation', `relationship`='$relationship' WHERE guardian_id='$guardian_id';";
        $ginfo = mysqli_query($db,$ginfo_sql);
        $ginfo_contact_sql = "UPDATE `guardian_contact_info` SET `guardian_id`='$guardian_id',`phone_number`='$g_phone_number',`email_address`='$g_email_address' WHERE guardian_id='$guardian_id';";
        $ginfo_contact = mysqli_query($db,$ginfo_contact_sql);
    
        if($ginfo){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Update Health Declaration
    else if ($_POST["state"] == "state_update_health_dec"){
        $id_number = (int)$_POST['id_number'];
        $contact_infected = $_POST['contact_infected'];
        $traveled_overseas = $_POST['traveled_overseas'];
        $contact_overseas_travel = $_POST['contact_overseas_travel'];

        $sql = "UPDATE `health_declaration_form` SET `contact_infected`='$contact_infected',`traveled_overseas`='$traveled_overseas',`contact_overseas_travel`='$contact_overseas_travel' WHERE id_number=$id_number;";
    
        $edit = mysqli_query($db,$sql);
    
        if($edit){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Update Symptoms
    if ($_POST["state"] == "state_update_symptoms"){
        $id_number = (int)$_POST['id_number'];
        $fever = $_POST['fever'];
        $dry_cough = $_POST['dry_cough'];
        $fatigue = $_POST['fatigue'];
        $bodyaches = $_POST['bodyaches'];
        $runny_nose = $_POST['runny_nose'];
        $sore_throat = $_POST['sore_throat'];
        $breath_shortness = $_POST['breath_shortness'];
        $diarrhea = $_POST['diarrhea'];
        $headache = $_POST['headache'];
        $loss_smell_taste = $_POST['loss_smell_taste'];
        $date_today = date('m/d/Y');
    
        
    
        $sql = "UPDATE `symptoms_form` SET `id_number`='$id_number', `fever`='$fever', `dry_cough`='$dry_cough', `fatigue`='$fatigue', `bodyaches`='$bodyaches', `runny_nose`='$runny_nose', `sore_throat`='$sore_throat', `breath_shortness`='$breath_shortness', `diarrhea`='$diarrhea', `headache`='$headache', `loss_smell_taste`='$loss_smell_taste', `date_updated`='$date_today' WHERE id_number=$id_number;";
        
        // header("Content-Type: JSON");
        // $response['sql'] = $sql;
        // echo json_encode($response,JSON_PRETTY_PRINT);
        $edit = mysqli_query($db,$sql);
    
        if($edit){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Positive Covid Test
    else if ($_POST["state"] == "state_send_positive_test"){
        $id_number = (int)$_POST['id_number'];
        $photo_link = (int)$_POST['photo_link'];
    
        $sql = "INSERT INTO `positive_test` (`id_number`, `photo_link`) VALUES ('$id_number', '$photo_link');";
        $positive_test_result = mysqli_query($db,$sql);
        
    
        if($positive_test_result){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Negative Covid Test
    else if ($_POST["state"] == "state_send_negative_test"){
        $id_number = (int)$_POST['id_number'];
        $photo_link = (int)$_POST['photo_link'];
    
        $sql = "INSERT INTO `negative_test` (`id_number`, `photo_link`) VALUES ('$id_number', '$photo_link');";
        $positive_test_result = mysqli_query($db,$sql);
        
    
        if($positive_test_result){
            header("Content-Type: JSON");
            $response['status'] = 'Success';
            echo json_encode($response,JSON_PRETTY_PRINT);
    
        } else {
            header("Content-Type: JSON");
            $response['status'] = 'Failed';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Check if a Test is Submitted
    else if ($_POST["state"] == "state_check_if_test_submitted"){
        $id_number = (int)$_POST['id_number'];
    
        $positive_test = "SELECT * FROM `positive_test` WHERE id_number = $id_number;";
        $positive_test_result = mysqli_query($db,$positive_test);

        $negative_test = "SELECT * FROM `negative_test` WHERE id_number = $id_number;";
        $negative_test_result = mysqli_query($db,$negative_test);
        
    
        if(mysqli_num_rows($positive_test_result) == 1 || mysqli_num_rows($negative_test_result) == 1){
            header("Content-Type: JSON");
            $response['test_submitted'] = 'yes';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }else {
            header("Content-Type: JSON");
            $response['test_submitted'] = 'none';
            echo json_encode($response,JSON_PRETTY_PRINT);
        }
    }

    //Scanned Device
    else if ($_POST["state"] == "state_save_ble_uuids"){
        $id_number = (int)$_POST['id_number'];
        $device_uuid = $_POST['device_uuid'];
        $date_today = date('m/d/Y');
        
        $check_scanned = "SELECT * FROM `scanned_devices` WHERE id_number = $id_number AND uuid = '$device_uuid';";
        $check_scanned_result = mysqli_query($db,$check_scanned);
        if(mysqli_num_rows($check_scanned_result) == 1){
            $update_date = "UPDATE scanned_devices SET date = '$date_today' WHERE id_number= $id_number && uuid = '$device_uuid';";
            mysqli_query($db,$update_date);
                header("Content-Type: JSON");
                $response['status'] = 'Success';
                echo json_encode($response,JSON_PRETTY_PRINT);
        
            
        } else if(mysqli_num_rows($check_scanned_result) == 0){
            $add = "INSERT INTO `scanned_devices` (`id_number`, `uuid`, `date`) VALUES ('$id_number', '$device_uuid', '$date_today');";
            $add_result = mysqli_query($db,$add);
            if($add_result){
                header("Content-Type: JSON");
                $response['status'] = 'Success';
                echo json_encode($response,JSON_PRETTY_PRINT);
        
            } else {
                header("Content-Type: JSON");
                $response['status'] = 'Failed';
                echo json_encode($response,JSON_PRETTY_PRINT);
            }
        }
    }

}
 ?>