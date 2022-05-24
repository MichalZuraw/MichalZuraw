<?php
session_start();
if(!isset($_SESSION['udanarejestracja']))
    {
        header('Location: website.php');
        exit();
    }
    else
    {
        unset($_SESSION['udanarejestracja']);
    }

?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Poranne Kakao</title>
    <meta name="description" content="Zrób swoje własne kakao" />
    <meta name="keywords" content="kakao, picie, jedzenie, spokój" />
    <link rel="stylesheet" href="website.css" type = "text/css"/>
<style>
    
.dot {
  margin-top:200px;
  height: 400px;
  width: 400px;
  background-color: darkolivegreen;
  border-radius: 40%;
  display: inline-block;
}
    
</style>
</head>

<body>
<center>
<div style="text-align:center">
<span class="dot">
 <br/><br/><br/><br/> <br/>
 Dziękujemy za rejestrację! <br/>Możesz się zalogować!
 <br/> <br/> <br/>
 <a href="formularzzalogowania.php" style="color:white; text-decoration:none;">
    <center>
     <div class="tile7">
         <div id="zalogujwitamy">
             <b>Zaloguj się</b>
         </div>
    </div>
    </center>
</a>
</span>
</div>
</center>
</body>
</html>
