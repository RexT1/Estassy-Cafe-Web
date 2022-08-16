<?php
    include("../../function/koneksi.php");
    include("../../function/helper.php");
    
    admin_only("banner", $level);

    $button = isset($_POST['button']) ? $_POST['button'] : $_GET['button'];
    $banner_id = isset($_GET['banner_id']) ? $_GET['banner_id'] : "";
    $banner = isset($_POST['banner']) ? $_POST['banner'] : false;
    $link = isset($_POST['link']) ? $_POST['link'] : false;
    $status = isset($_POST['status']) ? $_POST['status'] : false;
    $edit_gambar = "";
    
 
    if($_FILES["file"]["name"] != "")
    {
        $nama_file = $_FILES["file"]["name"];
        move_uploaded_file($_FILES["file"]["tmp_name"], "../../images/slide/" . $nama_file);
         
        $edit_gambar  = ", gambar='$nama_file'";
    }
     
    if($button == "Add")
    {
        mysqli_query($koneksi, "INSERT INTO banner (banner, link, gambar, status) VALUES ('$banner', '$link', '$nama_file', '$status')");
    }
    elseif($button == "Update")
    {   
        mysqli_query($koneksi, "UPDATE banner SET banner='$banner',
                                        link='$link',
                                        $edit_gambar
                                        status='$status'
                                        $edit_gambar WHERE banner_id='$banner_id'");
    }
     else if($button == "Delete"){
        mysqli_query($koneksi, "DELETE FROM banner WHERE banner_id='$banner_id'");
    }
     
    header("location: ".BASE_URL."index.php?page=my_profile&module=banner&action=list");
?>