create table `category` (
 id int auto_increment ,
 `name` varchar(50),
 primary key (id)
);

create table product (
	id int primary key,
    product_name varchar(50),
    quantity int,
	color varchar(50),
    category_id int,
    foreign key (category_id) references category(id)
);
insert into category values (1,'Television'),(2,'Phone');

insert into product values (1,'Iphone 11',14,'Violet',2),(2,'Iphone 12',15,'Black',2),(3,'Samsung LCD',3,'White',1);
