-- SOAL 3.1
SELECT * FROM produk WHERE harga_beli * stok > 20000000; 
SELECT SUM(stok - min_stok) as selisih from produk;
SELECT sum(stok) as total_asset from produk;
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;

-- SOAL 3.2
SELECT COUNT(tgl_lahir) AS jumlah_pelanggan FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE jk="P" AND tmp_lahir="Jakarta";
SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
SELECT COUNT(kode) AS total_barang FROM produk WHERE kode LIKE "K%";
SELECT AVG(harga_jual) AS rata_rata_harga FROM produk WHERE harga_jual >1000000;
SELECT * FROM produk ORDER BY stok DESC limit 1;
SELECT COUNT(stok) as jumlah_produk FROM produk WHERE stok < min_stok;
SELECT SUM(stok) as total_asset FROM produk;

-- SOAL 3.3
SELECT kode, nama, stok, CASE
WHEN stok <= min_stok THEN "Segera Belanja"
ELSE "Stok Aman"
END as keterangan FROM produk;

SELECT kode, nama_pelanggan, (YEAR(now())-YEAR(tgl_lahir)) as umur,CASE
WHEN (YEAR(now())-YEAR(tgl_lahir)) < 17 THEN "Muda"
WHEN (YEAR(now())-YEAR(tgl_lahir)) > 17 AND (YEAR(now())-YEAR(tgl_lahir)) <=55 THEN "Dewasa"
ELSE "Tua"
END AS kategori
FROM pelanggan;

SELECT kode, nama, CASE
WHEN kode = 'TV01' THEN "DVD Player"
WHEN kode = 'K001' THEN "Rice Cooker"
ELSE "Tidak Ada"
END as bonus FROM produk;

-- SOAL 3.4
SELECT tmp_lahir, count(tmp_lahir) as jumlah from pelanggan GROUP BY tmp_lahir;
SELECT jenis_produk_id as jenis_produk, count(jenis_produk_id) as jumlah from produk GROUP BY jenis_produk_id;
SELECT * FROM pelanggan WHERE YEAR(now())-YEAR(tgl_lahir) < (SELECT AVG( YEAR(now())-YEAR(tgl_lahir)) FROM pelanggan);
SELECT * FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
SELECT * FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE iuran > 90000);
SELECT * FROM produk WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
SELECT * FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE diskon > 0.03);