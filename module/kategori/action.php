<?php
    include("../../function/koneksi.php");   
    include("../../function/helper.php");   
     
    admin_only("kategori", $level);
    
    $kategori_id = isset($_GET['kategori_id']) ? $_GET['kategori_id'] : "";
    $kategori = isset($_POST['kategori']) ? $_POST['kategori'] : "";
    $status = isset($_POST['status']) ? $_POST['status'] : "";
    $button = isset($_POST['button']) ? $_POST['button'] : $_GET['button'];
	
	if($button == "Add"){
		mysqli_query($koneksi, "INSERT INTO kategori (kategori, status) VALUES('$kategori', '$status')");
	}
	else if($button == "Update"){
		mysqli_query($koneksi, "UPDATE kategori SET kategori='$kategori', status='$status' WHERE kategori_id='$kategori_id'");
	}
	else if($button == "Delete"){
		mysqli_query($koneksi, "DELETE FROM kategori WHERE kategori_id='$kategori_id'");
	}
	
	header("location:" .BASE_URL."index.php?page=my_profile&module=kategori&action=list");