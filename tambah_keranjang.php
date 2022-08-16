<?php

	include_once("function/koneksi.php");
	include_once("function/helper.php");

	session_start();
	
	$menu_id = $_GET['menu_id'];
	$keranjang = isset($_SESSION['keranjang']) ? $_SESSION['keranjang'] : false;	
	
	$query = mysqli_query($koneksi, "SELECT nama_menu, gambar, harga FROM menu WHERE menu_id='$menu_id'");
	$row=mysqli_fetch_assoc($query);
	
	$keranjang[$menu_id] = array("nama_menu" => $row["nama_menu"],
								   "gambar" => $row["gambar"],
								   "harga" => $row["harga"],
								   "quantity" => 1);
								   
	$_SESSION["keranjang"] = $keranjang;
	
	header("location:".BASE_URL);