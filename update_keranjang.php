<?php

	session_start();
	
	$keranjang = $_SESSION["keranjang"];
	$menu_id = $_POST["menu_id"];
	$value = $_POST["value"];
	
	$keranjang[$menu_id]["quantity"] = $value;
	
	$_SESSION["keranjang"] = $keranjang;