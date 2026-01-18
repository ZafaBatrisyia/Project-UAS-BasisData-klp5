# Project-UAS-BasisData-klp5
## Sistem Basis Data Penjualan

Mata Kuliah : Sistem Basis Data  
Dosen Pengampu : Ridwan Dwi Irawan, S.Kom., M.Kom.  

---

## Anggota Kelompok
- Hafidz Fathkurrohman (250119009)
- Zalfa' Lutfi Batrisyia (250119025)

---

## Deskripsi Proyek
Proyek ini merupakan Final Project mata kuliah Sistem Basis Data yang bertujuan untuk merancang dan mengimplementasikan sebuah **sistem basis data penjualan**. Proyek ini dibuat berdasarkan studi kasus penjualan barang dan dirancang sesuai dengan materi perkuliahan, mulai dari perancangan basis data hingga penggunaan query SQL.

Database dirancang menggunakan pendekatan relasional dengan penerapan **Primary Key**, **Foreign Key**, serta constraint untuk menjaga konsistensi data.

---

## Tujuan
Tujuan dari proyek ini adalah:
- Menerapkan konsep perancangan basis data relasional
- Melakukan normalisasi data hingga bentuk **3NF**
- Membuat dan mengimplementasikan **ERD**
- Menggunakan SQL untuk manipulasi dan pengolahan data
- Menerapkan query JOIN, GROUP BY, HAVING, subquery, VIEW, dan TCL

---

## Ruang Lingkup
- DBMS yang digunakan: **MySQL**
- Fokus pada perancangan dan implementasi database
- Studi kasus: sistem kasir / penjualan

---

## Struktur Database
Database terdiri dari beberapa tabel utama, yaitu:
- `customer`
- `operator`
- `produk`
- `transaksi`
- `detail_transaksi`

Relasi antar tabel dibangun menggunakan **foreign key** untuk memastikan integritas dan konsistensi data.

---

## Tools yang Digunakan
- XAMPP  
- MySQL Workbench  
- GitHub  

---

## Struktur Repository
```
├── sql/
│   ├── database.sql
│
├── documents/
│   ├── poster.pdf
│   └── laporan_final.pdf
│
└── README.md
```

---

## Cara Menjalankan Database
- Clone repository ini
- Jalankan MySQL atau MariaDB
- Jalankan file SQL
- Database siap digunakan untuk menjalankan query

---

## Query yang Digunakan
Proyek ini menggunakan berbagai jenis query SQL untuk mengelola dan menampilkan data pada sistem basis data kasir, antara lain:

- **DDL (Data Definition Language)**  
  Digunakan untuk membuat dan mengatur struktur database, tabel, primary key, foreign key, serta constraint.

- **DML (Data Manipulation Language)**  
  Digunakan untuk melakukan insert, update, dan delete data pada tabel.

- **JOIN (INNER JOIN, LEFT JOIN, RIGHT JOIN)**  
  Digunakan untuk menampilkan data transaksi secara lengkap dengan menggabungkan beberapa tabel yang saling berelasi.

- **DISTINCT**  
  Digunakan untuk menampilkan data yang unik tanpa duplikasi, misalnya menampilkan daftar produk tanpa data yang sama.

- **LIKE**  
  Digunakan untuk menampilkan data berdasarkan pola tertentu, seperti mencari nama customer atau produk dengan kata tertentu.

- **BETWEEN**  
  Digunakan untuk menampilkan data dalam rentang nilai tertentu, seperti transaksi pada rentang tanggal tertentu.

- **RANGE (Operator Perbandingan)**  
  Digunakan untuk menampilkan data berdasarkan batas nilai tertentu, misalnya produk dengan harga minimum dan maksimum tertentu.

- **GROUP BY dan HAVING**  
  Digunakan untuk melakukan pengelompokan dan penyaringan data berdasarkan hasil agregasi.

- **Subquery**  
  Digunakan untuk mengambil data berdasarkan hasil query lain di dalamnya.

- **VIEW**  
  Digunakan untuk menyimpan query laporan agar dapat dipanggil kembali tanpa menulis ulang query.

- **TCL (Transaction Control Language)**  
  Digunakan untuk mengatur transaksi database agar proses insert data berjalan secara konsisten menggunakan COMMIT dan ROLLBACK.
