<?php  
    require_once "config.php";
//otwieramy polaczenie
    $polaczenie = new mysqli($host, $db_user, $db_password, $db_name);

    if($polaczenie->connect_errno!=0) 
    {
        echo "Error:".$polaczenie->connect_errno;
    }

    else
    {
     $porcja=$_POST['porcja1'];
     $temperatura=$_POST['slider'];
        
    if($porcja>=1 && $temperatura>=25 && $temperatura<=75){
     echo $porcja."<br/>";
     echo $temperatura;
    }
//zamkniecie polaczenia
     $polaczenie->close();
    }
?>