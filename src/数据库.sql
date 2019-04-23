#�������ݿ�
create database company;
use company;

#��̨����Ա��
create table adminuser(
uid int primary key auto_increment,
username varchar(255),
password varchar(255));

#������Ϣ��
create table returnmessage(
id int primary key auto_increment,  #����
content varchar(255),               #����
returndate Date,                   #����ʱ��
contact varchar(100)                #��ϵ��ʽ
);

#������Ϣ��
create table convenience(
id int primary key auto_increment,
title varchar(255),      #����
content varchar(255)     #����
);

#�ٱ���
create table report(
id int primary key auto_increment,
type varchar(255),      #�ٱ�����
content varchar(255),   #�ٱ�����
reportname varchar(255),#�ٱ���
productid varchar(255), #�ٱ���Ʒid
isdeal varchar(255),    #�Ƿ���ı�ʶ(0δ����1����
reportdate date);       #�ٱ�ʱ��

#һ��Ŀ¼��
create table category(
cid int primary key auto_increment,
cname varchar(255));


#����Ŀ¼
create table categorysecond(
csid int primary key auto_increment,
csname varchar(255),
cid int,
foreign key(cid) references category(cid));

#��Ʒ��
create table product(
pid int primary key auto_increment,
pname varchar(255),      #��Ʒ����
market_price double,     #�г��۸�
shop_price double,       #�����̳Ǽ۸�
image varchar(255),      #ͼƬ·��
num int,                 #������� 
pdesc varchar(255),      #��Ʒ����
is_hot int,              #�Ƿ�����
pdate datetime,          #�ϴ�����
csid int,                #������������Id   
uid int,                 #������Ʒ���û�id
is_top int,              #�Ƿ��ö�
shelves int,             #�¼ܣ�0,�ϼܣ�1����˲�ͨ����2
foreign key(uid) references user(uid),   
foreign key(csid) references categorysecond(csid));

#���۱�   
create table comments(
id int primary key auto_increment,
content text,    #�ظ����� 
cdate varchar(255),       #�ظ�����
productid int,            #��Ʒid 
userid int,               #�û�id    
foreign key(productid) references product (pid),
foreign key(userid) references user(uid));

#�������
create table orderitem(
itemid int primary key auto_increment,
count int,         #����
subtotal double,   #�ܼ�
pid int,           #��ƷId
oid int,           #��������id
uid int,           #�û�Id
foreign key(pid) references product(pid),
foreign key(oid) references orders(oid),
foreign key(uid) references user(uid));

#������  
create table orders(
oid int primary key auto_increment,  
total double,        #�ܼ�
ordertime datetime,  #����ʱ��
state int,           #����״̬1��δ���2��δ���� 3��δǩ�� 4�����׽���
name varchar(21),    #�����û�����
addr varchar(60),    #�û���ַ
phone varchar(20),   #�û��绰
ordernumber varchar(255),#�������
uid int,             #�û�id    
flag int,            #��־
bz varchar(255),     #��ע
foreign key(uid) references user(uid));

#�������
create table cartitem(
id int primary key auto_increment,  #����
pid int,                            #���ڵ���Ʒid
subtotal double,                    #С��
number int,                         #����
cartid int,                         #�����Ĺ��ﳵ
foreign key(cartid) references cart(id),
foreign key(pid) references product(pid));

#���ﳵ
create table cart(
id int primary key auto_increment,  #����
uid int,                            #�û�id
total double,                       #�ܼ�   
foreign key(uid) references user(uid));      


#�û���
create table user(
uid int primary key auto_increment,
username varchar(255),
password varchar(255),
name varchar(255),
email varchar(255),
phone varchar(255),
addr varchar(255),
state int,
code varchar(64));

#���뵽һ��Ŀ¼(category)������
insert into category (cid,cname) values(1,'�綯����');
insert into category (cid,cname) values(2,'��������');
insert into category (cid,cname) values(3,'�ֶ�����');
insert into category (cid,cname) values(4,'��������');
insert into category (cid,cname) values(5,'�繤����');
insert into category (cid,cname) values(6,'���߰�');
insert into category (cid,cname) values(7,'��������');

#�������ݵ��û���user)
insert into user(uid,username,password,name,email,phone,addr,state,code) values(1,'zhangfei','123','�ŷ�','zhangfei@163.com','12345678','�������211��',1,'45614587945891@059406');
insert into user(uid,username,password,name,email,phone,addr,state,code) values(2,'guanyu','123','����','guanyu@163.com','87654321','��������113��',1,'45634655454945891@059406');

#�����̨����Ա��adminuser)����
insert into adminuser(uid,username,password) values(1,'admin','admin');

#���뵽������Ϣ��convenience��
insert into convenience(id,title,content) values(1,'���Ǳ�����Ϣ','���Ǳ�����Ϣ����ѽ��');

