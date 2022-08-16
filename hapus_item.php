<?php

	include_once("function/helper.php");
	
	session_start();
	
	$menu_id=$_GET['menu_id'];
	$keranjang = $_SESSION['keranjang'];
	
	unset($keranjang[$menu_id]);
	
	$_SESSION['keranjang'] = $keranjang;
	
	header("location:".BASE_URL."index.php?page=keranjang");