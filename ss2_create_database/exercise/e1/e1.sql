create database if not exists s2e1;
use s2e1;
create table lien_he (
	sdt varchar(10) primary key,
    ten varchar(50),
    dia_chi varchar(50)
);
create table nha_cung_cap (
	ma_ncc varchar(10) primary key,
    ten_ncc varchar(50),
    dia_chi_ncc varchar(50),
    sdt varchar(10),
    foreign key (sdt) references lien_he (sdt)
);
create table don_dat_hang (
	so_dh varchar(10) primary key,
    ngay_dh datetime,
    ma_ncc varchar(10),
    foreign key (ma_ncc) references nha_cung_cap(ma_ncc)
);
create table vat_tu(
	ma_vattu varchar(10) primary key,
    ten_vattu varchar(50)
);
create table phieu_xuat(
	so_px varchar(10) primary key,
    ngay_xuat datetime
);
create table phieu_xuat_chi_tiet (
	so_px varchar(10) ,
    ma_vattu_xuat varchar(10),
    dg_xuat varchar(10),
    sl_xuar int,
    primary key (so_px, ma_vattu_xuat),
    foreign key (ma_vattu_xuat) references vat_tu(ma_vattu),
    foreign key (so_px) references phieu_xuat(so_px)
);
create table phieu_nhap (
	so_pn varchar(10) primary key,
    ngay_nhap datetime
);
create table phieu_nhap_chi_tiet (
	so_pn varchar(10),
    ma_vattu_nhap varchar(10),
    dg_nhap varchar(10),
    sl_nhap int,
    primary key (so_pn,ma_vattu_nhap),
    foreign key (ma_vattu_nhap) references vat_tu(ma_vattu),
    foreign key (so_pn) references phieu_nhap(so_pn)
);
create table don_dat_hang_chi_tiet (
	so_dathang varchar(10),
    ma_vattu varchar(10),
    primary key (so_dathang,ma_vattu),
    foreign key (so_dathang) references don_dat_hang(so_dh),
    foreign key (ma_vattu) references vat_tu(ma_vattu)
);


