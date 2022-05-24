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
            $sql="SELECT porcje, temperatura FROM zamowienia WHERE id=(SELECT MAX(id) FROM zamowienia)";
            $rezultat=$polaczenie->query($sql);
            $wiersz=$rezultat->fetch_assoc();
            
            $dane = array (
            "porcje" => $wiersz['porcje'],
            "temperatura" => $wiersz['temperatura']            
            );
            header('Content-Type:application/json');
            echo json_encode($dane);
            
        $polaczenie->close();
        }
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Błąd serwera! Przepraszamy za niedogodności!</span>';
        echo '<br/>'.$e;
    
    }
?>