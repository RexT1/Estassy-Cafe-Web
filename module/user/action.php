<?php
    include("../../function/koneksi.php");   
    include("../../function/helper.php");   
     
    admin_only("user", $level);

	$button = isset($_POST['button']) ? $_POST['button'] : $_GET['button'];
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : "";
    $user = isset($_POST['user']) ? $_POST['user'] : "";
    $nama = $_POST['nama'];
	$email = $_POST["email"];
	$phone = $_POST["phone"];
	$alamat = $_POST["alamat"];
	$level = $_POST["level"];
	$status = $_POST["status"];	

	if($button == "Update"){
	mysqli_query($koneksi, "UPDATE user SET nama='$nama',
											   email='$email',
											   phone='$phone',
											   alamat='$alamat',
											   level='$level',
											   status='$status'
											   WHERE user_id='$user_id'");
	}
	else if($button == "Delete"){
		mysqli_query($koneksi, "DELETE FROM user WHERE user_id='$user_id'");
	}

    header("location: ".BASE_URL."index.php?page=my_profile&module=user&action=list");
?>