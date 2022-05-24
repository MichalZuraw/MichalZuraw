<?php
session_start();
if(isset($_SESSION['zalogowany']) && ($_SESSION['zalogowany']==true))
{
    header('Location: website.php');
    exit();
}
if(isset($_POST['email'])){
{
    //udana walidacja
    $wszystko_OK=true;
    
    //Sprawdz poprawnosc nicku
    $nick=$_POST['nick'];
        if(strlen($nick)<3 || (strlen($nick)>11))
        {
            $wszystko_OK=false;
            $_SESSION['e_nick']="Nick musi posiadać od 3 do 10 znaków!";
        }
        if(ctype_alnum($nick)==false)
        {
            $wszystko_ok=false;
            $_SESSION['e_nick']="Nick może składać się tylko z liter i cyfr!";
        }
    //Sprawdz poprawnosc adresu e-mail
    $email=$_POST['email'];
    $emailB= filter_var($email, FILTER_SANITIZE_EMAIL);
    
    //test walidacyjny    
        if((filter_var($emailB, FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
        {
            $wszystko_OK=false;
            $_SESSION['e_email']="Podaj poprawny adres e-mail!";
        }
    $haslo1=$_POST['haslo1'];
    $phaslo=$_POST['phaslo'];
        if(strlen($haslo1)<5 || (strlen($haslo1)>21))
        {
            $wszystko_OK=false;
            $_SESSION['e_haslo1']="Hasło musi posiadać od 5 do 20 znaków!";
        }
    
        if($phaslo!=$haslo1)
        {
            $wszystko_OK=false;
            $_SESSION['e_phaslo']="Podane hasła nie są identyczne!";
        }
    
    $haslo_hash=password_hash($haslo1,PASSWORD_DEFAULT);
    
    
        if(!isset($_POST['regulamin']))
        {
            $wszystko_OK=false;
            $_SESSION['e_regulamin']="Potwierdź akceptację regulaminu!";
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
        else
        {   
            // czy mail jest juz zarezerwowany
            $rezultat=$polaczenie->query("SELECT id FROM uzytkownicy WHERE email='$email'");
            if(!$rezultat) throw new Exception($polaczenie->error);
            
            $ile_takich_maili = $rezultat->num_rows;
            if($ile_takich_maili>0)
            {
                $wszystko_OK=false;
                $_SESSION['e_email']="Istnieje już konto przypisane do tego adresu e-mail!";
            }
            // czy nick jest juz zarezerwowany
            $rezultat=$polaczenie->query("SELECT id FROM uzytkownicy WHERE user='$nick'");
            if(!$rezultat) throw new Exception($polaczenie->error);
            
            $ile_takich_nickow = $rezultat->num_rows;
            if($ile_takich_nickow>0)
                {
                    $wszystko_OK=false;
                    $_SESSION['e_nick']="Istnieje już konto o takim loginie!";
                }
            if($wszystko_OK==true)
                {
                    if($polaczenie->query("INSERT INTO uzytkownicy VALUES(NULL, '$nick', '$haslo_hash', '$email')"))
                        {
                            $_SESSION['udanarejestracja']=true;
                            header ('Location: witamy.php');
                        }
                else 
                        {
                            throw new Exception($polaczenie->error);
                        }
                }
            $polaczenie->close();
        }
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Błąd serwera! Przepraszamy za niedogodności!</span>';
       echo '<br/>'.$e;
    }
        

}
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
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
 .error{
        color:red;
        font-size:15px;
    }
</style>
</head>

<body>
    
    <form method="post">
    <center>
    <div style="text-align:center">
    <span class="dot">
    <br/>
    Login: <br/> <input type ="text" name="nick" /><br/>
    <?php
        if(isset($_SESSION['e_nick']))
        {
            echo '<div class= "error">'.$_SESSION['e_nick'].'</div>';
            unset ($_SESSION['e_nick']);
        }
        ?>
    
    E-mail: <br/> <input type ="text" name="email" /><br/>
    <?php
        if(isset($_SESSION['e_email']))
        {
            echo '<div class= "error">'.$_SESSION['e_email'].'</div>';
            unset ($_SESSION['e_email']);
        }
        ?>
    
    Hasło: <br/> <input type ="password" name="haslo1" /><br/>
    <?php
        if(isset($_SESSION['e_haslo1']))
        {
            echo '<div class= "error">'.$_SESSION['e_haslo1'].'</div>';
            unset ($_SESSION['e_haslo1']);
        }
        ?>
    
    Powtórz hasło: <br/> <input type ="password" name="phaslo" /><br/>
    <?php
        if(isset($_SESSION['e_phaslo']))
        {
            echo '<div class= "error">'.$_SESSION['e_phaslo'].'</div>';
            unset ($_SESSION['e_phaslo']);
        }
        ?>
    
    <label>
    <input type="checkbox" name="regulamin" /> Akceptuję regulamin
    </label>
        <?php
        if(isset($_SESSION['e_regulamin']))
        {
            echo '<div class= "error">'.$_SESSION['e_regulamin'].'</div>';
            unset ($_SESSION['e_regulamin']);
        }
        ?>
    
            <label>
            <input type="submit" name="akcept">
            <img src="http://placehold.jp/24/cc9999/993333/200x50.png?text=Stwórz konto">
            </label>
    </span>
    <a href="website.php" style="color:white; text-decoration:none;"  >
    <div class="tile8">
        <div id="stronaglowna">Strona główna</div>
    </div>
        </a>
    </div>
    </center>
    </form>

</center>
</body>
</html>
