<?php
session_start();
include "config.php";
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
            if($polaczenie->query("UPDATE stan set wolny='1', przycisk='1';"))
               {
                   $polaczenie->query("UPDATE zamowienia set stan ='do odebrania' WHERE id=(SELECT MAX(id) FROM zamowienia)");
               }
            
        $polaczenie->close();
        }
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Błąd serwera! Przepraszamy za niedogodności!</span>';
        echo '<br/>'.$e;
    
    }
?>