#��Ӷ���Ŀ¼��categorysecond)
insert into categorysecond(csid,csname,cid) values(1,'�����',1);
insert into categorysecond(csid,csname,cid) values(2,'�����',1);
insert into categorysecond(csid,csname,cid) values(3,'�綯����',1);
insert into categorysecond(csid,csname,cid) values(4,'����',1);
insert into categorysecond(csid,csname,cid) values(5,'�ֵ���',1);
insert into categorysecond(csid,csname,cid) values(6,'����ǹ',2);
insert into categorysecond(csid,csname,cid) values(7,'��ǹ',2);
insert into categorysecond(csid,csname,cid) values(8,'�綯��Ͳ',2);
insert into categorysecond(csid,csname,cid) values(9,'��������',2);
insert into categorysecond(csid,csname,cid) values(10,'����ĥɰ��',2);
insert into categorysecond(csid,csname,cid) values(11,'��˿ǯ',3);
insert into categorysecond(csid,csname,cid) values(12,'�����',3);
insert into categorysecond(csid,csname,cid) values(13,'��˿������',3);
insert into categorysecond(csid,csname,cid) values(14,'������',3);
insert into categorysecond(csid,csname,cid) values(15,'��Ͳ',4);
insert into categorysecond(csid,csname,cid) values(16,'������',4);
insert into categorysecond(csid,csname,cid) values(17,'������',5);
insert into categorysecond(csid,csname,cid) values(18,'���ñ�',5);
insert into categorysecond(csid,csname,cid) values(19,'���߳�',6);
insert into categorysecond(csid,csname,cid) values(20,'������',6);
insert into categorysecond(csid,csname,cid) values(21,'���޹�������',7);
insert into categorysecond(csid,csname,cid) values(22,'�ۺϹ�������',7);


	#������Ʒ��product)��Ϣ����'
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves) values(1,'����TSB1300������������',300,230,'products/1/1.jpg',23,'ȫ������У���֤���������� ���ջ�����ƣ���С�ռ��������� ǿ���ʣ��ʺϸ�ǿ����ҵ',1,'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(2,	'���� GSB600RE ����� ����� ����',	450,	364,	 'products/1/2.jpg',	31,	'�߸��Լ���׼�ս������������׸�׼ȷ ����ȳߵĸ����ֱ� ����ת�л���������š����ж����˿ �������ƽ�굵֮������ת�� ԭװ��ͷ�ס���ͷװж���ɸ㶨 �ֶ����ߡ������걸',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(3,	'��˱� ����� 13mm �๦�ܣ����ã�ֽ�а棩 ����� ����',	470,	415,	 'products/1/3.jpg',	17,	'��˱� 13mm�๦�����õ������ֽ꣨�а棩',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(4,	'���� Z1J-FF04-13 ������� ��װ ����� ����',	257,	215,	 'products/1/4.jpg',	20,	'���ɳ��������װZ1J-FF04-13',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(5,'���� GSB 10.8-2-LI ����� ���ʽ ����� ����',520,465,	'products/1/5.jpg',22,'���� GSB 10.8-2-LI',1,'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(6,'���� ����� 13mm ���� ����� ����',	420,	377,	 'products/1/6.jpg',	11,	'����ר�����ֽṹ����ǿ�����',	0,	'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(7,	'���� GSB 16 ����� �¿� ����� ����',	355,	278,	 'products/1/7.jpg',	33,	'���� GSB 16',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(8,	'��ΰ ����� 18V ���� ���ʽ ����� ����',	650,	533,	 'products/1/8.jpg',	13,	'ǿ�� 18v ����ṩרҵ����꣬�Լ�����Ӧ�� �������ջ�����ƣ���������,  17λ�ɵ�Ť�ؿ��ƣ������ڸ��ֲ��ʼ���˿�ߴ� ����ת�ٵ��ڣ��ʺϸ�Ť�������Ӧ�� ����ת����',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(9,	'���� GSB 14.4VE-2-Li ����� ���ʽ �¿� ����� ����',	439,	323,	 'products/1/9.jpg',	40,	'���� GSB 14.4VE-2-Li',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(10,	'��˱� ����� 13mm �๦�ܣ����ã��ܺа棩 ����� ����',	567,	512,	 'products/1/10.jpg',	26,	'��˱� 13mm�๦�����õ������꣨�ܺа棩',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(11,	'���� GSB 18VE-2-Li ����� ���ʽ �¿� ����� ����',	339,	301,	 'products/1/11.jpg',	34,	'���� GSB 18VE-2-Li',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(12,	'�Ӻ蹤�� 500W������õ���',	720,	610,	 'products/1/12.jpg',	71,	'�Ӻ蹤�� 500W������õ���',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(13,	'���� IXO3 ���ӻ� ﮵� ���ʽ ����� �綯��˿�� ������',	620,	510,	 'products/1/13.jpg',	32,	'��ʽ���ٳ�������๦����ͷװ�ס���������ת/ʣ�������ʾ ���а�װ��ʹ������ LED�ƣ���ʹ�ںڰ����Կ�������ҵ�������갴ť',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(14,	'��˱� �綯���� 3.6V ���ÿ� ����� �綯��˿�� ������',	510,	478,	 'products/1/14.jpg',	40,	'1��Ť��ǿ��������ݣ� 2��ͷ����������LED�����ƣ� 3����24PCS��ͷ��3pcs�黨��ͷ�������ճ�����',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(15,	'���� DCJZ09-10 ���ӵ��� A�� ���ʽ ����� �綯��˿��',	385,325,	 'products/1/15.jpg',	50,	'���ɳ��ʽ���ӵ���DCJZ09-10(A��)',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(16,	'���� ���ӵ��� 12V ���� ����� �綯��˿�� ������',	197,	150,	 'products/1/16.jpg',	67,	'�������������ֱ��� ���ӵ��٣�����ת����',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(17,	'���� GSR Li-Lon ����� 3.6V ���ӻ� ����� �綯��˿��',	657,	613,	 'products/1/17.jpg',	21,	'���������/���ӻ� GSR 3.6V Li-Lon',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(18,	'���� GSR Li-Lon ����� 3.6V ���ӻ� ����� �綯��˿��',	369,	312,	 'products/1/18.jpg',	16,	'���������/���ӻ� GSR 3.6V Li-Lon',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(19,	'���� TSR 1080-2-Li ����� QR ����� ����� �綯��˿��',	713,	657,	 'products/1/19.jpg',	34,	'���������/���ӻ���QR�� TSR 1080-2-Li�����',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(20,	'���� DCJZ10-10 ���ӵ��� B�� ���ʽ ����� �綯��˿��',	514,	456,	 'products/1/20.jpg',	22,	'���ɳ��ʽ���ӵ���DCJZ10-10(B�ͣ�',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(21,	'���� ������� 3.6V1000mAH AC 230~240V �綯����',	327,	286,	 'products/1/21.jpg',	45,	'���� �������',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(22,	'���� BN6112 ���� ���ʽ ����� �綯��˿�� ������',	435,	398,	 'products/1/22.jpg',	55,	'���� BN6112',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(23,	'���� GSR BitDrive ����� 3.6V ���ӻ� ����� �綯��˿��',	536,	488,	 'products/1/23.jpg',	67,	'���������/���ӻ�3.6V GSR BitDrive',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(24,	'���� ���ӵ��� 7.2V ���� ����� �綯��˿�� ������',	612,	573,	 'products/1/24.jpg',	17,	'�����ս����ֱ� �����Ĺ̶��ҹ� ����ĵ����ƶ���',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(25,	'���� ������� 18V ﮵� ���ʽ �綯���� �����',	751,	711,	 'products/1/25.jpg',	32,	'255N��mǿ��Ť����� ˫ģʽ���� ��Ч�������',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(26,	'���� DCPB16 ������� E�� ���ʽ �綯���� �����',	367,	313,	 'products/1/26.jpg',	27,	'���ɳ��ʽ�������DCPB16(E�ͣ�',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(27,	'���� GDS 18V EC 250 ������� ���ʽ ��� �綯����',	456,	413,	 'products/1/27.jpg',	13,	'���� GDS 18V EC 250',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(28,	'���� GDS18V-EC250 �綯���� ���ʽ �綯���� �����',	678,	610,	 'products/1/28.jpg',	10,	'250ţ��Ť�أ�����������Ӧ�� ��������ϵͳ���ɴ������в���18v������ ������ع�����ر���ϵͳ��ȷ����ظ����١�����Ч LED��ƣ��ṩ�����Ĺ�������',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(29,	'���� GDR 10.8-LI ���ӻ� 2.0AH ���ʽ ��� �綯����',	326,	298,	 'products/1/29.jpg',	65,	'���� GDR 10.8-LI ���ӻ�',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(30,	'����ʿ ������� 12V ���ʽ ﮵� �綯���� �����',	755,	680,	 'products/1/30.jpg',	45,	'����ʿ �������',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(31,	'���� ���� 580W ���� ľ���� ������',	712,	650,	 'products/1/31.jpg',	12,	'�����ա����ͣ� ����ת�ٶȣ� �߾��ȵ�����֤����Ч��',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(32,	'���� ���� 620W ���� ľ���� ������',	650,	612,	 'products/1/32.jpg',	34,	'2.6mm������ȣ����ƶ˸ǽṹ��̣���������֧�ţ��߾��ȵ�����֤����Ч��',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(33,	'���� M1B-FF-82*1 ���� ���� ľ���� ������',	123,	97,	 'products/1/33.jpg',	45,	'���� M1B-FF-82*1',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(34,	'���� M1B-FF02-82*1 ���� ���� ľ���� ������',	345,	312,	 'products/1/34.jpg',	22,	'���ɵ���M1B-FF02-82*1',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(35,	'���� GHO 10-82 ���� ���� ľ���� ������',	486,	412,	 'products/1/35.jpg',	30,	'���� GHO 10-82	',1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(36,	'���� ���� 110mm(4-3/8") ���� ľ���� ������',	322,	245,	 'products/1/36.jpg',	70,	'110���׿���ٵ������������������2����',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(37,	'���� 1982 ���� ���� ľ���� ������',	674,	633,	 'products/1/37.jpg',	56,	'���� 1982',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(38,	'���� ���� 82mm(3-1/4") ���� ľ���� ������',	725,	612,	 'products/1/38.jpg',	43,	'���ֵĽǶȺ���״�����ճ֡��ƶ���Я��',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(39,	'���� ���� 82mm(3-1/4") ���� ľ���� ������',	543,	455,	 'products/1/39.jpg',	26,	'500��ǿ����������ʸ��ߣ�����Ч�����ã�',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(40,	'���� ���� 470W ���� ľ���� ������',	236,	188,	 'products/1/40.jpg',	65,	'�����ա����ͣ� ����ת�ٶ�',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(41,	'���� TBM3400 �ֵ��� ���� �ֵ���',	345,	287,	 'products/1/41.jpg',	32,	'���ʸ�ǿ��ת�ٸ��죻������и����ã�ͬ�Ķȸ��ߣ�������ת�����ٹ��ܣ��ʺ϶�����ҵ',	1,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(42,	'���� �ֵ��� 6mm ���� ���� �ֵ���',	459,	411,	 'products/1/42.jpg',	12,	'������ƽ���Խṹ ˫�ؾ�Ե�����ҹ�����֬���� ��ת��4500/min(����)',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(43,	'��ΰ ���� 10mm 380W ���� ���� �ֵ���',	309,	243,	 'products/1/43.jpg',	20,	'��Ҷ��ͨ�����ƣ���Ч����  ����ת��֧���ᣬ�� ����� �;���  ����������ƽ�������ã�����ʹ��',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(44,	'��ΰ ���� 10mm 550W ���� ���� �ֵ���',	850,	720,	 'products/1/44.jpg',	67,	'��Ҷ��ͨ�����ƣ���Ч����  ����ת��֧���ᣬ�� ����� �;���  ����������ƽ�������ã�����ʹ��',	1,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(45,	'���� GBM13RE �ֵ��� ���� �ֵ���',	643,	580,	 'products/1/45.jpg',	45,	'�߸��Լ���׼�ս������������׸�׼ȷ�����������ʵ���������ۣ��˻�����ѧ������հѣ���Ч��ƣ�ͣ�ԭװ��ͷ�ף���ͷװж���ɸ㶨',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(46,	'���� �ֵ��� 10mm ���� ���� �ֵ���',	450,	405,	 'products/1/46.jpg',	32,	'�ɵ��ٺ�����ת���� ��������� ��׼��������ͷԿ��',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(47,	'���� J1Z-FF-10A �ֵ��� ���� �ֵ���',	309,	276,	 'products/1/47.jpg',	76,	'�����ֵ���J1Z-FF-10A',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(48,	'���� �ֵ��� 10mm ���� ���� �ֵ���',	706,	643,	 'products/1/48.jpg',	48,	'�����ͻ��� ���ӵ��٣�����ת���� ��׼��������ͷ����',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(49,	'���� J1Z-FF02-13 �ֵ��� ���� �ֵ���',	803,	715,	 'products/1/49.jpg',	32,	'�����ֵ���J1Z-FF02-13',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(50,	'���� ���� 10mm(3/8")450W ��Կ�׼�ͷ ���� �ֵ���',	435,	380,	 'products/1/50.jpg',	10,	'����С�ɣ�����ǿ�� ���ӵ��٣�����ת���� ��׼��������ͷԿ�� ���幤��ѧ��Ʒ����ֱ�',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(51,	'��ΰ ���� 13mm 701W ���� ���� �ֵ���',	687,	612,	 'products/1/51.jpg',	20,	'��Ҷ��ͨ�����ƣ���Ч����  ����ת��֧���ᣬ�� ����� �;���  ����������ƽ�������ã�����ʹ�� ��ȫ�����ֱ�����������',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(52,	'���� 6410ER ���� ���� �ֵ���',	268,	210,	 'products/1/52.jpg',	67,	'���� 6410ER',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(53,	'ʷ�����ܽ���ǹ4',	735,	656,	 'products/1/53.jpg',	23,	'ʷ�����ܽ���ǹ4',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(54,	'�ֶ�4"�ܽ���ǹ',	456,	402,	 'products/1/54.jpg',	34,	'��ǹ���쳤100mm���ֱ�����  ���ھ�ȷ���Ʒ����ͷ���  �����ڸ��ֻ�е�������ĳ���  ������ѹ��0-8����  6mm ������ͷ',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(55,	'���ﴵ��ǹ250MM',	567,	510,	 'products/1/55.jpg',	45,	'���ﴵ��ǹ250MM',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(56,	'�ֶ�10"�ܽ���ǹ',	684,	620,	 'products/1/56.jpg',	36,	'��ǹ���쳤250mm���ֱ�����  ���ھ�ȷ���Ʒ����ͷ���  �����ڸ��ֻ�е�������ĳ��� ������ѹ��0-8���� 6mm ������ͷ',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(57,	'���ﴵ��ǹ100MM',	324,	280,	 'products/1/57.jpg',	12,	'���ﴵ��ǹ100MM',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(58,	'�ݿ�250MM����ǹ',	270,	233,	 'products/1/58.jpg',	75,	'�ݿ�250MM����ǹ',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(59,	'�ݿ�100MM����ǹ',	643,	610,	'products/1/59.jpg',	64,	'�ݿ�100MM����ǹ',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(60,	'��������ǹNEW71-3S(��PC-2)',	720,	667,	 'products/1/60.jpg',	51,	'��������ǹNEW71-3S(��PC-2)',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(61,	'��������ǹW101-152G����PC-4S��',	530,	484,	 'products/1/61.jpg',	34,	'��������ǹW101-152G����PC-4S��',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(62,	'��������ǹNEW77-2S(��PC-1)',	426,	374,	 'products/1/62.jpg',	24,	'��������ǹNEW77-2S(��PC-1)',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(63,	'����ֱ��ǹFF-F30',	560,	511,	 'products/1/63.jpg',	32,	'����ֱ��ǹFF-F30',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(64,	'����F32ֱ��ǹ',	364,	302,	 'products/1/64.jpg',	40,	'����F32ֱ��ǹ',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(65,	'����T50SAֱ��ǹ',	674,	623,	 'products/1/65.jpg',	12,	'����T50SAֱ��ǹ',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(66,	'��Ըֱ��ǹ��ѹ�����壩',	450,	412,	 'products/1/66.jpg',	76,	'��Ըֱ��ǹ��ѹ�����壩',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(67,	'����ֱ��ǹT50A',	870,	813,	 'products/1/67.jpg',	80,	'����ֱ��ǹT50A',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(68,	'��Ըֱ��ǹ��ѹ�����壩',	557,	503,	 'products/1/68.jpg',	56,	'��Ըֱ��ǹ��ѹ�����壩',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(69,	'���ؾ�ǹCN55',305,	228,	 'products/1/69.jpg',	50,	'���ؾ�ǹCN55',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(70,	'����������ǹ45-70MM',	354,	311,	 'products/1/70.jpg',	36,	'����������ǹ45-70MM',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(71,	'���ؾ�ǹCN70B',	459,	413,	'products/1/71.jpg',	22,	'���ؾ�ǹCN70B',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(72,	'��Ը��ǹ��ѹ�����壩',	732,	678,	 'products/1/72.jpg',	39,	'��Ը��ǹ��ѹ�����壩',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(73,	'����3/8"ϵ�����Ƿ綯��Ͳ19MM',	654,	612,	 'products/1/73.jpg',	37,	'����3/8"ϵ�����Ƿ綯��Ͳ19MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(74,	'����3/8"ϵ�����Ƿ綯����Ͳ17MM',	546,	531,	 'products/1/74.jpg',	38,	'����3/8"ϵ�����Ƿ綯����Ͳ17MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(75,	'����3/8"ϵ�����Ƿ綯����Ͳ19MM',	846,	813,	 'products/1/75.jpg',	12,	'����3/8"ϵ�����Ƿ綯����Ͳ19MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(76,	'����3/8"ϵ�����Ƿ綯����Ͳ7MM',	312,	276,	 'products/1/76.jpg',	13,	'����3/8"ϵ�����Ƿ綯����Ͳ7MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(77,	'����3/8"ϵ�����Ƿ綯��Ͳ12MM',	516,	470,	 'products/1/77.jpg',	45,	'����3/8"ϵ�����Ƿ綯��Ͳ12MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(78,	'����3/8"ϵ�����Ƿ綯����Ͳ12MM',	653,	611,	 'products/1/78.jpg',	56,	'����3/8"ϵ�����Ƿ綯����Ͳ12MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(79,	'����3/8"ϵ�����Ƿ綯��Ͳ10MM',	753,	714,	 'products/1/79.jpg',	12,	'����3/8"ϵ�����Ƿ綯��Ͳ10MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(80,	'����3/8"ϵ�����Ƿ綯��Ͳ9MM',	855,	813,	 'products/1/80.jpg',	23,	'����3/8"ϵ�����Ƿ綯��Ͳ9MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(81,	'����3/8"ϵ�����Ƿ綯��Ͳ13MM',	264,	213,	 'products/1/81.jpg',	45,	'����3/8"ϵ�����Ƿ綯��Ͳ13MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(82,	'����3/8"ϵ�����Ƿ綯��Ͳ8MM',	139,	97,	 'products/1/82.jpg',	56,	'����3/8"ϵ�����Ƿ綯��Ͳ8MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(83,	'�ݿ�1/2"�����������',	357,	305,	 'products/1/83.jpg',	78,	'�ݿ�1/2"�����������',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(84,	'Ӣ������1"�����������',	399,	366,	 'products/1/84.jpg',	87,	'Ӣ������1"�����������',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(85,	'�ֶ�1/2"��ҵ�����ϲ�����������',	544,	505,	 'products/1/85.jpg',	54,	' ˫������ṹ��Ť��ǿ���������������  ���ϲ��������ƣ��������ɣ�����ʡ�������͹���ǿ��  �հ��������ã��䱸����װ�ã���С��������  ���������������',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(86,	'����1/2"ǿ�������������',	805,	764,	 'products/1/86.jpg',	65,	'����1/2"ǿ�������������',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(87,	'Ӣ������1/2�������������',	538,	489,	 'products/1/87.jpg',	21,	'Ӣ������1/2�������������',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(88,	'����1/2"��Ť�������������',	647,	612,	 'products/1/88.jpg',	32,	'����1/2"��Ť�������������',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(89,	'�ֶ�3/4"��ҵ�����ϲ�����������',	123,	78,	 'products/1/89.jpg',	3,	 '˫������ṹ��Ť��ǿ���������������  ���ϲ��������ƣ��������ɣ�����ʡ�������͹���ǿ��  �հ��������ã��䱸����װ�ã���С��������',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(90,	'����1/2"���ϲ��������������',	452,	412,	 'products/1/90.jpg',	14,	'����1/2"���ϲ��������������',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(91,	'����1/2"רҵ��ǿ�������������',	369,	322,	 'products/1/91.jpg',	25,	'����1/2"רҵ��ǿ�������������',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(92,	'�ݿ�1/2"���ϲ��������������',	751,	714,	 'products/1/92.jpg',	36,	'�ݿ�1/2"���ϲ��������������',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(93,	'����������ʽ��ĥ��',	658,	612,	 'products/1/93.jpg',	74,	'����������ʽ��ĥ��',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(94,	'����5"��������ʽ������ĥ��',	357,	312,	 'products/1/94.jpg',	85,	'����5"��������ʽ������ĥ��',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(95,	'����5"������ĥ��',	664,	612,	 'products/1/95.jpg',	14,	'����5"������ĥ��',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(96,	'Ӣ����������ĥ���',	227,	208,	 'products/1/96.jpg',	34,	'Ӣ����������ĥ���',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(97,	'��������������̥��ĥ��',	643,	612,	 'products/1/97.jpg',	24,	'��������������̥��ĥ��',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(98,	'��������������ĥ������',	276,	237,	 'products/1/98.jpg',	26,	'��������������ĥ������',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(99,	'��������������ĥ������',	357,	312,	 'products/1/99.jpg',	13,	'��������������ĥ������',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(100,	'�ݿ�6"������ĥ��',	456,	377,	'products/1/100.jpg',	46,	'�ݿ�6"������ĥ��',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(101,	'�ݿ�5"������ĥ��',	577,	523,	'products/1/101.jpg',	79,	'�ݿ�5"������ĥ��',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(102,	'�����˿ǯ7',	746,	711,	 'products/1/102.jpg',	87,	'ǯ�����55CRNI������ɣ��пھ������Ƶ��������幤��ѧTPR�ֱ�����������',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(103,	'�ֶ�ר��������ʡ��ƫ�ĸ�˿ǯ6',	546,	506,	 'products/1/103.jpg',	54,	'��������CR-NI����������죬��ʵ���� ƫ������ƣ��п������Ƶ�ȴ������и���ʡ�� �������˫ɫPP+TPR�ֱ����ճ�����',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(104,	'��˱�FS�ֱ���˿ǯ8',	608,	539,	 'products/1/104.jpg',	21,	'1��Cr-V���ʣ��ȴ��������� 2��˫ɫ�ֱ����ճ����ʡ�',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(105,	'�ֶ�˫ɫ����˿ǯ7',	456,	416,	 'products/1/105.jpg',	31,	'ǯ����ø����ֶ��죬������� �пھ����⴦����������ǿ TPR+PP˫�����ױ����ճ����� ��������ANSI��׼',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(106,	'�ֶ�˫ɫ����˿ǯ8',	349,	310,	'products/1/106.jpg',	64,	 'ǯ����ø����ֶ��죬�������  �пھ����⴦����������ǿ  TPR+PP˫�����ױ����ճ�����  ��������ANSI��׼',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(107,	'���¹��߶๦��ǿ����˿ǯ̼�ֵ繤����ǯʡ���ϻ�ǯ��',	489,	425,	 'products/1/107.jpg',	75,	'����ƫ������� ʡ���ɴ�35%���ϡ�β������ѹ�߿���� ʹ�ø����㹦�ܸ�ȫ�档��׳�ֱ���� ����ʱ�о������ʡ�',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(108,	'�¹���˿ǯ TD3001A 6',	746,	701,	 'products/1/108.jpg',	45,	'��˿ǯ',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(109,	'��˹���� ��˿ǯ',	344,	302,	 'products/1/109.jpg',	12,	'��ǯ��',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(110,	'����޼�ʡ����˿ǯ',	612,	570,	 'products/1/110.jpg',	32,	'HF-8101107',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(111,	'�ֶ�˫ɫ����˿ǯ6',	544,	503,	 'products/1/111.jpg',	65,	 'ǯ����ø����ֶ��죬�������  �пھ����⴦����������ǿ  TPR+PP˫�����ױ����ճ�����  ��������ANSI��׼',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(112,	'����մ��ŷʽ�����8 �๦�ܻ�ڰ��� �������',	460,	412,	 'products/1/112.jpg',	45,	'����̼�� ��������������͸�ʴ�������� ȫ�ֱ�մ�ܣ��ճָ��ο� ����̶�ָʾ�����ڳߴ��ֱ�� ���ػ����ӹ���������˳�� ͷ�������ȴ���ǿ�ȸ��ߣ�����ĥ��ʹ�������־�',	0,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(113,	'�ݿ���ͨ�ͻ����AW-6',	368,	312,	 'products/1/113.jpg',	12,	'�����������ھ��ӿ����÷�Χ���� ����̼�ֶ��죬��ĥ������',	1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(114,	'�������� 4	',654,	603,	 'products/1/114.jpg',	32,	'���ø����ֲ�����������ĥ������	',1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(115,	'�ش��ͻ������TD3024',	531,	470,	 'products/1/115.jpg',	21,	'�ش��ͻ�����֣������ѹ������ר��',	0,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(116,	'ʷ���������15',	566,	521,	 'products/1/116.jpg',	65,	'��������̼�ֶ��졣 ǯ�ھ�����Ӳ���ػ����г�ǿ���� ������ĸ���������硣 ͨ��������ȫ����⡣ �ھ�������̶ȣ����ڲ�����',	1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(117,	'��˱�FS�ֱ��󿪿ڻ����8',	610,	560,	 'products/1/117.jpg',	87,	'��̼�ֶ��죬�ȴ���Ӳ�ȸߣ��̶�������ת�����ѳ�����',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(118,	'�������� 6',	627,	576,	 'products/1/118.jpg',	45,	'���ø����ֲ�����������ĥ������',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(119,	'ʷ����մ�ܱ��������10',	513,	456,	 'products/1/119.jpg',	56,	'Cr-v�߼��Ͻ�ֶ�����ɣ�������Ӳ�ȸ߼г�ǿ���� ˫ɫմ���ֱ��ճ����ʣ�ǯ��������̶ȣ����ڲ�����',	0,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(120,	'ʷ����մ�ܱ��������12',	567,	506,	 'products/1/120.jpg',	12,	'Cr-v�߼��Ͻ�ֶ�����ɣ�������Ӳ�ȸ߼г�ǿ���� ˫ɫմ���ֱ��ճ����ʣ�ǯ��������̶ȣ����ڲ�����',	0,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(121,	'����մ��ŷʽ�����6',	357,	301,	 'products/1/121.jpg',	32,	'����̼�� ��������������͸�ʴ�������� ȫ�ֱ�մ�ܣ��ճָ��ο� ����̶�ָʾ�����ڳߴ��ֱ�� ���ػ����ӹ���������˳�� ͷ�������ȴ���ǿ�ȸ��ߣ�����ĥ��ʹ�������־�',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(122,	'��˱�6������˿����ֵ��װ ʮ��һ��÷������ ��˿����׶',	450,	403,	 'products/1/122.jpg',	45,	'1��̼�ֵ��ˣ�ͷ�������ȴ���Ӳ�ȸߣ����� 2��ͷ�������ԡ�',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(123,	'��˱�18PC����˫ɫ��˿������',	540,	483,	 'products/1/123.jpg',	41,	'��˱�18PC',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(124,	'���׵�6��������˿��',	620,	573,	 'products/1/124.jpg',	32,	'Cr-Mo�Ͻ�ֵ��ˣ�Ť����Ӳ�ȼѡ�',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(125,	'�ֶ�6���׳�ֵװ��˿��',	347,	304,	 'products/1/125.jpg',	30,	 '���˲���Cr-V-Mo���ʸֲģ�����Ƹ�����  ��ͷ���ڴ�����ǿ��  �ֱ��������幤��ѧ��ƣ��ճ�����',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(126,	'ʷ����2���׽�����˿��',	267,	202,	 'products/1/126.jpg',	20,	'ʷ����2���׽�����˿��',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(127,	'�ֶ�27��������˿��������װ',	189,	132,	 'products/1/127.jpg',	27,	 '��ͷ����S2���ʸֲģ���������  ���˱���Ƹ��������Ժ�  �������Ͻ���˿���ֱ������ƣ���Ƕ�𽺣��ճ�����  ����ͷ����ת����0�ȣ�45�ȣ�90�Ƚǲ���',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(128,	'��˱�38PC����˫ɫ������˿��',	543,	501,	 'products/1/128.jpg',	67,	'��˱�38PC',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(129,	'����8��Aϵ��һ�֡�ʮ����˿������',	305,	257,	 'products/1/129.jpg',	50,	'����SVCM+���ϵ��ˣ������ȴ���Ť����Ч���20%����ǿ�����������׹ܣ�ʹ�����������ã����幤ѧ�ư���ƣ�ʹ�ø����㣻���̴�������ֱ���������ܸ�ǿ����������',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(130,	'ʷ����8���׳�ֵװ��˿��',	645,	603,	 'products/1/130.jpg',	58,	'������˿��ͷ�����ڴ��� ���ʸ����ֲ��ϣ������͸�ʴ�� �������幤��ѧ��Ƶ�˫�����ֱ���������͹���ƣ��ָ����ʣ���Ч��ֹ�򻬡� ����������ζ�����ƣ�Ť������30%',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(131,	'����8�������ͳ����˿������',	612,	570,	 'products/1/131.jpg',	64,	'����8��������',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(132,	'��˱�˫ɫ����������9mm',	456,	412,	 'products/1/132.jpg',	45,	'1���������Ͻ�����ֱ���2���ֹܱں��1.2mm��������á�',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(133,	'����޼�������',	546,	502,	'products/1/133.jpg',	65,	'HF-8210118',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(134,	'���¹�����������������',705,	633,	 'products/1/134.jpg',	12,	'�����и���ֽ�� ���������������� �������� ������TPR������ ʹ�ø���ȫ��',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(135,	'�������ܱ���ť������8��18x100MM',	645,	601,	 'products/1/135.jpg',	32,	'�������ܱ���ť������8��18x100MM',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(136,	'�ֶ�18mm�߼��컻��Ƭ��������(��2Ƭ���õ�Ƭ)',	577,	512,	 'products/1/136.jpg',	78,	'��Ƭ����SK5���ʲ��ϣ���������  ����ֻ��ʣ���̰�ȫ  ���ǲ��ù�������ABSע�ܶ��ɣ���ʵ����  ��Ƭ�Զ���������������ȫ  �ֱ��������幤��ѧ��ƣ��ճ�����',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(137,	'�ﵺ������701',	712,	645,	'products/1/137.jpg',	42,	'�ﵺ������701',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(138,	'�Ӻ蹤��������',	530,	480,	'products/1/138.jpg',	53,	'�Ӻ蹤��������',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(139,	'ʷ������ť˫ɫ��������18mm (3��Ƭ)',	730,	675,	 'products/1/139.jpg',	14,	'ʷ������ť˫ɫ��������18mm (3��Ƭ)',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(140,	'ʷ��������˫ɫ��������18mm (3��Ƭ)',	467,	423,	 'products/1/140.jpg',	25,	'ʷ��������˫ɫ��������18mm (3��Ƭ)',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(141,	'�ݿ�A��ϵ��С��������CF-33',	367,	312,	 'products/1/141.jpg',	36,	'��Ƭ����SK2+CR���ϣ����������� ��̼���ߴ�1.2��ά��Ӳ�ȸߴ�840�� ��Ƭ�ĵ��в�������ĥ���������ã�������ʹ����������̼ͨ�ֵ�Ƭ�ߴ�10������ �������ABSס�޶���',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(142,	'������ AAA K00 �ֵ�Ͳ ǿ�� Զ�� ս����ˮ���� ��������',	452,	403,	 'products/1/142.jpg',	34,	'������AAA�ֵ�ͲK00',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(143,	'������ AAA K00 �ֵ�Ͳ ',	572,	523,	 'products/1/143.jpg',	21,	'������ AAA K00 �ֵ�Ͳ ',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(144,	'�ֶ� �ֵ�Ͳ 1�� 5�ŵ�� 1LED ��ǿ�����Ͻ� ǿ�� Զ��',	632,	557,	 'products/1/144.jpg',	44,	 '�������Ͻ���ǣ���ʵ�ι�  ���ù���LED����  ���÷����ܷ������',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(145,	'�ֶ� �ֵ�Ͳ 3W 2��1�ŵ�� ���ν�ճ���LED ǿ�� Զ��',	726,	664,	 'products/1/145.jpg',	12,	'��ǲ������Ͻ�����ر���ƣ���ʵ����  ���ڳ���CREE LED���飬ʹ������100000Сʱ����  ���з����ܷ������',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(146,	'ʷ���� �ֵ�Ͳ 2xAA ��ǿ�����Ͻ�LED ǿ�� Զ��',	462,	402,	 'products/1/146.jpg',	67,	'ʷ���� �ֵ�Ͳ 2xAA ��ǿ�����Ͻ�LED ǿ�� Զ�� ս����ˮ���� ��������',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(147,	'������ AAA K1 �ֵ�Ͳ ǿ�� Զ�� ս����ˮ���� ��������',	345,	301,	 'products/1/147.jpg',	23,	'������ AAA K1 �ֵ�Ͳ ǿ�� Զ�� ս����ˮ���� ��������',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(148,	'ҹӥ 3AAA3W ��Ͳ 13�� ��ɫ���Ͻ�ӳ��� ǿ���ֵ�Ͳ',	496,	434,	 'products/1/148.jpg',	77,	'ҹӥ 3AAA3W ��Ͳ 13�� ��ɫ���Ͻ�ӳ��� ǿ���ֵ�Ͳ Զ����',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(149,	'���� �ֵ�Ͳ ���� ǿ�� Զ�� ս����ˮ���� ��������',	321,	278,	 'products/1/149.jpg',	9,	'���� �ֵ�Ͳ ���� ǿ�� Զ�� ս����ˮ���� ��������',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(150,	'������ P2 AAA �ֵ�Ͳ 360����ת���� ǿ��',	614,	573,	 'products/1/150.jpg',	45,	'������360����ת�����ֵ�P2 AAA',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(151,	'�ݿ� LED�� 30�� ���ʽ�ֳ� ��繤����',	456,	403,	 'products/1/151.jpg',	32,	'�ݿ� LED�� 30�� ���ʽ�ֳ� ��繤����',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(152,	'���� ������ �ֳ�ʽ ���������� ET�� ά�޵� Ӧ����',	653,	612,	 'products/1/152.jpg',	12,	'���� ������ �ֳ�ʽ ���������� ET�� ά�޵� Ӧ����',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(153,	'ʷ���� ������ 30LED ﮵�๦�� ���������� ET��',	720,	673,	 'products/1/153.jpg',	45,	'ʷ���� ������ 30LED ﮵�๦�� ���������� ET�� ά�޵� Ӧ����',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(154,	'�ݿ� ������ �� ��� ���������� ET�� ά�޵� Ӧ����',	245,	203,	 'products/1/154.jpg',	65,	'�ݿ� ������ �� ��� ���������� ET�� ά�޵� Ӧ����',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(155,	'���� LED�� 18�� �ֳ�﮵� ��繤����',	365,	312,	 'products/1/155.jpg',	45,	'���� LED�� 18�� �ֳ�﮵� ��繤����',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(156,	'���� �ֵ�Ͳ 18LED���ʽ��ˮ ǿ�� Զ�� ս����ˮ����',	451,	378,	 'products/1/156.jpg',	78,	'���� �ֵ�Ͳ 18LED���ʽ��ˮ ǿ�� Զ�� ս����ˮ���� ��������',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(157,	'�ֶ� ������ ������ ���������� ET�� ά�޵� Ӧ����',	364,	302,	 'products/1/157.jpg',	45,	'360�ȿ�������ת֧��  ��ǿ����֧�ܵ������������⹤������ʹ�� ? ���Ի�ؽڣ��ɿ������ת��������  4�����ؿ��ƣ�3������ģʽ����������  ����ר��������',	1,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(158,	'�ֶ� ������ �๦�ܳ�� ���������� ET�� ά�޵� Ӧ����',	457,	413,	 'products/1/158.jpg',	32,	'���Ʋ���1.5W����LED���飬���ȸߣ����ܵ��ֲ���3mm���͸���ֻ���������͸���ȣ����ͣ���ѹ  ������3.7V�ɳ�﮵�أ�����1500mAh�����󣬿�����ʹ��3Сʱ',	0,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(159,	'ҹӥ �۹�� 5W ﮵�سȺ�ɫ',	423,	372,	 'products/1/159.jpg',	16,	'ҹӥ �۹�� 5W ﮵�سȺ�ɫ',	0,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(160,	'ʷ���� ������ 45W 220V ���ӹ���',	451,	406,	 'products/1/160.jpg',	32,	'ʷ���� ������ 45W 220V ���ӹ���',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(161,	'ʷ���� ������ 30W 220V ���ӹ���',	635,	600,	 'products/1/161.jpg',	21,	'�����ֱ�����ʱ��ʹ�ò���ƣ�͡� ����о������㡣',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(162,	'�ݿ� LSI-50 ������ ����ʽ������ ���ӹ���',	711,	642,	 'products/1/162.jpg',	45,	'���ϲ���60Cr-V�����֣�ǿ�ȸ����Ժ� ������öƸ�������������ǿ',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(163,	'�ݿ� LSI-60 ������ ����ʽ������ ���ӹ���',	225,	185,	 'products/1/163.jpg',	56,	'���ϲ���60Cr-V�����֣�ǿ�ȸ����Ժ� ������öƸ�������������ǿ',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(164,	'���� ������ 60�� ����ʽ���� ���ӹ���',	340,	301,	 'products/1/164.jpg',	12,	'60������ʽ���ٵ�����',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(165,	'���� ������ 40�� �մ�����ʽ��ҵ�� ���ӹ���',	443,	402,	 'products/1/165.jpg',	23,	'40���մ�����ʽ��ҵ��������',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(166,	'���� ������ 60�� �մ�����ʽ��ҵ�� ���ӹ���',	576,	523,	 'products/1/166.jpg',	45,	'60���մ�����ʽ��ҵ��������',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(167,	'ʷ���� ������ 40W ����ʽ ���ӹ���',	234,	200,	 'products/1/167.jpg',	56,	'ʷ��������ʽ������40W',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(168,	'���� ������ 20��/130�� ��������˫���� ���ӹ���',	654,	623,	 'products/1/168.jpg',	14,	'���� ������ 20��/130�� ��������˫���� ���ӹ���',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(169,	'�ֶ� �������ñ� ǯʽ ���ܱ�',	476,	431,	 'products/1/169.jpg',	25,	'����Ʒ��һ�������ȶ�����ȫ���ɿ���3-1/2λ����ǯʽ��ȫ���̹��ر����Ͷ��ص������ƣ�ʹ֮��Ϊ���ܸ�Ϊ׿Խ����һ��ʵ�õ繤�����Ǳ� ������ұ�������졢ʯ�͡�����',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(170,	'������ UT39A �������ñ� ������ ���ܱ�',	782,	722,	 'products/1/170.jpg',	36,	'������ UT39A �������ñ� ������ ���ܱ�',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(171,	'������ UT33A �������ñ�(�ڶ����� ������ ���ܱ�',	451,	422,	 'products/1/171.jpg',	41,	'������ UT33A �������ñ�(�ڶ����� ������ ���ܱ�',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(172,	'������ UT39C �������ñ� ������ ���ܱ�',	324,	300,	 'products/1/172.jpg',	52,	'������ UT39C �������ñ� ������ ���ܱ�',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(173,	'������ UT33D �������ñ�(�ڶ����� ������ ���ܱ�',	654,	612,	 'products/1/173.jpg',	63,	'������ UT33D �������ñ�(�ڶ����� ������ ���ܱ�',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(174,	'������ UT136A �������ñ� ������ ���ܱ�',	123,	78,	 'products/1/174.jpg',	74,	'������ UT136A �������ñ� ������ ���ܱ�',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(175,	'ʷ���� �������ñ� ������ ���ܱ�',	256,	211,	 'products/1/175.jpg',	45,	'ʷ�����������������ñ�',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(176,	'�ֶ� �������ñ� ���ܱ�',	345,	312,	 'products/1/176.jpg',	61,	'���������ñ��ǹ�����ȫ�������ȶ������ȸߣ����ĵͣ��ṹ��ӱ����ȫ�ɿ���С���ֳ�ʽ�Զ������������ñ��ǹ���û�����������Ǳ� �����ڼ�ͥ��ѧУ��ұ����ͨѶ����',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(177,	'��˹���� �������ñ�',	642,	621,	 'products/1/177.jpg',	52,	'��˹���� �������ñ�',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(178,	'�ֶ� ���߳� 680x458x995mm 7���� �Ƴ� �๦�����Ƴ�',	624,	578,	 'products/1/178.jpg',	62,	'7���룬���黬����ƣ�����������  ���濾�ᣬ��������ǿ�����β������ܽ�  ɲ��ϵͳ��ȫ�ɿ�  ���ֻ�������㣬����',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(179,	'ʷ���� ���߳� 27" 7�������� �Ƴ� �๦�����Ƴ� �����',	453,	412,	 'products/1/179.jpg',	12,	'ʷ���� ���߳� 27" 7�������� �Ƴ� �๦�����Ƴ� �����',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(180,	'ʷ���� ���߳� 7����๦�� �Ƴ� �๦�����Ƴ� �����',	512,	478,	 'products/1/180.jpg',	23,	'ʷ���� ���߳� 7����๦�� �Ƴ� �๦�����Ƴ� �����',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(181,	'�ݿ� ���߳� 6���� �Ƴ� �๦�����Ƴ� �����',	321,	300,	 'products/1/181.jpg',	45,	'�ݿ� ���߳� 6���� �Ƴ� �๦�����Ƴ� �����',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(182,	'�ֶ� ���߳� 688x458x885mm 6���� �Ƴ� �๦�����Ƴ�',	267,	212,	 'products/1/182.jpg',	56,	'6���룬���黬����ƣ����������� ���濾�ᣬ��������ǿ�����β������ܽ�  ɲ��ϵͳ��ȫ�ɿ�  ���ֻ�������㣬����',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(183,	'�߳���רҵ��������',	360,	312,	 'products/1/183.jpg',	14,	'�߳���רҵ��������',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(184,	'ʷ���� ���߳� 7���� �Ƴ� �๦�����Ƴ� �����',	784,	724,	 'products/1/184.jpg',	25,	'ʷ���� ���߳� 7���� �Ƴ� �๦�����Ƴ� �����',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(185,	'�ݿ� ���߳� 7���� �Ƴ� �๦�����Ƴ� �����',	346,	322,	 'products/1/185.jpg',	36,	'�ݿ� ���߳� 7���� �Ƴ� �๦�����Ƴ� �����',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(186,	'���� ���߳��߳������ �Ƴ� �๦�����Ƴ� �����',	455,	422,	 'products/1/186.jpg',	41,	'���� ���߳� 680x458x860MM �߳������ �Ƴ� �๦�����Ƴ� �����',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(187,	'�ֶ� ������ 17" ǿ������ ������ �����',	613,	578,	 'products/1/187.jpg',	52,	'������ø�ǿ���ͳ������ �ں���壬������������Ʒ ���۲��ý�������  �����ι�����',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(188,	'���� ������ 15" ���� ������ �����',	456,	412,	 'products/1/188.jpg',	63,	'����ѡ����ǿ��PP���ϣ�����ά��֬����ǿ���ͳ�� ���ۡ����ֲ���ABS�������ϣ��ι�����',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(189,	'���� ������ 18" ���� ������ �����',	321,	277,	 'products/1/189.jpg',	7,	'����ѡ����ǿ��PP���ϣ�����ά��֬����ǿ���ͳ�� ���ۡ����ֲ���ABS�������ϣ��ι����� �ں���壬�������ɷָ������',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(190,	'��˱� ������ 16" ���� �๦��ά����𹤾ߺ�',	784,	745,	 'products/1/190.jpg',	12,	'��˱�16"���Ϲ�����',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(191,	'��˱�19"���Ϲ�����',	652,	613,	 'products/1/191.jpg',	23,	'��˱�19"���Ϲ�����',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(192,	'��˱� ������ 20" ���� ������ �����',	874,	811,	 'products/1/192.jpg',	21,	'��˱� ������ 20" ���� ������ �����',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(193,	'��˱�13.5"���Ϲ�����',	651,	623,	 'products/1/193.jpg',	45,	'��˱�13.5"���Ϲ�����',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(194,	'��˱�16"���Ϲ�����',	457,	421,	 'products/1/194.jpg',	65,	'��˱�16"���Ϲ�����',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(195,	'���׵� ������ 17" ��ǿ������ ������ �����',	632,	600,	 'products/1/195.jpg',	72,	'��ǿ����ƣ��Ӻ�ӹ���������ע�ܶ��ɣ��ں��������̣�����͸����������С�',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(196,	'�ֶ� �������� 61�� ��еά��',	456,	412,	 'products/1/196.jpg',	75,	'��Ʒ�������ʸ����֣�����Ƹ��������׹⴦��',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(197,	'�ݿ� �������� 73�� ����',	321,	301,	 'products/1/197.jpg',	76,	'�ݿ� �������� 73�� ����',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(198,	'���� �������� 58�� ��е�豸ά��',	457,	412,	 'products/1/198.jpg',	74,	'��Ʒ�ص���Ҫ�����ڹ�����ҵ�Ļ�е�豸ά�ް�װ�������¾ɹ��ұ�׼M5-M12����˨�İ�װ��ж',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(199,	'���׵� �������� 52�� ����',	651,	621,	 'products/1/199.jpg',	45,	'�⾶�ߴ磺380x260x80mm�����޾��飬�����ڹ�����ҵ���Ҿ��ճ�����ά����ҵ',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(200,	'ʷ���� �������� 58���� 10MMϵ�й���',	741,	722,	 'products/1/200.jpg',	56,	'ʷ���� �������� 58���� 10MMϵ�й���',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(201,	'����޼�52���׾�Ʒ��������',	364,	321,	 'products/1/201.jpg',	12,	'HF-81052A',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(202,	'���� �������� 33�� ����ά�ޱ���',	126,	87,	 'products/1/202.jpg',	35,	'רΪ����ά�ޱ�����Ա��ƣ��㷺Ӧ���ڵ��ݰ�װ���ճ�������ά�ޡ���������ר�ô��ܺ�, ���ڹ��ߴ�ź�Я��, ��ʵ����, �ر��ʺ����ʩ������ҵ��ԱЯ����',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(203,	'�ݿ� �������� 75�� ����',	574,	533,	 'products/1/203.jpg',	45,	'�ݿ� �������� 75�� ����',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(204,	'ʷ���� ������װ 53���� ��Ѷ',	423,	378,	 'products/1/204.jpg',	65,	'רҵ��ʿ�ر���װ, �������ճ�ά��ά�޺͹��Ͻ�� �����䱸��ȫ, ʹ�õ���Ӧ�� ͨ���Ժ�,�㷺Ӧ���ڸ�����ҵ ���ܹ��ߺм������ Ʒ������, ֵ������',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(205,	'��˱� �������� 9PC',	652,	611,	 'products/1/205.jpg',	15,	'��˱� �������� 9PC',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(206,	'����޼�150���׾�Ʒ��Ͳ����',	604,	577,	 'products/1/206.jpg',	26,	'HF-81150A',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(207,	'��˱� �������� 170PC',	570,	486,	 'products/1/207.jpg',	14,	'��˱� �������� 170PC',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(208,	'����޼�46���׾�Ʒ��Ͳ����',	268,	224,	 'products/1/208.jpg',	25,	'HF-81046A',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(209,	'���� �������� 26�� 12.5MMϵ���ۺ�',	126,	97,	 'products/1/209.jpg',	36,	'���ʸ����ֶ��죬������ƣ�������ĥ����������ܺ�',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(210,	'�ֶ� �������� 120�� �ۺ���',	368,	320,	 'products/1/210.jpg',	78,	'��Ʒ�������ʸ����֣�����Ƹ��������׹⴦��',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(211,	'���� ��Ͳ���� 86�� 6.3x12.5MMϵ��',	247,	211,	 'products/1/211.jpg',	65,	'���ʸ����ֶ��죬������ƣ�������ĥ����������ܺ�',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(212,	'���� �������� 35�� 6.3x10MMϵ���ۺϻ���',	326,	288,	 'products/1/212.jpg',	45,	'35��6.3x10MMϵ���ۺϻ��ι�������',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(213,	'ʷ���� �������� 58���� ͨ��',	246,	223,	 'products/1/213.jpg',	32,	'ʷ����58����ͨ�ù�������',	0,	'2016-06-20 12:12:12',	22,2,0,1);

































