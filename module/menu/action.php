<?php

	include_once("../../function/koneksi.php");
	include_once("../../function/helper.php");
	
	admin_only("menu", $level);

	$button = isset($_POST['button']) ? $_POST['button'] : $_GET['button'];
	$menu_id = isset($_GET['menu_id']) ? $_GET['menu_id'] : "";
	$nama_menu = isset($_POST['nama_menu']) ? $_POST['nama_menu'] : false;
	$kategori_id = isset($_POST['kategori_id']) ? $_POST['kategori_id'] : false;
	$spesifikasi = isset($_POST['spesifikasi']) ? $_POST['spesifikasi'] : false;
	$status = isset($_POST['status']) ? $_POST['status'] : false;
	$harga = isset($_POST['harga']) ? $_POST['harga'] : false;
	$stok = isset($_POST['stok']) ? $_POST['stok'] : false;
	$update_gambar = "";
	
	if(!empty($_FILES["file"]["name"])){
		$nama_file = $_FILES["file"]["name"];
		move_uploaded_file($_FILES["file"]["tmp_name"], "../../images/menu/".$nama_file);
		
		$update_gambar = ", gambar='$nama_file'";
	}
	
	if($button == "Add"){
		mysqli_query($koneksi, "INSERT INTO menu (nama_menu, kategori_id, spesifikasi, gambar, harga, stok, status) 
											VALUES ('$nama_menu', '$kategori_id', '$spesifikasi', '$nama_file', '$harga', '$stok', '$status')");
	}
	else if($button == "Update"){
		mysqli_query($koneksi, "UPDATE menu SET kategori_id='$kategori_id',
												  nama_menu='$nama_menu',
												  spesifikasi='$spesifikasi',
												  harga='$harga',
												  stok='$stok',
												  status='$status'
												  $update_gambar WHERE menu_id='$menu_id'");
	}
	else if($button == "Delete"){
		mysqli_query($koneksi, "DELETE FROM menu WHERE menu_id='$menu_id'");
	}
	
	header("location:".BASE_URL."index.php?page=my_profile&module=menu&action=list");