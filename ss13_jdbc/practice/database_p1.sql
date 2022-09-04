CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');



DELIMITER //

CREATE PROCEDURE search(In countryName varchar(255))
BEGIN
	SELECT * FROM users where country like concat('%',countryName, '%');
END //
DELIMITER ;

call search(?);

select * from users
where country like 0
order by country
