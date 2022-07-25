CREATE DATABASE IF NOT EXISTS s2e2;
USE s2e2;
create table customer (
	c_id int primary key,
    c_name varchar(20),
    c_age int
);
create table `order` (
	o_id int primary key,
    c_id int,
    o_date datetime,
    o_total_price float,
    foreign key (c_id) references customer(c_id)
);
create table product (
	p_id int primary key,
    p_name varchar(20),
    p_price float
);
create table order_details (
	o_id int,
    p_id int,
    primary key (o_id, p_id),
    foreign key (o_id) references `order`(o_id),
    foreign key (p_id) references product(p_id)
)