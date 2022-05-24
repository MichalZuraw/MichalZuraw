<?php
session_start();
include "config.php";
 mysqli_report(MYSQLI_REPORT_STRICT);
if(isset($_POST['porcja']))
    {
        $porcja=$_POST['porcja'];    
        $temperatura=$_POST['temperatura'];
    }    

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
            $wolny=$wiersz['wolny'];
            $przycisk=$wiersz['przycisk'];
                if($wolny=='1' && $przycisk=='2'){
                    if($polaczenie->query("INSERT INTO zamowienia VALUES (NULL, '{$_SESSION['user']}', '$porcja', '$temperatura', 'w trakcie')"))
                    {
                            $sql = "UPDATE stan SET wolny=0, user='{$_SESSION['user']}', przycisk='0' WHERE id='1'";
                            $polaczenie->query($sql);
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
header ('Location: zrobkakao.php');
?>