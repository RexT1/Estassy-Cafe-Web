<div id="frame-tambah">
	<a href="<?php echo BASE_URL."index.php?page=my_profile&module=menu&action=form"; ?>" class="tombol-action">+ Tambah Menu</a>
</div>

<?php

	$query = mysqli_query($koneksi, "SELECT menu.*, kategori.kategori FROM menu JOIN kategori ON menu.kategori_id=kategori.kategori_id");
	
	if(mysqli_num_rows($query) == 0){
		echo "<h3>Saat ini belum ada menu di dalam table menu</h3>";
	}else{
	
		echo "<table class='table-list'>";
		
		echo "<tr class='baris-title'>
				<th class='kolom-nomor'>No</th>
				<th class='kiri'>menu</th>
				<th class='kiri'>Kategori</th>
				<th class='kiri'>Harga</th>
				<th class='tengah'>Status</th>
				<th class='tengah'>Action</th>
			 </tr>";
			 
		$no=1;
		while($row=mysqli_fetch_assoc($query)){
			
			echo "<tr>
					<td class='kolom-nomor'>$no</td>
					<td class='kiri'>$row[nama_menu]</td>
					<td class='kiri'>$row[kategori]</td>
					<td>".rupiah($row['harga'])."</td>
					<td class='tengah'>$row[status]</td>
					<td class='tengah'>
						<a class='tombol-action' href='".BASE_URL."index.php?page=my_profile&module=menu&action=form&menu_id=$row[menu_id]'>Edit</a>
						<a class='tombol-action' href='".BASE_URL."module/menu/action.php?button=Delete&menu_id=$row[menu_id]'>Delete</a>
					</td>
				  </tr>";
				  
			$no++;
		}
		
		echo "</table>";
	
	}

?>