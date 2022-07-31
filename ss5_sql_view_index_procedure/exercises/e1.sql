CREATE DATABASE IF not exists exercise5;
USE exercise5;
CREATE TABLE products (
	id int ,
    productCode varchar(10) unique,
    productName varchar(10),
    productPrice float,
    productAmount int,
    productDescription varchar(50),
    productStatus bit default 0,
    primary key (productName,productPrice)
    );

INSERT INTO products 
values (1,'A01','Milk',4234,20,'no description',0),
(2,'A02','Milk2',234,20,'no description',0),
(3,'A03','Milk3',243,20,'no description',1);

EXPLAIN SELECT * FROM products 
where id = 1;
CREATE INDEX i_id on products(id);

create view v_product as 
select p.productCode, p.productName, p.productPrice, p.productStatus
from products p;

select * from v_product;
 update v_product 
 set productName = 'juice'
 where productCode = 'A01';
 
 delete from v_product 
 where productName = 'juice';
 
 DROP VIEW v_product;
 
DELIMITER //

CREATE PROCEDURE get_all_products()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;
 
 call get_all_products();
 
 -- Tạo store procedure thêm một sản phẩm mới
 
 DELIMITER //
 CREATE PROCEDURE insert_new_record(in p_id int ,in p_productCode varchar(10) ,in p_productName varchar(10), in p_productPrice float,
in  p_productAmount int,
    in p_productDescription varchar(50),
    in p_productStatus bit )
 
BEGIN 
	insert into products (id,productCode,productName,productPrice,productAmount,productDescription,productStatus) values (p_id,p_productCode,p_productName,p_productPrice,p_productAmount,p_productDescription,p_productStatus);
END //
DELIMITER ;
call insert_new_record(10,'A09','Milk',4234,20,'no description',1);
call insert_new_record(111,'A09111','Milk',32434,20,'no description',1);
 -- Tạo store procedure xoá sản phẩm theo id
 DELIMITER //
 CREATE PROCEDURE delete_record(in p_id int)

BEGIN 
 delete from products where id = p_id ;
END //
DELIMITER ;
call delete_record(111 )

-- Tạo store procedure sửa thông tin sản phẩm theo id 

 DELIMITER //
CREATE PROCEDURE update_record(in p_id int ,in p_productCode varchar(10) ,in p_productName varchar(10) )
BEGIN 
 update products 
 set productCode = p_productCode,
 productName = p_productName 
where id = p_id;
END //
DELIMITER ;

call update_record (10, 'alt04','rice02131')
