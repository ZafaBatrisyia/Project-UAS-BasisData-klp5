-- CREATE
CREATE DATABASE planet_kemasan;

use planet_kemasan;

CREATE TABLE customer (
    id_customer VARCHAR(10) PRIMARY KEY,
    nama_customer VARCHAR(20)
);

CREATE TABLE operator (
    id_operator VARCHAR(10) PRIMARY KEY,
    nama_operator VARCHAR(20)
);

CREATE TABLE produk (
    id_produk VARCHAR(10) PRIMARY KEY,
    nama_produk VARCHAR(50),
    harga INT(10)
);

CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    tanggal_transaksi DATETIME,
    total_item INT(50),
    total_harga INT(50),
    dibayar INT(50),
    kembalian INT(50),
    id_operator VARCHAR(10),
    id_customer VARCHAR(10),

    CONSTRAINT fk_transaksi_operator
        FOREIGN KEY (id_operator)
        REFERENCES operator(id_operator)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_transaksi_customer
        FOREIGN KEY (id_customer)
        REFERENCES customer(id_customer)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE detail_transaksi (
    id_detail VARCHAR(10) PRIMARY KEY,
    id_transaksi INT(10),
    id_produk VARCHAR(10),
    jumlah_beli INT(50),
    subtotal INT(50),

    CONSTRAINT fk_detail_transaksi
        FOREIGN KEY (id_transaksi)
        REFERENCES transaksi(id_transaksi)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detail_produk
        FOREIGN KEY (id_produk)
        REFERENCES produk(id_produk)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- INSERT
INSERT INTO customer (id_customer, nama_customer) VALUES
('CS0001', 'Andi'),
('CS0002', 'Budi'),
('CS0003', 'Lia');

INSERT INTO operator (id_operator, nama_operator) VALUES
('PR01', 'Fitri'),
('PR02', 'Ahmad'),
('PR03', 'Bayu');

INSERT INTO produk (id_produk, nama_produk, harga) VALUES
('P001', 'mika gethuk', 20700),
('P002', 'Mika nampan M', 2700),
('P003', 'jas hujan ponco armada', 4500);

INSERT INTO transaksi 
(id_transaksi, tanggal_transaksi, total_item, total_harga, dibayar, kembalian, id_operator, id_customer)
VALUES
(184630, '2025-10-17 15:28:00', 26, 162000, 200000, 38000, 'PR01', 'CS0001'),
(184631, '2025-10-29 10:37:00', 10, 45000, 50000, 5000, 'PR02', 'CS0003');

INSERT INTO detail_transaksi
(id_detail, id_transaksi, id_produk, jumlah_beli, subtotal)
VALUES
('D0011', 184630, 'P001', 5, 103500),
('D0012', 184630, 'P002', 20, 54000),
('D0013', 184630, 'P003', 1, 4500),
('D0014', 184631, 'P003', 10, 45000);


-- SELECT
select * from customer;
select * from operator;
select * from transaksi;
select * from detail_transaksi;
select * from produk;
select id_transaksi from detail_transaksi;


-- DISTINCT
select distinct id_transaksi from detail_transaksi;


-- LIKE
SELECT *
FROM customer
WHERE nama_customer LIKE '%an%';


-- BETWEEN
SELECT *
FROM transaksi
WHERE tanggal_transaksi BETWEEN '2025-10-15' AND '2025-10-20';


-- RANGE
SELECT *
FROM produk
WHERE harga >= 5000 AND harga <= 20000;


-- INNER JOIN
SELECT 
    t.id_transaksi,
    c.nama_customer,
    o.nama_operator,
    p.nama_produk,
    d.jumlah_beli,
    d.subtotal
FROM transaksi t
INNER JOIN customer c ON t.id_customer = c.id_customer
INNER JOIN operator o ON t.id_operator = o.id_operator
INNER JOIN detail_transaksi d ON t.id_transaksi = d.id_transaksi
INNER JOIN produk p ON d.id_produk = p.id_produk;


-- LEFT JOIN
SELECT 
    c.nama_customer,
    t.id_transaksi,
    t.tanggal_transaksi
FROM customer c
LEFT JOIN transaksi t ON c.id_customer = t.id_customer;


-- RIGHT JOIN
SELECT 
    p.nama_produk,
    d.id_transaksi,
    d.jumlah_beli
FROM detail_transaksi d
RIGHT JOIN produk p ON d.id_produk = p.id_produk;


-- AGREGASI, GROUP BY
SELECT 
    id_transaksi,
    SUM(subtotal) AS total_belanja
FROM detail_transaksi
GROUP BY id_transaksi;


-- HAVING
SELECT 
    id_transaksi,
    SUM(subtotal) AS total_belanja
FROM detail_transaksi
GROUP BY id_transaksi
HAVING SUM(subtotal) > 50000;


-- AGREGASI PER PRODUK
SELECT 
    p.nama_produk,
    SUM(d.jumlah_beli) AS total_terjual
FROM detail_transaksi d
JOIN produk p ON d.id_produk = p.id_produk
GROUP BY p.id_produk;


-- SUBQUERY
SELECT nama_produk
FROM produk
WHERE id_produk IN (
    SELECT id_produk
    FROM detail_transaksi
    WHERE jumlah_beli > 5
);


-- VIEW
CREATE VIEW view_laporan_transaksi AS
SELECT 
    t.id_transaksi,
    t.tanggal_transaksi,
    c.nama_customer,
    o.nama_operator,
    p.nama_produk,
    d.jumlah_beli,
    d.subtotal
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
JOIN operator o ON t.id_operator = o.id_operator
JOIN detail_transaksi d ON t.id_transaksi = d.id_transaksi
JOIN produk p ON d.id_produk = p.id_produk;

SELECT * FROM view_laporan_transaksi;


-- TCL

-- TCL BERHASIL
START TRANSACTION;

INSERT INTO transaksi
(id_transaksi, tanggal_transaksi, total_item, total_harga, dibayar, kembalian, id_operator, id_customer)
VALUES
(184632, NOW(), 2, 9000, 10000, 1000, 'PR01', 'CS0002');

INSERT INTO detail_transaksi
(id_detail, id_transaksi, id_produk, jumlah_beli, subtotal)
VALUES
('D0015', 184632, 'P003', 2, 9000);

COMMIT;

-- TCL GAGAL
START TRANSACTION;

INSERT INTO transaksi
(id_transaksi, tanggal_transaksi, total_item, total_harga, dibayar, kembalian, id_operator, id_customer)
VALUES
(184700, NOW(), 1, 5000, 10000, 5000, 'PR01', 'CS0001');

INSERT INTO detail_transaksi
(id_detail, id_transaksi, id_produk, jumlah_beli, subtotal)
VALUES
('D0999', 184700, 'P999', 1, 5000);

ROLLBACK;