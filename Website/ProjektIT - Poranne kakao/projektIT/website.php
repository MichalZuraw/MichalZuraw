<?php
session_start();
require_once "config.php";
mysqli_report(MYSQLI_REPORT_STRICT);
    try
    {
        $polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
        if($polaczenie->connect_errno!=0)
        {
            throw new Exception(mysqli_connect_errno());
        }

        $sql="SELECT * FROM stan WHERE id='1'";
        if($rezultat = @$polaczenie->query($sql)){
            $wiersz=$rezultat->fetch_assoc();
        }
        $polaczenie->close();
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Błąd serwera! Przepraszamy za niedogodności!</span>';
       echo '<br/>'.$e;
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
    <link rel="stylesheet" href="css/fontello.css" type = "text/css"/>
    <script type="text/javascript" src="zegar.js"></script>
    <script type="text/javascript" src="dzien.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
</head>

<body onload="zegar(); dzien()">
     <div class="oddzielacz">
    <?php
            if(isset($_SESSION['user'])) {
             echo "<p> Witaj, ".$_SESSION['user'].'!';
            }
                     if(!isset($_SESSION['user'])) {
             echo "<p> ";
            }
     ?>
     </div>
    <?php
    if(isset($_SESSION['user'])){
    if($wiersz['przycisk']==1 && $wiersz['user']==$_SESSION['user'] && $wiersz['wolny']== 1)
    {
     echo '<div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <span class="close">&times;</span>
          <h2><center>Uwaga!</center></h2>
        </div>
        <div class="modal-body">
          <p><center>Twoje kakao jest gotowe!</center></p>
        </div>
        <div class="modal-footer">
        <a href="zrobkakao.php" style="color:white; text-decoration:none;">
        <p><center>Naciśnij, aby odebrać!</center></p>
        </a>
        </div>
      </div>
    </div>';
    }
    }
    ?>
 <div id="container">

         <div class="tile0">
         <center><div id="logo">Poranne kakao</div></center>
         </div>
    <div style="clear:both"></div>


     <div class="kwadrat">
             <a href="Historiakakao.php" style="color:white; text-decoration:none;">
              <div class="tile4">
              <div id="historia">Historia <br> kakao</div></center>
              </div>
             </a>
             <a href="Oprojekcie.php" style="color:white; text-decoration:none;">
              <div class="tile4">
              <div id="historia">O <br> projekcie</div></center>
              </div>
             </a>
             <a href="Oautorach.php" style="color:white; text-decoration:none;">
              <div class="tile4">
              <div id="historia">O <br> autorach</div></center>
              </div>
            </a>
   </div>
    <div class="duzy">
          <a href="zrobkakao.php" style="color:white; text-decoration:none;">
          <div class="tile1">
          <div id="kakao"><b>Stwórz <br> pyszne <br> kakao!</b></div>
          <center><i class="icon-emo-coffee"></i></center>
          <?php
    if(!isset($_SESSION['user'])) {
     echo '<center><div id="tylkodlazalogowanych1">Tylko dla zalogowanych </div></center>';
    }
     ?>

          </div>
          </a>
   </div>
     <div class="square">
           <div class="tile2">
           <center><div id="zegar"></div></center>
           <center><div id="dzien"></div></center>
           </div>
           <a href="gra.php" style="color:white; text-decoration:none;">
           <div class="tile3">
           <div id="skaczacekakao"><b>Skaczące <br> ziarno</b></div>

          <center><i class="icon-gamepad"></i></center>
          <?php
    if(!isset($_SESSION['user'])) {
     echo '<center><div id="tylkodlazalogowanych2">Tylko dla zalogowanych </div></center>';
    }
     ?>
          </div></a>
    </div>
     <div class="prostokat">

       <a href="logout.php" style="color:white; text-decoration:none;">
        <?php
            if(isset($_SESSION['user'])) {
                   echo '<div class="tile5"><center><div id="zaloguj"><b>Wyloguj się</b></div></center></div>';
    }
           ?>
        </a>
        <a href="formularzzalogowania.php" style="color:white; text-decoration:none;">
        <?php
           if(!isset($_SESSION['user'])) {
                 echo '<div class="tile5"><center><div id="zaloguj"><b>Zaloguj się</b></div></center></div>';
               unset($_SESSION['blad']);
    }
     ?>
         </a>
         </a>
         <a href="formularzrejestracji.php" style="color:white; text-decoration:none;">
         <div class="tile6">
         <div id="zaloguj"><b>Zarejestruj się</b></div>
         </div>
         </a>
    </div>
<div style="clear:both"></div>
 </div>
</body>



<script>

var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];

modal.style.display = "block";


span.onclick = function() {
  modal.style.display = "none";
}


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
