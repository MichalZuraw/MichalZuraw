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
    <meta charset="utf-8">
    <link rel="stylesheet" href="tekst.css" type = "text/css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Hanalei+Fill&display=swap" rel="stylesheet">
    
    <title></title>
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
   <div id="kontener">
     <div class="tile0" >
     <center><div id="logo">Historia kakao</div></center>
     </div>
     <br>
     <br>
     <div id="Text">
    <br>  <p> Historia kakao sięga czasów Azteków, wtedy to podczas obrzędów religijnych,
  ówcześni ludzi pili oszałamiający napój kakaowy zwany cacahuatl. Ziarna kakaowca były
  tak cenne, że służyły jako środek płatniczy. Do Europy ziarno kakaowca dotarło za sprawą
  Hiszpanów, wtedy to napój pity był tylko na dworze królewskim. Pierwsza znana wzmianka
  o "braciach Van Houten sprzedających na rynku w Amsterdamie najlepszy i najczystszy
  puder kakaowy" pochodzi z haarlemskiej gazety (Oprechte Haerlemsche Courant) z 2
  sierpnia 1667 roku. Dopiero w 1828 roku Casparus van Houten opracował
  i opatentował niedrogi sposób wyciskania i oddzielania tłuszczu z palonych ziaren
  kakaowych. Udało mu się wytworzyć proszek, łatwo łączący się z wodą lub mlekiem, który
  nazwał "pożywieniem przepisywanym przez lekarzy". Od tej pory kakao stało się bardziej
  dostępne cenowo.
  <br>
  <br>
  Obecnie kakao produkowane jest w plantacjach podrównikowych: w Afryce, w
  Ameryce Południowej oraz Azji. Pozyskuje się je z nasion drzewek wiecznie zielonych,
  owoce kakaowca zrywa się i rozcina aby wydobyć ziarna. Następnie poddawane są
  procesowi fermentacji przez około 6 dni. Dzięki temu procesowi zyskuje się
  charakterystyczny aromat kolor oraz smak. Wyselekcjonowane ziarna poddawane są
  procesom palenia prażenia oraz mielenia. W ten sposób powstaje masa kakaowa, którą
  rozdziela się na masło kakaowe oraz proszek kakaowy.
  </p>
     </div>
     <a href="https://pl.wikipedia.org/wiki/Kakao" target="_blank" style="color:white; text-decoration:none;"  >
     <div>
       <br>
      Przeczytaj więcej na: wikipedia
       <br>
    </div>
    <a href="https://www.decomorreno.pl" target="_blank" style="color:white; text-decoration:none;"  >
    <div>
      <br>
     Dowiedz się więcej na: decomorreno
      <br>
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
