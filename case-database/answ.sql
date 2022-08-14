-- 2: nhan vien bat dau h, t, k toi da 15
use case_study;
select * 
from nhan_vien 
where (ho_ten like  "t%"  or ho_ten like "h%" or  ho_ten like "k%") and char_length(ho_ten) <= 15;
-- 3:  Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở Đà Nẵng hoặc Quảng Trị
select *
from khach_hang 
where 2022 - year(ngay_sinh) between 18 and 50
and (dia_chi like "%, Đà Nẵng" or dia_chi like "%, Quảng Trị" );

-- 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select k.ho_ten,lk.ten_loai_khach, count(h.ma_khach_hang) as so_lan
from khach_hang k
	join loai_khach lk on k.ma_khach_hang = lk.ma_loai_khach
	join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
where lk.ten_loai_khach = 'Diamond'
group by h.ma_khach_hang
ORDER BY so_lan;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
--  tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,hd.ngay_lam_hop_dong,
ifnull(ifnull(dv.chi_phi_thue,0) + ifnull(sum(hdct.so_luong * dvdk.gia),0),0) as tong_tien
from khach_hang kh
left join loai_khach lk using (ma_loai_khach)
left join hop_dong hd using (ma_khach_hang)
left join dich_vu dv USING (ma_dich_vu)
left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
group by  kh.ma_khach_hang;

--  6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
-- method 1
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, l_dv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu l_dv on dv.ma_loai_dich_vu  = l_dv.ma_loai_dich_vu
where
not exists (
	select * 
    from hop_dong hd 
    where dv.ma_dich_vu = hd.ma_dich_vu
    and ngay_lam_hop_dong between '2021-01-01' and '2021-03-31'
);
-- method 2
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, l_dv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu l_dv on dv.ma_loai_dich_vu  = l_dv.ma_loai_dich_vu
where dv.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');



-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
-- method 1
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, l_dv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu l_dv on dv.ma_loai_dich_vu  = l_dv.ma_loai_dich_vu
where
exists (
	select *
    from hop_dong hd 
    where dv.ma_dich_vu = hd.ma_dich_vu
    and year(ngay_lam_hop_dong) = 2020
)
and 
   not exists (
   select * 
    from hop_dong hd 
    where dv.ma_dich_vu = hd.ma_dich_vu
    and year(ngay_lam_hop_dong) = 2021
);

-- method 2
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, l_dv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu l_dv on dv.ma_loai_dich_vu  = l_dv.ma_loai_dich_vu
where dv.ma_dich_vu in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)  = 2020 group by ma_dich_vu)
and dv.ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)  = 2021 group by ma_dich_vu);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau
-- method 1
select distinct(ho_ten) from khach_hang ;
-- method 2 
select ho_ten from khach_hang group by ho_ten;
-- method 3
select ho_ten from khach_hang
union 
select ho_ten from khach_hang;

--  9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang , count(ma_khach_hang) as so_luong_khach from hop_dong
where year(ngay_lam_hop_dong) = 2021 
group by thang
order by thang;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hd_ct.so_luong), 0) so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hd_ct on hd.ma_hop_dong = hd_ct.ma_hop_dong
group by hd.ma_hop_dong;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select kh.ma_khach_hang, kh.ho_ten,kh.dia_chi, lk.ten_loai_khach,dvdk.ten_dich_vu_di_kem, dvdk.ma_dich_vu_di_kem
from khach_hang kh
join loai_khach lk
on kh.ma_loai_khach = lk.ma_loai_khach 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where  lk.ten_loai_khach = 'Diamond' and kh.dia_chi regexp '(Vinh|Quảng Ngãi)';
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dvdk.ten_dich_vu_di_kem, sum(hd.tien_dat_coc) , sum(hdct.so_luong)
from hop_dong hd 
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang 
left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
left JOIN dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
where (hd.ngay_lam_hop_dong between '2020-10-01' and '2020-12-30') and (hd.ngay_lam_hop_dong not between '2021-01-01' and '2021-06-30')
group by hd.ma_hop_dong

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view so_luong_dvdk
as
select kh.ho_ten, dvdk.ten_dich_vu_di_kem,  sum(hdct.so_luong) tong_so_luong_dvdk
from khach_hang kh
join hop_dong hd using (ma_khach_hang)
join  hop_dong_chi_tiet hdct using (ma_hop_dong)
join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
group by hdct.ma_dich_vu_di_kem
select ten_dich_vu_di_kem, tong_so_luong_dvdk 
from so_luong_dvdk
where tong_so_luong_dvdk = (select max(tong_so_luong_dvdk) from so_luong_dvdk)
-- đổi dữ liệu trên view thì sẽ như thế nào
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm 
-- ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong,ldv.ten_loai_dich_vu ,dvdk.ten_dich_vu_di_kem , count(ma_dich_vu_di_kem) as `so_lan_su_dung`
from hop_dong_chi_tiet
join hop_dong hd using (ma_hop_dong)
join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
join dich_vu using (ma_dich_vu)
join loai_dich_vu ldv using (ma_loai_dich_vu)
group by ma_dich_vu_di_kem
having so_lan_su_dung = 1
-- tại sao dung where không được
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) so_luong_hd
from nhan_vien nv 
join trinh_do td using (ma_trinh_do)
join bo_phan bp using (ma_bo_phan)
join hop_dong hd using (ma_nhan_vien)
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien 
having so_luong_hd <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- method 1
delete from nhan_vien nv
where nv.ma_nhan_vien not in (select ma_nhan_vien from hop_dong where year(ngay_lam_hop_dong)  between 2019 and 2021 group by ma_nhan_vien);
-- method 2

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
create view v_update_loai_khach as
select kh.ma_khach_hang, kh.ho_ten,lk.ten_loai_khach, hdct.so_luong as so_luong, dvdk.gia as gia, dv.chi_phi_thue as chi_phi_thue,
 ifnull(ifnull(dv.chi_phi_thue,0) + ifnull(sum(hdct.so_luong * dvdk.gia),0),0) as tong_tien
from khach_hang kh 
left join loai_khach lk using (ma_loai_khach)
left join hop_dong hd using (ma_khach_hang)
left join hop_dong_chi_tiet hdct using (ma_hop_dong)
left join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
left join dich_vu dv using (ma_dich_vu)
where year(hd.ngay_lam_hop_dong) = 2021
group by lk.ten_loai_khach
having tong_tien > 10000000;

update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in (select ma_khach_hang from v_update_loai_khach);



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- method 1
delete 
from khach_hang kh 
where kh.ma_khach_hang in (select ma_khach_hang from hop_dong where year(ngay_lam_hop_dong) < 2021 );

-- method 2
delete 
from khach_hang kh 
where exists (select 4 from hop_dong 
where kh.ma_khach_hang = ma_khach_hang
and YEAR(ngay_lam_hop_dong) <= 2021);


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem 
set gia = gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from count_so_luong );
create view count_so_luong 
as 
select dvdk.ma_dich_vu_di_kem, sum(hdct.so_luong) tong
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct using (ma_dich_vu_di_kem)
join hop_dong hd using (ma_hop_dong)
where year(hd.ngay_lam_hop_dong) = 2020
group by hdct.ma_dich_vu_di_kem
having tong > 10;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.)
SELECT
    ma_nhan_vien as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien
UNION ALL
SELECT
    ma_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;
