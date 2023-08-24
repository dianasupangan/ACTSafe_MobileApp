<?php include('server.php');
  include('header.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Log In</title>
</head>

<body style="background: #F8F8FF;">

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <div class="logo mr-auto">
        <h1><a href="index.php"></a><img src="assets/img/FINAL LOGO.png" alt="" class="img-fluid"></h1>
      </div>
    </div>
  </header><!-- End Header -->

  <br/> <br/>

  <main id="main">
    <section class="inner-page">
        <div class="container-fluid">
            <div>
                <div class="container-fluid text-center text-md shadow p-3 mb-5 bg-white rounded" style="width: 50%; margin-left: auto; margin-right: auto; background-color: white;">

                    <br/>
                    <div class="header">
                        <h2>Log In</h2>
                    </div>

                    <form method="POST" action="index.php" style="margin: 0px 1px 0px;">

                        <!-- display validation error -->
                        <?php include('errors.php') ?>

                        <div class="form-group">
                        <label>Admin ID</label>
                            <input class="form-control" type="text" name="admin_id">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" type="password" name="password">
                        </div>
                         <br>
                        <div class="form-group">
                            <button type="submit" name="login" class="btn btn-success">Log In</button>
                        </div>
                    </form>
                </div>
            </div>
      </div>
    </section>

  </main><!-- End #main -->
</body>

</html>