<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';
$config = parse_ini_file('AdminWeb_07_18/file/file.ini', true);

if(isset($_POST["send"])){
    $mail = new PHPMailer(true);
    $mail ->isSMTP();
    $mail ->Host = 'smtp.gmail.com';
    $mail ->SMTPAuth = true;
    $mail->Username = $config['email']['username'];
    $mail->Password = $config['email']['password'];
    $mail ->SMTPSecure = 'ssl';
    $mail ->Port = 25;

    $mail ->setFrom('actsafe2023@gmail.com'); 

    $mail ->addAddress($_POST["email"]);

    $mail ->isHTML(true);
    $mail ->Subject =$_POST["subject"];
    $mail ->Body =$_POST["message"];

    $mail ->send();
    "
    <script>
    alert('Sent Successful');
    document.location.href ='adminHomepage.php';
    </script>
    ";

}
?>