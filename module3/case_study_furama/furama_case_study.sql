create database case_study_furama;
use case_study_furama;
-- drop database case_study_furama;

create table position_employee(
position_id int primary key,
position_name varchar(45));

create table education_degree(
education_degree_id int primary key,
education_degree_name varchar(45));

create table division(
division_id int primary key,
division_name varchar(45));

create table role(
role_id int primary key,
role_name  varchar(45) null);

create table user(
username varchar(45) primary key,
password_user varchar(45) null);

create table user_role(
role_id int,
username varchar(45),
foreign key(role_id) references role(role_id) ON DELETE CASCADE,
foreign key(username) references user(username) ON DELETE CASCADE);

create table employee(
employee_id int auto_increment primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
foreign key(position_id) references position_employee(position_id) ON DELETE CASCADE,
foreign key(education_degree_id) references education_degree(education_degree_id) ON DELETE CASCADE,
foreign key(division_id) references division(division_id) ON DELETE CASCADE);

create table customer_type(
customer_type_id int primary key,
customer_type_name varchar(45));

create table customer(
customer_id int auto_increment primary key,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
foreign key(customer_type_id) references customer_type(customer_type_id) ON DELETE CASCADE);

create table service_type(
service_type_id int primary key,
service_type_name varchar(45));

create table rent_type(
rent_type_id int primary key,
rent_type_name varchar(45),
rent_type_cost double);

create table service(
service_id int primary key,
service_name varchar(45),
sercice_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standar_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
foreign key (rent_type_id) references rent_type(rent_type_id) ON DELETE CASCADE,
foreign key(service_type_id) references service_type(service_type_id) ON DELETE CASCADE);

create table attach_service(
attach_service_id int primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45));

create table contract(
contract_id int auto_increment primary key,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,
foreign key (employee_id) references employee(employee_id)ON DELETE CASCADE,
foreign key (customer_id) references customer(customer_id) ON DELETE CASCADE,
foreign key (service_id) references service(service_id)ON DELETE CASCADE);

create table contract_detail(
contract_detail_id int primary key,
contract_id int,
attach_service_id int,
quantity int,
foreign key (attach_service_id) references attach_service(attach_service_id) ON DELETE CASCADE,
foreign key (contract_id) references contract(contract_id)ON DELETE CASCADE);

insert into position_employee
value(1, "Qu???n l??"), (2, "Nh??n vi??n");

insert into education_degree
value(1, "Trung c???p"), (2, "Cao ?????ng"), (3, "?????i h???c"), (4, "Sau ?????i h???c");

insert into division
value(1, "Sale-Marketing"), (2, "H??nh ch??nh"), (3, "Ph???c v???"), (4, "Qu???n l??");

insert into role value
(1, null),
(2, null);

insert into user value
(1, null),
(2, null);

