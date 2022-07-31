USE classicmodels;
SELECT * FROM customers;

SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

CREATE INDEX idx_contactLastName ON customers(contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactLastName = 'King';

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);

EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name; 

USE quanlydiemthi;
CREATE INDEX i_mahs on bangdiem(mahs);
show indexes from bangdiem;

