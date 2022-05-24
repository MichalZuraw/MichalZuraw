<?php
session_start();
if(isset($_SESSION['zalogowany']) && ($_SESSION['zalogowany']==true))
{
    header('Location: website.php');
    exit();
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
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Hanalei+Fill&display=swap" rel="stylesheet">
    <style>
.dot {
  margin-top:200px;
  margin-bottom:auto;
  height: 400px;
  width: 400px;
  background-color: darkolivegreen;
  border-radius: 50%;
  display: inline-block;
}
</style>
</head>

<body>
    
    <form action="zaloguj.php" method="post">
    <div style="text-align:center">
    <span class="dot">
    <center>
    <br/><br/><br/><br/>
    Login: <br/> <input type="text" style="heigh" name="login"/> <br/><br/>
    Hasło: <br/> <input type="password" name="haslo"/> <br/> <br/>
                <label>
            <input type="submit" name="akcept">
            <img src="http://placehold.jp/24/cc9999/993333/200x50.png?text=Zaloguj się">
            </label>
    </form>
    <?php
    echo  '<br/> <br/>';
    if(isset($_SESSION['blad']))
            echo $_SESSION['blad'];
    ?>
    </center>
    <br></br>
    </span>
    <a href="website.php" style="color:white; text-decoration:none;"  >
    <div class="tile8">
        <div id="stronaglowna">Strona główna</div>
    </div>
    </a>
    <center>
</center>
</body>
</html>
