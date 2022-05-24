
<?php
session_start();
if(!isset($_SESSION['zalogowany']))
{
 header ('Location: website.php');
}
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
<html lang="pl">
<head>
 
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Skaczace ziarno kakaowca</title>
  <link rel="stylesheet" href="gra.css">
</head>
<body>
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
  <div class="tile">
       <div id="logo">Skaczące ziarno kakaowca!</div>
       <br/>
       Aby rozpocząć naciśnij START. Aby skoczyć wciśnij dowolna litere! <br>
       <input value="START" id="przycisk"  class="favorite styled" type="button" onclick="ani()" size="10" margin="auto" />
  <div id="game">
    <div id="dino"></div>
    <div id="rock"></div>
  </div>
  <h1 id="score">0</h1>
  <script src="gra.js"></script>
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
