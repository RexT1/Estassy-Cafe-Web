<?php
	if($totalMenu == 0){
		echo "<h3>Saat ini belum ada data di dalam keranjang belanja anda</h3>";
	}else{
	
		$no=1;
		
		echo "<table class='table-list'>
				<tr class='baris-title'>
					<th class='tengah'>No</th>
					<th class='kiri'>Image</th>
					<th class='kiri'>Nama Menu</th>
					<th class='tengah'>Qty</th>
					<th class='kanan'>Harga Satuan</th>
					<th class='kanan'>Total</th>
				</tr>";
		
		$subtotal = 0;		
		foreach($keranjang AS $key => $value){
			$menu_id = $key;
			
			$nama_menu = $value["nama_menu"];
			$quantity = $value["quantity"];
			$gambar = $value["gambar"];
			$harga = $value["harga"];
			
			$total = $quantity * $harga;
			$subtotal = $subtotal + $total;
			
			echo "<tr>
					<td class='tengah'>$no</td>
					<td class='kiri'><img src='".BASE_URL."images/menu/$gambar' height='100px' /></td>
					<td class='kiri'>$nama_menu</td>
					<td class='tengah'><input type='text' name='$menu_id' value='$quantity' class='update-quantity' /></td>
					<td class='kanan'>".rupiah($harga)."</td>
					<td class='kanan hapus_item'>".rupiah($total)." <a href='".BASE_URL."hapus_item.php?menu_id=$menu_id'>X</a></td>
				</tr>";
				
			$no++;	
		
		}
		
		echo "<tr>
				<td colspan='5' class='kanan'><b>Sub Total</b></td>
				<td class='kanan'><b>".rupiah($subtotal)."</b></td>
			  </tr>";
		
		echo "</table>";
	
		echo "<div id='frame-button-keranjang'>
				<a id='lanjut-belanja' href='".BASE_URL."index.php'>< Lanjut Belanja</a>
				<a id='lanjut-pemesanan' href='".BASE_URL."index.php?page=data_pemesan'>Lanjut Pemesanan ></a>
			  </div>";
	
	}

?>

<script>

	$(".update-quantity").on("input", function(e){
		var menu_id = $(this).attr("name");
		var value = $(this).val();
		
		$.ajax({
			method: "POST",
			url: "update_keranjang.php",
			data: "menu_id="+menu_id+"&value="+value
		})
		.done(function(data){
			location.reload();
		});
		
	});

</script>