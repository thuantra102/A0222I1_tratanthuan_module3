USE s2e2;
insert into customer 
values (1,'Minh Quan',10),
		(2,'Ngoc Oanh',20),
        (3,'Hong Ha',50);

insert into `order`
values (1,1,'2006-03-21',Null),
(2,2,'2006-03-23',Null),
(3,1,'2006-03-16',Null);
		
-- delete from `order` where o_id = 1;

insert into product
values (1,'May Giat',3),
		(2,'Tu Lanh',5),
        (3,'Dieu Hoa',7),
        (4,'Quat',1),
        (5,'Bep Dien',2);


insert into order_details
values (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
select o.o_id, o.o_date,o.o_total_price 
from `order` o;

select o.c_id, c.c_name, od.p_id, p.p_name, p.p_price ,od.od_qty
from `order` o join order_details od on o.o_id  = od.o_id
join product p on od.p_id = p.p_id
join customer c on o.c_id = c.c_id;

select * from customer c
left join `order` o on  c.c_id = o.c_id
where o.c_id is null;

select o.o_id, o.o_date 
from `order` o;

select  od.o_id, o.o_date, sum(p.p_price * od.od_qty) as price_of_each_product
from product p join order_details od on p.p_id = od.p_id
join `order` o on od.o_id = o.o_id
group by od.o_id;



