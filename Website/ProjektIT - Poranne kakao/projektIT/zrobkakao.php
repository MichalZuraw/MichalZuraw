<?php
    session_start();          
if(!isset($_SESSION['zalogowany']))
    {
     header ('Location: website.php');   
     exit();
    }
    require_once "config.php";
    

    try
    {
        $polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
        if($polaczenie->connect_errno!=0) 
        {
            throw new Exception(mysqli_connect_errno());
        }
        else
        {
            $sql = "SELECT * FROM stan WHERE id='1';";
            $result=$polaczenie->query($sql);       
            $wiersz=$result->fetch_assoc(); 
            $_SESSION['przycisk']=$wiersz['przycisk'];
            $wolny=$wiersz['wolny'];
            $zajetyuser=$wiersz['user'];
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
    <meta http-equiv="refresh" content="60">
    <title>Poranne Kakao</title>
    <link rel="stylesheet" href="zrobkakao.css" type = "text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Zrób swoje własne kakao" />
    <meta name="keywords" content="kakao, picie, jedzenie, spokój" />  
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script src="jquery-3.5.1.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
    $( function() {
      $( "#slider" ).slider({
    value:50,
    min: 25,
    max: 75,
    step: 1,
    slide: function( event, ui ) {
      $( "#amount" ).val( ui.value + "°C" );
    }
  });
  $( "#amount" ).val( $( "#slider" ).slider("value")+"°C");
} 
     );
</script>

</head>   
    <body>
    <div id="container">
    <div class="dot">
     <div class="rectangle">
            <button id="myBtn" class="button" >Ostatnie zamówienia</button>
            <div id="myModal" class="modal">
                      <div class="modal-content">
                        <div class="modal-header">
                          <span class="close">&times;</span>
                          <h2>Ostatnie zamówienia</h2>
                        </div>
                        <div class="modal-body">
                          <p>             <?php       
            $polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
            if($polaczenie->connect_errno!=0) 
            {
            throw new Exception(mysqli_connect_errno());
            }
             else{
            $sql = "SELECT * FROM zamowienia ORDER BY id DESC LIMIT 10";
            $wynik=$polaczenie->query($sql);       
             echo '<table cellspacing="5" cellpadding="5"><tr><th>ID</th><th>User</th><th>Porcje</th><th>Temperatura</th><th>Stan</th></tr>';
                while($row = $wynik->fetch_assoc()) {
                     echo "<tr><td>{$row['id']}</td><td>{$row['user']}</td><td>{$row['porcje']}</td><td>{$row['temperatura']}</td><td>{$row['stan']}</td></tr>";
                }     
             echo '</table>';
            $polaczenie->close();
             }
             ?></p>
                        </div>
                        <div class="modal-footer">
                        </div>
                      </div>

            </div>
         <div class="tile1">
            <div id="kakao"><b>Stwórz swoje kakao!</b></div>
            
         </div>
     </div> 
     <div class="rectangle2">
             <div id="kakao" >Wybierz ilość porcji</div> 
        </div>
    <form action="sendtobaza.php" method="post">
     <div class="rectangle3">
        <label>
                <input type="radio" name="porcja" value="1" checked>
                <img src="http://placehold.jp/24/cc9999/993333/70x70.png?text=1">
        </label>
        <label>
                <input type="radio" name="porcja" value="2">
                <img src="http://placehold.jp/24/cc9999/993333/70x70.png?text=2">
        </label>
        </div>
        <div class="rectangle4">
                   <div id="kakao" >Ustal temperaturę</div> 

        </div>
        <div class="rectangle5">
           <div class="suwak">
            <div id="slider"> </div>
            <input type="text" name="temperatura" id="amount" size="2" readonly style="border:0; color:white;font-size:20px; font-family: 'Montserrat', sans-serif; text-align: center; background-color:darkolivegreen; font-weight:bold; padding-top:5px;">
            </div>
        </div>
        <div class="rectangle6">
           <label>
            <input type="submit" name="akcept" value="Stwórz!">
            <img src="http://placehold.jp/24/cc9999/993333/200x50.png?text=Stwórz">
            </label>
        </form>
        </div>
         <div class="rectangle7">
             <?php
             
                 if($_SESSION['przycisk']==0){
                         echo '<span style="color:yellow;">Trwa przygotowywanie kakao użytkownika </span>';
                         echo '<span style="color:blue;">'.$zajetyuser.'</span>';
                 }
                 if($_SESSION['przycisk']==1){
                         echo '<span style="color:white;">Gotowe kakao użytkownika </span>';
                         echo '<span style="color:blue;">'.$zajetyuser.'</span>';
                 }

                if($_SESSION['przycisk']==2)
                 {
                        echo '<span style="color:white;">Oczekiwanie... </span>'; 
                 }
             ?>
        </div>
             <div class="rectangle8">
                 <?php
                if(($zajetyuser==$_SESSION['user'])&& $_SESSION['przycisk']==1 && $wolny==1)
             {
                echo '<span style="font-size:32px;color:red";>Poinformuj nas, że odebrałeś kakao!</span>';
                echo '<br/>';
                echo '
                <form action="przycisk.php" method="post">
                <a 
                 href="przycisk.php" style="color:white; text-decoration:none;">
                <input type="submit" name="akcept">
                <img src="http://placehold.jp/24/000000/FFFFFF/200x50.png?text=Kakao odebrane!">
                </label>
                </a>
                </form>
                ';
             }
                 ?>
             </div>
          </div>
          <div class="rectangle9">
         <div class="tile2">
                 <a 
                 href="website.php" style="color:white; text-decoration:none;"  >
                 <div id="menu">Strona główna</div>
                 </a>
         </div>
         <div class="tile3">
                <a href="gra.php" style="color:white; text-decoration:none;"  >
         <div id="menu">Zagraj w ziarno!</div>
      </a>
    </div>
 </div>
</div>
</body>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
