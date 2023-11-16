﻿CREATE TABLE SACH
(
	MASACH CHAR(5) NOT NULL,
	TENSACH NVARCHAR(20),
	ANH NVARCHAR(20),
	TACGIA NVARCHAR(20),
	GIA FLOAT,
	CHITIET NVARCHAR(50),
	THELOAI NVARCHAR(15),
	CONSTRAINT PK_MASACH PRIMARY KEY (MASACH)
)

INSERT INTO SACH(MASACH, TENSACH, TACGIA, GIA, THELOAI)
VALUES
('S0001', 'PHIEU LUU KY', 'PHUC', 12.4, 'KINH DI'),
('S0002', 'DIEN BIEN PHU', 'AN', 21.1, 'HAI HUOC'),
('S0003', 'TOC DO', 'LAM', 20.3, 'PHIEU LUU');


CREATE TABLE QUANLY
(
	MAQL CHAR(5) NOT NULL,
	TENQL NVARCHAR(20),
	MATKHAUQL VARCHAR(20),
	CONSTRAINT PK_MAQL PRIMARY KEY (MAQL)
)

CREATE TABLE KHACHHANG
(
	MAKH CHAR(5) NOT NULL,
	TENKH NVARCHAR(30),
	MATKHAU VARCHAR(20),
	EMAIL VARCHAR(20),
	SDT VARCHAR(11),
	CONSTRAINT PK_MAKH PRIMARY KEY (MAKH)
)

CREATE TABLE DIACHI
(
	MADIACHI CHAR(5) NOT NULL,
	SOLUONG INT,
	MAKH CHAR(5),
	MASACH CHAR(5),
	CONSTRAINT PK_MADIACHI PRIMARY KEY (MADIACHI),
	CONSTRAINT FK_DIACHI_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH) ON DELETE CASCADE,
	CONSTRAINT FK_DIACHI_SACH FOREIGN KEY (MASACH) REFERENCES SACH(MASACH) ON DELETE CASCADE
)

CREATE TABLE GIOHANG
(
	MAGH CHAR(5) NOT NULL,
	TONGGIA FLOAT,
	SOLUONG INT,
	MAKH CHAR(5),
	MASACH CHAR(5),
	CONSTRAINT PK_MAGH PRIMARY KEY (MAGH),
	CONSTRAINT FK_GIOHANG_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH) ON DELETE CASCADE,
	CONSTRAINT FK_GIOHANG_SACH FOREIGN KEY (MASACH) REFERENCES SACH(MASACH) ON DELETE CASCADE
)

CREATE TABLE DATHANG
(
	MADH CHAR(5) NOT NULL,
	PTTT NVARCHAR(20),
	KIEMTRA VARCHAR(3),
	NGAYDH DATE,
	MAKH CHAR(5),
	MAGH CHAR(5),
	MASACH CHAR(5),
	CONSTRAINT PK_MADH PRIMARY KEY (MADH),
	CONSTRAINT FK_DATHANG_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH) ON DELETE CASCADE,
	CONSTRAINT FK_DATHANG_GIOHANG FOREIGN KEY (MAGH) REFERENCES GIOHANG(MAGH) ON DELETE NO ACTION,
	CONSTRAINT FK_DATHANG_SACH FOREIGN KEY (MASACH) REFERENCES SACH(MASACH) ON DELETE CASCADE,
)

CREATE TABLE DIACHIGH
(
	MADCGH CHAR(7) NOT NULL,
	MADIACHI CHAR(5),
	MADH CHAR(5),
	CONSTRAINT PK_MADCGH PRIMARY KEY (MADCGH),
	CONSTRAINT FK_DIACHIGH_DIACHI FOREIGN KEY (MADIACHI) REFERENCES DIACHI(MADIACHI) ON DELETE CASCADE,
	CONSTRAINT FK_DIACHIGH_DATHANG FOREIGN KEY (MADH) REFERENCES DATHANG(MADH) ON DELETE NO ACTION
)
