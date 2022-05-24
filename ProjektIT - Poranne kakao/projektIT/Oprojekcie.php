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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8">
    <link rel="stylesheet" href="tekst.css" type = "text/css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Hanalei+Fill&display=swap" rel="stylesheet">
    <title></title>
  </head>
  <body>
   <div id="kontener">
     <div class="tile0">
     <center><div id="logo">O projekcie</div></center>
     </div>
     <br>
     <div id="Text">
    <br>  <p>  Głównym celem projektu jest stworzenie maszyny pozwalającej w odpowiednich
proporcjach na stworzenie napoju jakim jest kakao, a także w sposób prosty i zrozumiały, choć
niekoniecznie jawny przekazanie tej wiedzy konsumentowi.
Projekt ten jesteśmy w stanie podzielić na dwie części:
<br>
- część mechaniczną (hardware)
<br>
- część programowalną (software)
<br>
W pierwszej części zajmujemy się sprawami stricte mechanicznymi, związanymi ze
sprzętem oraz całą strukturą konceptu, obejmuje ona głównie części widoczne, które pozwalają
na stworzenie kakao oraz szeroko rozumianymi danymi tych urządzeń. Zaczynając od ich
rozmiaru, rodzaju zasilania a skończywszy na umiejscowieniu.
Druga niemniej ważna część skupia się również na sprzęcie, lecz nie od strony
mechanicznej, a od strony obsługi oraz oprogramowania. Mimo że nie widać sterowania to
właśnie ono decyduje kiedy i jak dany element ma się uruchomić. Zależy nam , aby to wszystko
mogło pracować jak jeden organizm, działało współbieżnie, bez zakłóceń. Dlatego też w ta
część obejmuje wszelkie obliczenia, testy jak i kalibrację wszelkich urządzeń
Warto również wspomnieć, iż ten projekt jest jednym z naszych pierwszych jeżeli chodzi
o taką skalę, więc wszelka nabyta wiedza pozwali na wprowadzenie ewentualnych poprawek
oraz udoskonaleń do możliwe że następnych wersji tego konceptu.
Wprowadzając element połączenia z Internetem zależy nam aby użytkownik, mógł z
większej odległości włączyć maszynę, która samodzielnie stworzy kakao oraz powiadomi
użytkownika o gotowym napoju, oczekującym na odebranie. W ten sposób pragnęliśmy
rozszerzyć działanie projektu z zwykłej maszyny, wymagającej człowieka do obsługi, do
inteligentnej maszyny przyjaznej człowiekowi i odpowiadającej na jego potrzeby, nie
wymagającej czasu na obsłużenie jej.
<br>
Tak więc nasza maszyna po wyborze parametrów, sama pobierze odpowiednią ilość mleka,
następnie nagrzeje do odpowiedniej temperatury oraz dostarczy odpowiednią porcję kakao w
proszku. Po zmieszaniu oznajmi gotowość produktu przez odpowiedni sygnał dźwiękowy orazs
świetlny.
  </p>
   </div>
  <div>
  <a href="Raport_główny.pdf" target="_blank" style="color:white; text-decoration:none;"  >
   Przeczytaj więcej.
    <br>
 </a>
     <iframe id="yt" src="https://www.youtube.com/embed/RM9h8jJh1zQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
     <iframe  id="yt" src="https://www.youtube.com/embed/tkV6j-v5ju0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
     <div style="clear:both"></div>
     <br>
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
