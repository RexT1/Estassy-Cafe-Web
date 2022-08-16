<div id="kiri">

	<?php 
		
		echo kategori($kategori_id);
	
	?>

</div>

<div id="kanan">
	<?php
		$menu_id = $_GET['menu_id'];
		
		$query = mysqli_query($koneksi, "SELECT * FROM menu WHERE menu_id='$menu_id' AND status='on'");
		$row = mysqli_fetch_assoc($query);
		
		echo "<div id='detail-menu'>
					<h2>$row[nama_menu]</h2>
					<div id='frame-gambar'>
						<img src='".BASE_URL."images/menu/$row[gambar]' />
					</div>
					<div id='frame-harga'>
						<span>".rupiah($row['harga'])."</span>
						<a href='".BASE_URL."tambah_keranjang.php?menu_id=$row[menu_id]'>+ Add to cart</a>
					</div>
					<div id='keterangan'>
						<b>Keterangan : </b> $row[deskripsi]
					</div>
				</div>";				
		
	?>
</div>