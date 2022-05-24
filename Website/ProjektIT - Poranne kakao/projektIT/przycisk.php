<?php
session_start();
require_once "config.php";
$_SESSION['przycisk']=2;
$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
$sql = "UPDATE stan SET przycisk='{$_SESSION['przycisk']}' WHERE id='1'";
$sql2= "UPDATE zamowienia SET stan='gotowe' WHERE stan='do odebrania';";
$polaczenie->query($sql);
$polaczenie->query($sql2);
$polaczenie->close();
header ('Location: zrobkakao.php');
?>