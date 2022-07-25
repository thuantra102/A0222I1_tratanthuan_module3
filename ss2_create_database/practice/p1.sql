create database `quanlydiemthi`;
create table quanlydiemthi.hocsinh (
	mahs int unique,
    tenhs varchar(50),
    ngaysinh date,
    lop varchar(50),
    gt varchar(20),
    primary key(mahs) 
);
create table quanlydiemthi.monhoc (
	MaMH VARCHAR(20) PRIMARY KEY,
    TenMH VARCHAR(50)
);
alter table monhoc 
change MaMH mamh varchar(20),change TenMH tenmh varchar(50);
alter table hocsinh 
modify column mahs varchar(20);
use quanlydiemthi;
CREATE TABLE bangDiem(
    mahs VARCHAR(20),
    mamh VARCHAR(20),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (mahs, mamh),
    FOREIGN KEY (mahs) REFERENCES hocsinh(mahs),
    FOREIGN KEY (mamh) REFERENCES monhoc(MaMH)
);
create table giaovien(
	magv varchar(50) primary key,
    tengv varchar(20),
    sdt varchar(10)
);
alter table monhoc 
add magv varchar(50);
alter table monhoc add constraint fk_magv FOREIGN KEY (magv) REFERENCES giaovien(magv);
