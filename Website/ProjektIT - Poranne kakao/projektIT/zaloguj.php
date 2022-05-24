<?php
session_start();
require_once "config.php";
$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);
if($polaczenie->connect_errno!=0) 
    {
        echo "Error:".$polaczenie->connect_errno;
    }
else
{

 $login = $_POST['login'];
 $haslo = $_POST['haslo'];
    
 $login = htmlentities($login, ENT_QUOTES, "UTF-8");
    
    $sql="SELECT * FROM uzytkownicy WHERE user='$login'";
    
    if($rezultat = @$polaczenie->query($sql))
    {
        $ilu_userow = $rezultat->num_rows;
        if($ilu_userow>0)
        {
            $wiersz=$rezultat->fetch_assoc();
            if(password_verify($haslo, $wiersz['pass']))
            {
                $_SESSION['zalogowany']=true;

                $_SESSION['id'] = $wiersz['id'];
                $_SESSION['user'] = $wiersz['user'];
                unset($_SESSION['blad']);
                $rezultat->free();
                header('Location: website.php');
            }
            else
                {
                    $_SESSION['blad']='<span style="color:red">Nieprawidłowy login lub hasło!</span>';
                    header('Location: formularzzalogowania.php');
                }
        }
        else
        {
            $_SESSION['blad']='<span style="color:red">Nieprawidłowy login lub hasło!</span>';
            header('Location: formularzzalogowania.php');
        }
    }
    $polaczenie->close();
}
?>