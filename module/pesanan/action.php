<?php

	include_once("../../function/koneksi.php");
	include_once("../../function/helper.php");
	
	session_start();
	
	admin_only("pesanan", $level);

	$pesanan_id = isset($_GET['pesanan_id']) ? $_GET['pesanan_id'] : "";
	$button = isset($_POST['button']) ? $_POST['button'] : $_GET['button'];
	
	
	if($button == "Konfirmasi"){
		$user_id = $_SESSION["user_id"];
		$nomor_account = isset($_POST['nomor_account']) ? $_POST['nomor_account'] : "";
		$nama_account = isset($_POST['nama_account']) ? $_POST['nama_account'] : "";
		$tanggal_transfer = isset($_POST['tanggal_transfer']) ? $_POST['tanggal_transfer'] : "";
		
		$queryPembayaran = mysqli_query($koneksi, "INSERT INTO konfirmasi_pembayaran (pesanan_id, nomor_account, nama_account, tanggal_transfer)
																			VALUES ('$pesanan_id', '$nomor_account', '$nama_account', '$tanggal_transfer')");
																			
		if($queryPembayaran){
			mysqli_query($koneksi, "UPDATE pesanan SET status='1' WHERE pesanan_id='$pesanan_id'");
		}
		
	}else if($button == "Edit Status"){
		$status = isset($_POST['status']) ? $_POST["status"] : "";
		mysqli_query($koneksi, "UPDATE pesanan SET status='$status' WHERE pesanan_id='$pesanan_id'");
		
		if($status == "2"){
			$query = mysqli_query($koneksi, "SELECT * FROM pesanan_detail WHERE pesanan_id='$pesanan_id'");
			while($row=mysqli_fetch_assoc($query)){
				$menu_id = $row["menu_id"];
				$quantity = $row["quantity"];
				
				mysqli_query($koneksi, "UPDATE menu SET stok=stok-$quantity WHERE menu_id='$menu_id'");
			}
		}		
	}
	else if($button == "Delete"){
			mysqli_query($koneksi, "DELETE FROM pesanan WHERE pesanan_id='$pesanan_id'");
			}
	
	header("location:".BASE_URL."index.php?page=my_profile&module=pesanan&action=list");