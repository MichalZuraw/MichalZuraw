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
<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
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
    <meta charset="utf-8">
    <link rel="stylesheet" href="tekst.css" type = "text/css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Hanalei+Fill&display=swap" rel="stylesheet">
    <title></title>
  </head>
  <body>
   <div id="kontener">
     <div class="tile0">
     <center><div id="logo">O Autorach</div></center>
     </div>
     <div class="tile4">
       Marcin Bochenek
       <img src="marcin.jpg" width="400px" height="600px" >
       <br>
       Dla zainteresowanych współpracą
       <br>
        <a href="marcin_cv.pdf" target="_blank" style="color:white; text-decoration:none;"  >
          <div class="tile5">
           <div id="logo">CV</div>
         </div>
       </a>
     </div>
     <div class="tile4">
    <div id="zuraw">Michał Żurawka</div>
       <img src="michal.jpg" width="400px" height="600px" style ="float:right" >
       
        <div id="zuraw">Dla zainteresowanych współpracą</div>
        <a href="michal_cv.pdf" target="_blank" style="color:white; text-decoration:none;"  >
          <div class="tile6">
           <div id="logo">CV</div>
         </div>
       </a>
   </div>
     <div style="clear:both"></div>
     <div>
      <br>
     </div>
    </a>
     <div class="tile2">
        <a href="website.php" style="color:white; text-decoration:none;"  >
         <div id="logo">Strona główna</div>
         </a>
     </div>
     <div class="tile3">
        <a href="zrobkakao.php" style="color:white; text-decoration:none;"  >
         <div id="logo">Stwórz kakao!</div>
         </a>
     </div>
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
