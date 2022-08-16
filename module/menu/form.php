<?php

	$menu_id = isset($_GET['menu_id']) ? $_GET['menu_id'] : false;
	
	$nama_menu = "";
	$kategori_id = "";
	$deskripsi = "";
	$gambar = "";
	$stok = "";
	$harga = "";
	$status = "";
	$keterangan_gambar = "";
	$button = "Add";
	
	if($menu_id){
		$query = mysqli_query($koneksi, "SELECT * FROM menu WHERE menu_id='$menu_id'");
		$row = mysqli_fetch_assoc($query);
		
		$nama_menu = $row['nama_menu'];
		$kategori_id = $row['kategori_id'];
		$deskripsi = $row['deskripsi'];
		$gambar = $row['gambar'];
		$harga = $row['harga'];
		$stok = $row['stok'];
		$status = $row['status'];
		$button = "Update";
		
		$keterangan_gambar = "(Klik pilih gambar jika ingin mengganti gambar disamping)";
		$gambar = "<img src='".BASE_URL."images/menu/$gambar' style='width: 200px;vertical-align: middle;' />";
	}

?>

<script src="<?php echo BASE_URL."js/ckeditor/ckeditor.js"; ?>"></script>

<form action="<?php echo BASE_URL."module/menu/action.php?menu_id=$menu_id"; ?>" method="POST" enctype="multipart/form-data">

	<div class="element-form">
		<label>Kategori</label>
		<span>
			
			<select name="kategori_id">
				<?php
					$query = mysqli_query($koneksi, "SELECT kategori_id, kategori FROM kategori WHERE status='on' ORDER BY kategori ASC");
					while($row=mysqli_fetch_assoc($query)){
						if($kategori_id == $row['kategori_id']){
							echo "<option value='$row[kategori_id]' selected='true'>$row[kategori]</option>";
						}else{
							echo "<option value='$row[kategori_id]'>$row[kategori]</option>";
						}
					}
				?>
			</select>
		
		</span>
	</div>

	<div class="element-form">
		<label>Nama Menu</label>
		<span><input type="text" name="nama_menu" value="<?php echo $nama_menu; ?>" /></span>
	</div>	

	<div style="margin-bottom:10px">
		<label style="font-weight:bold">deskripsi</label>
		<span><textarea name="deskripsi" id="editor"><?php echo $deskripsi; ?></textarea></span>
	</div>	
	
	<div class="element-form">
		<label>Stok</label>
		<span><input type="text" name="stok" value="<?php echo $stok; ?>" /></span>
	</div>	

	<div class="element-form">
		<label>Harga</label>
		<span><input type="text" name="harga" value="<?php echo $harga; ?>" /></span>
	</div>

	<div class="element-form">
		<label>Gambar Produk <?php echo $keterangan_gambar; ?></label>
		<span>
			<input type="file" name="file" /> <?php echo $gambar; ?>
		</span>
	</div>		
	
	<div class="element-form">
		<label>Status</label>
		<span>
			<input type="radio" name="status" value="on" <?php if($status == "on"){ echo "checked='true'"; } ?> /> On
			<input type="radio" name="status" value="off" <?php if($status == "off"){ echo "checked='true'"; } ?> /> Off
		</span>
	</div>	

	<div class="element-form">
		<span><input type="submit" name="button" value="<?php echo $button; ?>" /></span>
	</div>

</form>

<script>
	CKEDITOR.replace("editor");
</script>