insert into employee value
(1, "Nguy???n V??n An", "1970-11-07", "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguy???n T???t Th??nh, ???? N???ng", 1, 3, 1),
(2, 'L?? V??n B??nh', '1997-04-09', '654231234', 7000000, '934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', 1, 2, 2),
(3, 'H??? Th??? Y???n', '1995-12-12', '999231723', 14000000, '412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', 1, 3, 2),
(4, 'V?? C??ng To???n', '1980-04-04', '123231365', 17000000, '374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', 1, 4, 4),
(5, 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232', 6000000, '902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', 2, 1, 1),
(6, 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', 7000000, '978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', 2, 2, 3),
(7, 'Nguy???n H???u H??', '1993-01-01', '534323231', 8000000, '941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', 2, 3, 2),
(8, 'Nguy???n H?? ????ng', '1989-09-03', '234414123', 9000000, '642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i', 2, 4, 4),
(9, 'T??ng Hoang', '1982-09-03', '256781231', 6000000, '245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', 2, 4, 4),
(10, 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', 8000000, '988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', 2, 3, 2);

insert into customer_type
value
(1, "Diamond"), (2, "Platinium"), (3, "Gold"), (4, "Sliver"), (5, "Member");

insert into customer value
(1, 5, "Nguy???n Th??? H??o", "1970-11-07", 0, "643431213", "945423362", "thihao07@gmail.com", "23 Nguy???n Ho??ng, ???? N???ng"),
(2, 3, "Ph???m Xu??n Di???u", "1992-08-08", 1, "865342123", "954333333", "xuandieu92@gmail.com", "K77/22 Th??i Phi??n, Qu???ng Tr???"),
(3, 1, "Tr????ng ????nh Ngh???", "1990-02-27", 1, "488645199", "373213122", "nghenhan2702@gmail.com", "K323/12 ??ng ??ch Khi??m, Vinh"),
(4, 1, "D????ng V??n Quan", "1981-07-08", 1, "543432111", "490039241", "duongquan@gmail.com", "K453/12 L?? L???i, ???? N???ng"),
(5, 4, "Ho??ng Tr???n Nhi Nhi", "1995-12-09", 0, "795453345", "312345678", "nhinhi123@gmail.com", "224 L?? Th??i T???, Gia Lai"),
(6, 4, "T??n N??? M???c Ch??u", "2005-12-06", 0, "732434215", "988888844", "tonnuchau@gmail.com", "37 Y??n Th???, ???? N???ng"),
(7, 1, "Nguy???n M??? Kim", "1984-04-08", 0, "856453123", "912345698", "kimcuong84@gmail.com", "K123/45 L?? L???i, H??? Ch?? Minh"),
(8, 3, "Nguy???n Th??? H??o", "1999-04-08", 0, "965656433", "763212345", "haohao99@gmail.com", "55 Nguy???n V??n Linh, Kon Tum"),
(9, 1, "Tr???n ?????i Danh", "1994-07-01", 1, "432341235", "643343433", "danhhai99@gmail.com", "24 L?? Th?????ng Ki???t, Qu???ng Ng??i"),
(10, 2, "Nguy???n T??m ?????c", "1989-07-01", 1, "344343432", "987654321", "dactam@gmail.com", "22 Ng?? Quy???n, ???? N???ng");

insert into service_type
value(1, "Villa"), (2, "House"), (3, "Room");

insert into rent_type
value(1, "year", 43432.99), (2, "month", 4482.00), (3, "day", 938.0), (4, "hour", 83.99);

insert into service
value
(1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'C?? h??? b??i', 500, 4),
(2, 'House Princess 01', 14000, 5000000, 7, 2, 2,'vip', 'C?? th??m b???p n?????ng', null, 3),
(3, 'Room Twin 01', 5000, 1000000, 2, 4, 3,'normal', 'C?? tivi', null, null),
(4, 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'C?? h??? b??i', 300, 3),
(5, 'House Princess 02', 10000, 4000000, 5, 3, 2, 'normal', 'C?? th??m b???p n?????ng', null, 2),
(6, 'Room Twin 02', 3000, 900000, 2, 4, 3,'normal', 'C?? tivi', null, null);

insert into attach_service
value
(1, 'Karaoke', 10000, 1, 'ti???n nghi, hi???n t???i'),
(2, 'Thu?? xe m??y', 10000, 2, 'h???ng 1 xe'),
(3, 'Thu?? xe ?????p', 20000, 2, 't???t'),
(4, 'Buffet bu???i s??ng', 15000, 3, '?????y ????? ????? ??n, tr??ng mi???ng'),
(5, 'Buffet bu???i tr??a', 90000, 3, '?????y ????? ????? ??n, tr??ng mi???ng'),
(6, 'Buffet bu???i t???i', 16000, 3, '?????y ????? ????? ??n, tr??ng mi???ng');

insert into contract
value
(1, '2020-12-08', '2020-12-08', 0, 3, 1, 3, 6),
(2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1, 4),
(3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2, 1),
(4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5, 5),
(5, '2021-07-14', '2021-07-15', 0, 7, 2, 6, 2),
(6, '2021-06-01', '2021-06-03', 0, 7, 7, 6, 2),
(7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4, 1),
(8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1, 5),
(9, '2020-11-19', '2020-11-19', 0, 3, 4, 3, 6),
(10, '2021-04-12', '2021-04-14', 0, 10, 3, 5, 1),
(11, '2021-04-25', '2021-04-25', 0, 2, 2, 1, 1),
(12, '2021-05-25', '2021-05-27', 0, 7, 10, 1, 3);

insert into contract_detail
value(1,5,2,4),(2,8,2,5),(3,10,2,6),(4,1,3,1),(5,11,3,2),(6,1,1,3),(7,2,1,2),(8,2,5,2);
