#创建数据库
create database company;
use company;

#后台管理员表
create table adminuser(
uid int primary key auto_increment,
username varchar(255),
password varchar(255));

#反馈信息表
create table returnmessage(
id int primary key auto_increment,  #主键
content varchar(255),               #内容
returndate Date,                   #反馈时间
contact varchar(100)                #联系方式
);

#便民信息表
create table convenience(
id int primary key auto_increment,
title varchar(255),      #标题
content varchar(255)     #内容
);

#举报表
create table report(
id int primary key auto_increment,
type varchar(255),      #举报类型
content varchar(255),   #举报内容
reportname varchar(255),#举报人
productid varchar(255), #举报商品id
isdeal varchar(255),    #是否处理的标识(0未处理，1处理）
reportdate date);       #举报时间

#一级目录表
create table category(
cid int primary key auto_increment,
cname varchar(255));


#二级目录
create table categorysecond(
csid int primary key auto_increment,
csname varchar(255),
cid int,
foreign key(cid) references category(cid));

#商品表
create table product(
pid int primary key auto_increment,
pname varchar(255),      #商品名称
market_price double,     #市场价格
shop_price double,       #清云商城价格
image varchar(255),      #图片路劲
num int,                 #库存数量 
pdesc varchar(255),      #商品描述
is_hot int,              #是否热门
pdate datetime,          #上传日期
csid int,                #所属二级分类Id   
uid int,                 #发布商品的用户id
is_top int,              #是否置顶
shelves int,             #下架：0,上架：1，审核不通过：2
foreign key(uid) references user(uid),   
foreign key(csid) references categorysecond(csid));

#评论表   
create table comments(
id int primary key auto_increment,
content text,    #回复内容 
cdate varchar(255),       #回复日期
productid int,            #商品id 
userid int,               #用户id    
foreign key(productid) references product (pid),
foreign key(userid) references user(uid));

#订单项表
create table orderitem(
itemid int primary key auto_increment,
count int,         #数量
subtotal double,   #总价
pid int,           #商品Id
oid int,           #所属订单id
uid int,           #用户Id
foreign key(pid) references product(pid),
foreign key(oid) references orders(oid),
foreign key(uid) references user(uid));

#订单表  
create table orders(
oid int primary key auto_increment,  
total double,        #总价
ordertime datetime,  #订单时间
state int,           #订单状态1：未付款，2：未发货 3：未签收 4：交易结束
name varchar(21),    #购买用户名称
addr varchar(60),    #用户地址
phone varchar(20),   #用户电话
ordernumber varchar(255),#订单编号
uid int,             #用户id    
flag int,            #标志
bz varchar(255),     #备注
foreign key(uid) references user(uid));

#购物项表
create table cartitem(
id int primary key auto_increment,  #主键
pid int,                            #属于的商品id
subtotal double,                    #小计
number int,                         #数量
cartid int,                         #所属的购物车
foreign key(cartid) references cart(id),
foreign key(pid) references product(pid));

#购物车
create table cart(
id int primary key auto_increment,  #主键
uid int,                            #用户id
total double,                       #总计   
foreign key(uid) references user(uid));      


#用户表
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

#插入到一级目录(category)的数据
insert into category (cid,cname) values(1,'电动工具');
insert into category (cid,cname) values(2,'气动工具');
insert into category (cid,cname) values(3,'手动工具');
insert into category (cid,cname) values(4,'照明工具');
insert into category (cid,cname) values(5,'电工电子');
insert into category (cid,cname) values(6,'工具包');
insert into category (cid,cname) values(7,'工具组套');

#插入数据到用户表（user)
insert into user(uid,username,password,name,email,phone,addr,state,code) values(1,'zhangfei','123','张飞','zhangfei@163.com','12345678','三国蜀地211号',1,'45614587945891@059406');
insert into user(uid,username,password,name,email,phone,addr,state,code) values(2,'guanyu','123','关羽','guanyu@163.com','87654321','三国荆州113号',1,'45634655454945891@059406');

#插入后台管理员（adminuser)数据
insert into adminuser(uid,username,password) values(1,'admin','admin');

#插入到便民信息表（convenience）
insert into convenience(id,title,content) values(1,'这是便民信息','这是便民信息内容呀！');

#添加二级目录（categorysecond)
insert into categorysecond(csid,csname,cid) values(1,'冲击钻',1);
insert into categorysecond(csid,csname,cid) values(2,'充电钻',1);
insert into categorysecond(csid,csname,cid) values(3,'电动扳手',1);
insert into categorysecond(csid,csname,cid) values(4,'电刨',1);
insert into categorysecond(csid,csname,cid) values(5,'手电钻',1);
insert into categorysecond(csid,csname,cid) values(6,'吸尘枪',2);
insert into categorysecond(csid,csname,cid) values(7,'钉枪',2);
insert into categorysecond(csid,csname,cid) values(8,'风动套筒',2);
insert into categorysecond(csid,csname,cid) values(9,'气动扳手',2);
insert into categorysecond(csid,csname,cid) values(10,'气动磨砂机',2);
insert into categorysecond(csid,csname,cid) values(11,'钢丝钳',3);
insert into categorysecond(csid,csname,cid) values(12,'活动扳手',3);
insert into categorysecond(csid,csname,cid) values(13,'螺丝批组套',3);
insert into categorysecond(csid,csname,cid) values(14,'美工刀',3);
insert into categorysecond(csid,csname,cid) values(15,'电筒',4);
insert into categorysecond(csid,csname,cid) values(16,'工作灯',4);
insert into categorysecond(csid,csname,cid) values(17,'电烙铁',5);
insert into categorysecond(csid,csname,cid) values(18,'万用表',5);
insert into categorysecond(csid,csname,cid) values(19,'工具车',6);
insert into categorysecond(csid,csname,cid) values(20,'工具箱',6);
insert into categorysecond(csid,csname,cid) values(21,'机修工具组套',7);
insert into categorysecond(csid,csname,cid) values(22,'综合工具组套',7);


	#插入商品（product)信息数据'
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves) values(1,'博世TSB1300冲击钻冲击钻电钻',300,230,'products/1/1.jpg',23,'全滚珠轴承，保证机器长寿命 紧凑机身设计，狭小空间运用自如 强大功率，适合高强度作业',1,'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(2,	'博世 GSB600RE 冲击钻 冲击钻 电钻',	450,	364,	 'products/1/2.jpg',	31,	'高刚性及精准烧结轴承座，令钻孔更准确 带深度尺的辅助手柄 正反转切换，适用于拧紧和卸下螺丝 冲击档和平钻档之间轻松转换 原装夹头匙。钻头装卸轻松搞定 手动工具、附件完备',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(3,	'万克宝 冲击钻 13mm 多功能，两用（纸盒版） 冲击钻 电钻',	470,	415,	 'products/1/3.jpg',	17,	'万克宝 13mm多功能两用电钻冲击钻（纸盒版）',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(4,	'东成 Z1J-FF04-13 冲击电钻 套装 冲击钻 电钻',	257,	215,	 'products/1/4.jpg',	20,	'东成冲击电钻套装Z1J-FF04-13',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(5,'博世 GSB 10.8-2-LI 冲击钻 充电式 冲击钻 电钻',520,465,	'products/1/5.jpg',22,'博世 GSB 10.8-2-LI',1,'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(6,'日立 冲击钻 13mm 调速 冲击钻 电钻',	420,	377,	 'products/1/6.jpg',	11,	'日立专利棘轮结构；加强型马达',	0,	'2016-06-20 12:12:12',1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(7,	'博世 GSB 16 冲击钻 新款 冲击钻 电钻',	355,	278,	 'products/1/7.jpg',	33,	'博世 GSB 16',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(8,	'得伟 冲击钻 18V 镍镉 充电式 冲击钻 电钻',	650,	533,	 'products/1/8.jpg',	13,	'强劲 18v 设计提供专业冲击钻，以及起子应用 超级紧凑机身设计，轻巧舒适,  17位可调扭矩控制，适用于各种材质及螺丝尺寸 两档转速调节，适合高扭矩与高速应用 正反转电子',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(9,	'博世 GSB 14.4VE-2-Li 冲击钻 充电式 新款 冲击钻 电钻',	439,	323,	 'products/1/9.jpg',	40,	'博世 GSB 14.4VE-2-Li',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(10,	'万克宝 冲击钻 13mm 多功能，两用（塑盒版） 冲击钻 电钻',	567,	512,	 'products/1/10.jpg',	26,	'万克宝 13mm多功能两用电钻冲击钻（塑盒版）',	0,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(11,	'博世 GSB 18VE-2-Li 冲击钻 充电式 新款 冲击钻 电钻',	339,	301,	 'products/1/11.jpg',	34,	'博世 GSB 18VE-2-Li',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(12,	'灿鸿工具 500W冲击俩用电钻',	720,	610,	 'products/1/12.jpg',	71,	'灿鸿工具 500W冲击俩用电钻',	1,	'2016-06-20 12:12:12',	1,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(13,	'博世 IXO3 起子机 锂电 充电式 充电钻 电动螺丝刀 电起子',	620,	510,	 'products/1/13.jpg',	32,	'座式快速充电器、多功能批头装套、顶部正反转/剩余电量显示 铁盒包装、使用美观 LED灯，即使在黑暗处仍可正常作业，正反钻按钮',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(14,	'万克宝 电动起子 3.6V 经济款 充电钻 电动螺丝刀 电起子',	510,	478,	 'products/1/14.jpg',	40,	'1、扭力强劲，轻便快捷； 2、头部带高亮度LED工作灯； 3、配24PCS批头，3pcs麻花钻头，满足日常所需',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(15,	'东成 DCJZ09-10 起子电钻 A型 充电式 充电钻 电动螺丝刀',	385,325,	 'products/1/15.jpg',	50,	'东成充电式起子电钻DCJZ09-10(A型)',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(16,	'日立 起子电钻 12V 镍镉 充电钻 电动螺丝刀 电起子',	197,	150,	 'products/1/16.jpg',	67,	'风冷马达、两档齿轮变速 电子调速，正反转功能',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(17,	'博世 GSR Li-Lon 充电钻 3.6V 起子机 充电钻 电动螺丝刀',	657,	613,	 'products/1/17.jpg',	21,	'博世充电钻/起子机 GSR 3.6V Li-Lon',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(18,	'博世 GSR Li-Lon 充电钻 3.6V 起子机 充电钻 电动螺丝刀',	369,	312,	 'products/1/18.jpg',	16,	'博世充电钻/起子机 GSR 3.6V Li-Lon',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(19,	'博世 TSR 1080-2-Li 充电钻 QR 单电版 充电钻 电动螺丝刀',	713,	657,	 'products/1/19.jpg',	34,	'博世充电钻/起子机（QR） TSR 1080-2-Li单电版',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(20,	'东成 DCJZ10-10 起子电钻 B型 充电式 充电钻 电动螺丝刀',	514,	456,	 'products/1/20.jpg',	22,	'东成充电式起子电钻DCJZ10-10(B型）',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(21,	'宝工 充电起子 3.6V1000mAH AC 230~240V 电动起子',	327,	286,	 'products/1/21.jpg',	45,	'宝工 充电起子',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(22,	'锐奇 BN6112 电钻 充电式 充电钻 电动螺丝刀 电起子',	435,	398,	 'products/1/22.jpg',	55,	'锐奇 BN6112',	1,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(23,	'博世 GSR BitDrive 充电钻 3.6V 起子机 充电钻 电动螺丝刀',	536,	488,	 'products/1/23.jpg',	67,	'博世充电钻/起子机3.6V GSR BitDrive',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(24,	'日立 起子电钻 7.2V 镍镉 充电钻 电动螺丝刀 电起子',	612,	573,	 'products/1/24.jpg',	17,	'容易握紧的手柄 便利的固定挂钩 方便的电子制动器',	0,	'2016-06-20 12:12:12',	2,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(25,	'日立 冲击扳手 18V 锂电 充电式 电动扳手 电扳手',	751,	711,	 'products/1/25.jpg',	32,	'255N·m强力扭矩输出 双模式控制 高效风冷马达',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(26,	'东成 DCPB16 冲击扳手 E型 充电式 电动扳手 电扳手',	367,	313,	 'products/1/26.jpg',	27,	'东成充电式冲击扳手DCPB16(E型）',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(27,	'博世 GDS 18V EC 250 冲击扳手 充电式 裸机 电动扳手',	456,	413,	 'products/1/27.jpg',	13,	'博世 GDS 18V EC 250',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(28,	'博世 GDS18V-EC250 电动扳手 充电式 电动扳手 电扳手',	678,	610,	 'products/1/28.jpg',	10,	'250牛米扭矩，适用于重型应用 博世灵活动力系统，可搭载所有博世18v级别电池 博世电池过充过载保护系统，确保电池更长寿、更高效 LED设计，提供明亮的工作环境',	1,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(29,	'博世 GDR 10.8-LI 起子机 2.0AH 充电式 冲击 电动扳手',	326,	298,	 'products/1/29.jpg',	65,	'博世 GDR 10.8-LI 起子机',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(30,	'威克士 冲击扳手 12V 充电式 锂电 电动扳手 电扳手',	755,	680,	 'products/1/30.jpg',	45,	'威克士 冲击扳手',	0,	'2016-06-20 12:12:12',	3,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(31,	'日立 电刨 580W 电刨 木工刨 电刨子',	712,	650,	 'products/1/31.jpg',	12,	'简洁紧凑、轻型； 高旋转速度； 高精度底座保证刨面效果',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(32,	'日立 电刨 620W 电刨 木工刨 电刨子',	650,	612,	 'products/1/32.jpg',	34,	'2.6mm刨削深度；铝制端盖结构坚固，底座保护支撑；高精度底座保证刨面效果',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(33,	'东成 M1B-FF-82*1 电刨 电刨 木工刨 电刨子',	123,	97,	 'products/1/33.jpg',	45,	'东成 M1B-FF-82*1',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(34,	'东成 M1B-FF02-82*1 电刨 电刨 木工刨 电刨子',	345,	312,	 'products/1/34.jpg',	22,	'东成电刨M1B-FF02-82*1',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(35,	'博世 GHO 10-82 电刨 电刨 木工刨 电刨子',	486,	412,	 'products/1/35.jpg',	30,	'博世 GHO 10-82	',1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(36,	'牧田 电刨 110mm(4-3/8") 电刨 木工刨 电刨子',	322,	245,	 'products/1/36.jpg',	70,	'110毫米宽的刨刀，单次刨削最大刨深2毫米',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(37,	'锐奇 1982 电刨 电刨 木工刨 电刨子',	674,	633,	 'products/1/37.jpg',	56,	'锐奇 1982',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(38,	'牧田 电刨 82mm(3-1/4") 电刨 木工刨 电刨子',	725,	612,	 'products/1/38.jpg',	43,	'把手的角度和形状便于握持、推动及携带',	0,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(39,	'牧田 电刨 82mm(3-1/4") 电刨 木工刨 电刨子',	543,	455,	 'products/1/39.jpg',	26,	'500瓦强力马达，输出功率更高，刨削效果更好！',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(40,	'日立 电刨 470W 电刨 木工刨 电刨子',	236,	188,	 'products/1/40.jpg',	65,	'简洁紧凑、轻型； 高旋转速度',	1,	'2016-06-20 12:12:12',	4,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(41,	'博世 TBM3400 手电钻 电钻 手电钻',	345,	287,	 'products/1/41.jpg',	32,	'功率更强，转速更快；滚珠轴承更耐用，同心度更高；带正反转，调速功能，适合多种作业',	1,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(42,	'日立 手电钻 6mm 高速 电钻 手电钻',	459,	411,	 'products/1/42.jpg',	12,	'轻量，平衡性结构 双重绝缘，带挂钩，树脂机壳 高转速4500/min(空载)',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(43,	'得伟 电钻 10mm 380W 调速 电钻 手电钻',	309,	243,	 'products/1/43.jpg',	20,	'百叶窗通风口设计，有效防尘  独有转子支撑轴，极 大提高 耐久性  超级紧凑且平衡性良好，便于使用',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(44,	'得伟 电钻 10mm 550W 调速 电钻 手电钻',	850,	720,	 'products/1/44.jpg',	67,	'百叶窗通风口设计，有效防尘  独有转子支撑轴，极 大提高 耐久性  超级紧凑且平衡性良好，便于使用',	1,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(45,	'博世 GBM13RE 手电钻 电钻 手电钻',	643,	580,	 'products/1/45.jpg',	45,	'高刚性及精准烧结轴承座。令钻孔更准确；操作方便的实用型腰带扣；人机工程学设计软握把，有效抗疲劳；原装夹头匙，钻头装卸轻松搞定',	0,	'2016-06-20 12:12:12',	5,1,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(46,	'日立 手电钻 10mm 单速 电钻 手电钻',	450,	405,	 'products/1/46.jpg',	32,	'可调速和正反转功能 低噪音设计 标准附件：夹头钥匙',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(47,	'东成 J1Z-FF-10A 手电钻 电钻 手电钻',	309,	276,	 'products/1/47.jpg',	76,	'东成手电钻J1Z-FF-10A',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(48,	'日立 手电钻 10mm 大功率 电钻 手电钻',	706,	643,	 'products/1/48.jpg',	48,	'紧凑型机身 电子调速，正反转功能 标准附件：夹头扳手',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(49,	'东成 J1Z-FF02-13 手电钻 电钻 手电钻',	803,	715,	 'products/1/49.jpg',	32,	'东成手电钻J1Z-FF02-13',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(50,	'牧田 电钻 10mm(3/8")450W 无钥匙夹头 电钻 手电钻',	435,	380,	 'products/1/50.jpg',	10,	'机身小巧，动力强劲 电子调速，正反转功能 标准附件：夹头钥匙 人体工程学设计防滑手柄',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(51,	'得伟 电钻 13mm 701W 调速 电钻 手电钻',	687,	612,	 'products/1/51.jpg',	20,	'百叶窗通风口设计，有效防尘  独有转子支撑轴，极 大提高 耐久性  超级紧凑且平衡性良好，便于使用 橡胶全包裹手柄，减震舒适',	1,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(52,	'锐奇 6410ER 电钻 电钻 手电钻',	268,	210,	 'products/1/52.jpg',	67,	'锐奇 6410ER',	0,	'2016-06-20 12:12:12',	5,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(53,	'史丹利塑胶风枪4',	735,	656,	 'products/1/53.jpg',	23,	'史丹利塑胶风枪4',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(54,	'钢盾4"塑胶风枪',	456,	402,	 'products/1/54.jpg',	34,	'风枪喷嘴长100mm，手柄舒适  易于精确控制风力和风向  适用于各种机械和仪器的除尘  工作气压：0-8公斤  6mm 进气接头',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(55,	'世达吹尘枪250MM',	567,	510,	 'products/1/55.jpg',	45,	'世达吹尘枪250MM',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(56,	'钢盾10"塑胶风枪',	684,	620,	 'products/1/56.jpg',	36,	'风枪喷嘴长250mm，手柄舒适  易于精确控制风力和风向  适用于各种机械和仪器的除尘 工作气压：0-8公斤 6mm 进气接头',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(57,	'世达吹尘枪100MM',	324,	280,	 'products/1/57.jpg',	12,	'世达吹尘枪100MM',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(58,	'捷科250MM吹尘枪',	270,	233,	 'products/1/58.jpg',	75,	'捷科250MM吹尘枪',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(59,	'捷科100MM吹尘枪',	643,	610,	'products/1/59.jpg',	64,	'捷科100MM吹尘枪',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(60,	'岩田喷漆枪NEW71-3S(配PC-2)',	720,	667,	 'products/1/60.jpg',	51,	'岩田喷漆枪NEW71-3S(配PC-2)',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(61,	'岩田喷漆枪W101-152G（配PC-4S）',	530,	484,	 'products/1/61.jpg',	34,	'岩田喷漆枪W101-152G（配PC-4S）',	1,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(62,	'岩田喷漆枪NEW77-2S(配PC-1)',	426,	374,	 'products/1/62.jpg',	24,	'岩田喷漆枪NEW77-2S(配PC-1)',	0,	'2016-06-20 12:12:12',	6,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(63,	'东成直钉枪FF-F30',	560,	511,	 'products/1/63.jpg',	32,	'东成直钉枪FF-F30',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(64,	'美特F32直钉枪',	364,	302,	 'products/1/64.jpg',	40,	'美特F32直钉枪',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(65,	'美特T50SA直钉枪',	674,	623,	 'products/1/65.jpg',	12,	'美特T50SA直钉枪',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(66,	'弘愿直钉枪（压铸壳体）',	450,	412,	 'products/1/66.jpg',	76,	'弘愿直钉枪（压铸壳体）',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(67,	'美川直钉枪T50A',	870,	813,	 'products/1/67.jpg',	80,	'美川直钉枪T50A',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(68,	'弘愿直钉枪（压铸壳体）',	557,	503,	 'products/1/68.jpg',	56,	'弘愿直钉枪（压铸壳体）',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(69,	'美特卷钉枪CN55',305,	228,	 'products/1/69.jpg',	50,	'美特卷钉枪CN55',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(70,	'世达气动卷钉枪45-70MM',	354,	311,	 'products/1/70.jpg',	36,	'世达气动卷钉枪45-70MM',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(71,	'美特卷钉枪CN70B',	459,	413,	'products/1/71.jpg',	22,	'美特卷钉枪CN70B',	1,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(72,	'弘愿卷钉枪（压铸壳体）',	732,	678,	 'products/1/72.jpg',	39,	'弘愿卷钉枪（压铸壳体）',	0,	'2016-06-20 12:12:12',	7,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(73,	'世达3/8"系列六角风动套筒19MM',	654,	612,	 'products/1/73.jpg',	37,	'世达3/8"系列六角风动套筒19MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(74,	'世达3/8"系列六角风动长套筒17MM',	546,	531,	 'products/1/74.jpg',	38,	'世达3/8"系列六角风动长套筒17MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(75,	'世达3/8"系列六角风动长套筒19MM',	846,	813,	 'products/1/75.jpg',	12,	'世达3/8"系列六角风动长套筒19MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(76,	'世达3/8"系列六角风动长套筒7MM',	312,	276,	 'products/1/76.jpg',	13,	'世达3/8"系列六角风动长套筒7MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(77,	'世达3/8"系列六角风动套筒12MM',	516,	470,	 'products/1/77.jpg',	45,	'世达3/8"系列六角风动套筒12MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(78,	'世达3/8"系列六角风动长套筒12MM',	653,	611,	 'products/1/78.jpg',	56,	'世达3/8"系列六角风动长套筒12MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(79,	'世达3/8"系列六角风动套筒10MM',	753,	714,	 'products/1/79.jpg',	12,	'世达3/8"系列六角风动套筒10MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(80,	'世达3/8"系列六角风动套筒9MM',	855,	813,	 'products/1/80.jpg',	23,	'世达3/8"系列六角风动套筒9MM',	1,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(81,	'世达3/8"系列六角风动套筒13MM',	264,	213,	 'products/1/81.jpg',	45,	'世达3/8"系列六角风动套筒13MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(82,	'世达3/8"系列六角风动套筒8MM',	139,	97,	 'products/1/82.jpg',	56,	'世达3/8"系列六角风动套筒8MM',	0,	'2016-06-20 12:12:12',	8,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(83,	'捷科1/2"气动冲击扳手',	357,	305,	 'products/1/83.jpg',	78,	'捷科1/2"气动冲击扳手',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(84,	'英格索兰1"气动冲击扳手',	399,	366,	 'products/1/84.jpg',	87,	'英格索兰1"气动冲击扳手',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(85,	'钢盾1/2"工业级复合材料气动扳手',	544,	505,	 'products/1/85.jpg',	54,	' 双锤打击结构，扭力强劲，动力输出快速  复合材料外壳设计，机身轻巧，操作省力，降低工作强度  握把排气设置，配备消音装置，减小工作噪音  三向进气钢制气缸',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(86,	'世达1/2"强力气动冲击扳手',	805,	764,	 'products/1/86.jpg',	65,	'世达1/2"强力气动冲击扳手',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(87,	'英格索兰1/2”气动冲击扳手',	538,	489,	 'products/1/87.jpg',	21,	'英格索兰1/2”气动冲击扳手',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(88,	'世达1/2"大扭力气动冲击扳手',	647,	612,	 'products/1/88.jpg',	32,	'世达1/2"大扭力气动冲击扳手',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(89,	'钢盾3/4"工业级复合材料气动扳手',	123,	78,	 'products/1/89.jpg',	3,	 '双锤打击结构，扭力强劲，动力输出快速  复合材料外壳设计，机身轻巧，操作省力，降低工作强度  握把排气设置，配备消音装置，减小工作噪音',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(90,	'世达1/2"复合材料气动冲击扳手',	452,	412,	 'products/1/90.jpg',	14,	'世达1/2"复合材料气动冲击扳手',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(91,	'世达1/2"专业级强力气动冲击扳手',	369,	322,	 'products/1/91.jpg',	25,	'世达1/2"专业级强力气动冲击扳手',	0,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(92,	'捷科1/2"复合材料气动冲击扳手',	751,	714,	 'products/1/92.jpg',	36,	'捷科1/2"复合材料气动冲击扳手',	1,	'2016-06-20 12:12:12',	9,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(93,	'世达气动笔式研磨机',	658,	612,	 'products/1/93.jpg',	74,	'世达气动笔式研磨机',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(94,	'世达5"中央吸尘式气动打磨机',	357,	312,	 'products/1/94.jpg',	85,	'世达5"中央吸尘式气动打磨机',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(95,	'世达5"气动打磨机',	664,	612,	 'products/1/95.jpg',	14,	'世达5"气动打磨机',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(96,	'英格索兰气动磨光机',	227,	208,	 'products/1/96.jpg',	34,	'英格索兰气动磨光机',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(97,	'世达气动低速轮胎打磨机',	643,	612,	 'products/1/97.jpg',	24,	'世达气动低速轮胎打磨机',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(98,	'世达迷你气动打磨机组套',	276,	237,	 'products/1/98.jpg',	26,	'世达迷你气动打磨机组套',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(99,	'世达迷你气动粗磨机组套',	357,	312,	 'products/1/99.jpg',	13,	'世达迷你气动粗磨机组套',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(100,	'捷科6"气动研磨机',	456,	377,	'products/1/100.jpg',	46,	'捷科6"气动研磨机',	1,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(101,	'捷科5"气动打磨机',	577,	523,	'products/1/101.jpg',	79,	'捷科5"气动打磨机',	0,	'2016-06-20 12:12:12',	10,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(102,	'世达钢丝钳7',	746,	711,	 'products/1/102.jpg',	87,	'钳体采用55CRNI锻造而成，刃口经特殊高频淬火处理，人体工程学TPR手柄，舒适耐用',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(103,	'钢盾专利型重型省力偏心钢丝钳6',	546,	506,	 'products/1/103.jpg',	54,	'采用优质CR-NI材质整体锻造，坚实耐用 偏心轴设计，刃口特殊高频热处理，剪切更加省力 独特设计双色PP+TPR手柄，握持舒适',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(104,	'万克宝FS手柄钢丝钳8',	608,	539,	 'products/1/104.jpg',	21,	'1、Cr-V材质，热处理，表面电镀 2：双色手柄，握持舒适。',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(105,	'钢盾双色柄钢丝钳7',	456,	416,	 'products/1/105.jpg',	31,	'钳体采用铬钒钢锻造，坚固耐用 刃口经特殊处理，剪切能力强 TPR+PP双材料套柄，握持舒适 符合美国ANSI标准',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(106,	'钢盾双色柄钢丝钳8',	349,	310,	'products/1/106.jpg',	64,	 '钳体采用铬钒钢锻造，坚固耐用  刃口经特殊处理，剪切能力强  TPR+PP双材料套柄，握持舒适  符合美国ANSI标准',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(107,	'奥新工具多功能强力钢丝钳碳钢电工断线钳省力老虎钳子',	489,	425,	 'products/1/107.jpg',	75,	'特有偏离轴设计 省力可达35%以上。尾部附有压线口设计 使用更方便功能更全面。粗壮手柄设计 剪切时感觉更舒适。',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(108,	'新工钢丝钳 TD3001A 6',	746,	701,	 'products/1/108.jpg',	45,	'钢丝钳',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(109,	'波斯工具 钢丝钳',	344,	302,	 'products/1/109.jpg',	12,	'新钳王',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(110,	'华丰巨箭省力钢丝钳',	612,	570,	 'products/1/110.jpg',	32,	'HF-8101107',	1,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(111,	'钢盾双色柄钢丝钳6',	544,	503,	 'products/1/111.jpg',	65,	 '钳体采用铬钒钢锻造，坚固耐用  刃口经特殊处理，剪切能力强  TPR+PP双材料套柄，握持舒适  符合美国ANSI标准',	0,	'2016-06-20 12:12:12',	11,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(112,	'世达沾塑欧式活动扳手8 多功能活口板子 活络扳手',	460,	412,	 'products/1/112.jpg',	45,	'优质碳钢 表面镀珍珠镍，耐腐蚀、更美观 全手柄沾塑，握持更牢靠 激光刻度指示，开口尺寸更直观 数控机床加工，操作更顺畅 头部特殊热处理，强度更高，更耐磨，使用寿命持久',	0,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(113,	'捷科普通型活扳手AW-6',	368,	312,	 'products/1/113.jpg',	12,	'升级换代，口径加宽，适用范围更广 采用碳钢锻造，耐磨，防锈',	1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(114,	'世达活动扳手 4	',654,	603,	 'products/1/114.jpg',	32,	'采用铬钒钢材料制作，耐磨，防锈	',1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(115,	'特大型活络扳手TD3024',	531,	470,	 'products/1/115.jpg',	21,	'特大型活络扳手，整体锻压，船舶专用',	0,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(116,	'史丹利活动扳手15',	566,	521,	 'products/1/116.jpg',	65,	'整体优质碳钢锻造。 钳口经过淬硬、回火处理，夹持强劲。 精密螺母，开合自如。 通身雾化处理，全面防锈。 口径上镭射刻度，便于操作。',	1,	'2016-06-20 12:12:12',	12,1,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(117,	'万克宝FS手柄大开口活扳手8',	610,	560,	 'products/1/117.jpg',	87,	'高碳钢锻造，热处理，硬度高，刻度清晰，转动灵活，把持舒适',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(118,	'世达活动扳手 6',	627,	576,	 'products/1/118.jpg',	45,	'采用铬钒钢材料制作，耐磨，防锈',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(119,	'史丹利沾塑柄活络扳手10',	513,	456,	 'products/1/119.jpg',	56,	'Cr-v高级合金钢锻造而成，整体淬火硬度高夹持强劲。 双色沾塑手柄握持舒适，钳口上镭射刻度，便于操作。',	0,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(120,	'史丹利沾塑柄活络扳手12',	567,	506,	 'products/1/120.jpg',	12,	'Cr-v高级合金钢锻造而成，整体淬火硬度高夹持强劲。 双色沾塑手柄握持舒适，钳口上镭射刻度，便于操作。',	0,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(121,	'世达沾塑欧式活动扳手6',	357,	301,	 'products/1/121.jpg',	32,	'优质碳钢 表面镀珍珠镍，耐腐蚀、更美观 全手柄沾塑，握持更牢靠 激光刻度指示，开口尺寸更直观 数控机床加工，操作更顺畅 头部特殊热处理，强度更高，更耐磨，使用寿命持久',	1,	'2016-06-20 12:12:12',	12,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(122,	'万克宝6件套螺丝刀超值套装 十字一字梅花起子 螺丝批改锥',	450,	403,	 'products/1/122.jpg',	45,	'1：碳钢刀杆，头部高温热处理，硬度高，不打滑 2：头部带磁性。',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(123,	'万克宝18PC红蓝双色螺丝批组套',	540,	483,	 'products/1/123.jpg',	41,	'万克宝18PC',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(124,	'力易得6件迷你螺丝批',	620,	573,	 'products/1/124.jpg',	32,	'Cr-Mo合金钢刀杆，扭力、硬度佳。',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(125,	'钢盾6件套超值装螺丝批',	347,	304,	 'products/1/125.jpg',	30,	 '刀杆采用Cr-V-Mo优质钢材，表面镀铬处理  批头发黑处理，带强磁  手柄符合人体工程学设计，握持舒适',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(126,	'史丹利2件套胶柄螺丝批',	267,	202,	 'products/1/126.jpg',	20,	'史丹利2件套胶柄螺丝批',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(127,	'钢盾27件棘轮螺丝批紧固套装',	189,	132,	 'products/1/127.jpg',	27,	 '刀头采用S2优质钢材，经久耐用  刀杆表面镀铬，抗锈性好  重型铝合金螺丝批手柄表面电镀，镶嵌橡胶，握持舒适  棘轮头可以转向，以0度，45度，90度角操作',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(128,	'万克宝38PC红蓝双色棘轮螺丝批',	543,	501,	 'products/1/128.jpg',	67,	'万克宝38PC',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(129,	'世达8件A系列一字、十字螺丝批组套',	305,	257,	 'products/1/129.jpg',	50,	'进口SVCM+材料刀杆，整体热处理，扭力有效提高20%；高强度尼龙材料套管，使用寿命更长久；人体工学推把设计，使用更方便；工程醋酸材料手柄，抗冲击能更强，耐油性能',	1,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(130,	'史丹利8件套超值装螺丝批',	645,	603,	 'products/1/130.jpg',	58,	'磁性螺丝刀头，发黑处理。 优质铬钒钢材料，防锈耐腐蚀。 根据人体工程学设计的双材料手柄，表面有凸起花纹，手感舒适，有效防止打滑。 特殊的三角形断面设计，扭力增大30%',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(131,	'世达8件护套型冲击螺丝批组套',	612,	570,	 'products/1/131.jpg',	64,	'世达8件护套型',	0,	'2016-06-20 12:12:12',	13,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(132,	'万克宝双色包塑美工刀9mm',	456,	412,	 'products/1/132.jpg',	45,	'1：优质铝合金材质手柄。2：钢管壁厚达1.2mm，坚固耐用。',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(133,	'华丰巨箭美工刀',	546,	502,	'products/1/133.jpg',	65,	'HF-8210118',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(134,	'奥新工具铝柄单发美工刀',705,	633,	 'products/1/134.jpg',	12,	'用于切割板材纸张 刀柄采用铝套制造 轻质耐用 刀身并有TPR防滑条 使用更安全。',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(135,	'世达橡塑柄推钮美工刀8节18x100MM',	645,	601,	 'products/1/135.jpg',	32,	'世达橡塑柄推钮美工刀8节18x100MM',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(136,	'钢盾18mm高级快换刀片型美工刀(含2片备用刀片)',	577,	512,	 'products/1/136.jpg',	78,	'刀片采用SK5优质材料，锋利耐用  不锈钢护鞘，坚固安全  刀壳采用工程塑料ABS注塑而成，结实耐用  刀片自动锁定，操作更安全  手柄符合人体工程学设计，握持舒适',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(137,	'田岛美工刀701',	712,	645,	'products/1/137.jpg',	42,	'田岛美工刀701',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(138,	'灿鸿工具美工刀',	530,	480,	'products/1/138.jpg',	53,	'灿鸿工具美工刀',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(139,	'史丹利旋钮双色柄美工刀18mm (3刀片)',	730,	675,	 'products/1/139.jpg',	14,	'史丹利旋钮双色柄美工刀18mm (3刀片)',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(140,	'史丹利自锁双色柄美工刀18mm (3刀片)',	467,	423,	 'products/1/140.jpg',	25,	'史丹利自锁双色柄美工刀18mm (3刀片)',	1,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(141,	'捷科A型系列小型美工刀CF-33',	367,	312,	 'products/1/141.jpg',	36,	'刀片采用SK2+CR材料，锋利，耐用 含碳量高达1.2，维氏硬度高达840° 刀片的刀刃采用两段磨法，更耐用，锋利。使用寿命比普通碳钢刀片高达10倍以上 刀身采用ABS住宿而成',	0,	'2016-06-20 12:12:12',	14,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(142,	'纳丽德 AAA K00 手电筒 强光 远射 战术防水防身 户外照明',	452,	403,	 'products/1/142.jpg',	34,	'纳丽德AAA手电筒K00',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(143,	'纳丽德 AAA K00 手电筒 ',	572,	523,	 'products/1/143.jpg',	21,	'纳丽德 AAA K00 手电筒 ',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(144,	'钢盾 手电筒 1节 5号电池 1LED 高强度铝合金 强光 远射',	632,	557,	 'products/1/144.jpg',	44,	 '重型铝合金外壳，结实牢固  采用国产LED灯珠  采用防雨淋防震设计',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(145,	'钢盾 手电筒 3W 2节1号电池 变形金刚超亮LED 强光 远射',	726,	664,	 'products/1/145.jpg',	12,	'外壳采用铝合金包塑特别设计，结实耐用  进口超亮CREE LED灯珠，使用寿命100000小时以上  特有防雨淋防震设计',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(146,	'史丹利 手电筒 2xAA 高强度铝合金LED 强光 远射',	462,	402,	 'products/1/146.jpg',	67,	'史丹利 手电筒 2xAA 高强度铝合金LED 强光 远射 战术防水防身 户外照明',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(147,	'纳丽德 AAA K1 手电筒 强光 远射 战术防水防身 户外照明',	345,	301,	 'products/1/147.jpg',	23,	'纳丽德 AAA K1 手电筒 强光 远射 战术防水防身 户外照明',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(148,	'夜鹰 3AAA3W 电筒 13款 黑色铝合金加长版 强光手电筒',	496,	434,	 'products/1/148.jpg',	77,	'夜鹰 3AAA3W 电筒 13款 黑色铝合金加长版 强光手电筒 远射王',	1,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(149,	'世达 手电筒 笔形 强光 远射 战术防水防身 户外照明',	321,	278,	 'products/1/149.jpg',	9,	'世达 手电筒 笔形 强光 远射 战术防水防身 户外照明',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(150,	'纳丽德 P2 AAA 手电筒 360度旋转调焦 强光',	614,	573,	 'products/1/150.jpg',	45,	'纳丽德360度旋转调焦手电P2 AAA',	0,	'2016-06-20 12:12:12',	15,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(151,	'捷科 LED灯 30珠 充电式手持 充电工作灯',	456,	403,	 'products/1/151.jpg',	32,	'捷科 LED灯 30珠 充电式手持 充电工作灯',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(152,	'世达 工作灯 手持式 汽修照明灯 ET灯 维修灯 应急灯',	653,	612,	 'products/1/152.jpg',	12,	'世达 工作灯 手持式 汽修照明灯 ET灯 维修灯 应急灯',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(153,	'史丹利 工作灯 30LED 锂电多功能 汽修照明灯 ET灯',	720,	673,	 'products/1/153.jpg',	45,	'史丹利 工作灯 30LED 锂电多功能 汽修照明灯 ET灯 维修灯 应急灯',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(154,	'捷科 工作灯 大 充电 汽修照明灯 ET灯 维修灯 应急灯',	245,	203,	 'products/1/154.jpg',	65,	'捷科 工作灯 大 充电 汽修照明灯 ET灯 维修灯 应急灯',	1,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(155,	'世达 LED灯 18珠 手持锂电 充电工作灯',	365,	312,	 'products/1/155.jpg',	45,	'世达 LED灯 18珠 手持锂电 充电工作灯',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(156,	'世达 手电筒 18LED充电式防水 强光 远射 战术防水防身',	451,	378,	 'products/1/156.jpg',	78,	'世达 手电筒 18LED充电式防水 强光 远射 战术防水防身 户外照明',	0,	'2016-06-20 12:12:12',	16,2,1,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(157,	'钢盾 工作灯 外星人 汽修照明灯 ET灯 维修灯 应急灯',	364,	302,	 'products/1/157.jpg',	45,	'360度可弯曲旋转支架  超强磁力支架底座，方便任意工作环境使用 ? 弹性活动关节，可快捷任意转动或造型  4档开关控制，3种照明模式，操作方便  独特专利外观设计',	1,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(158,	'钢盾 工作灯 多功能充电 汽修照明灯 ET灯 维修灯 应急灯',	457,	413,	 'products/1/158.jpg',	32,	'主灯采用1.5W大功率LED灯珠，亮度高，节能灯罩采用3mm厚度透明钢化玻璃，高透明度，耐油，抗压  高性能3.7V可充锂电池，容量1500mAh，充电后，可连续使用3小时',	0,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(159,	'夜鹰 聚光灯 5W 锂电池橙黑色',	423,	372,	 'products/1/159.jpg',	16,	'夜鹰 聚光灯 5W 锂电池橙黑色',	0,	'2016-06-20 12:12:12',	16,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(160,	'史丹利 电烙铁 45W 220V 焊接工具',	451,	406,	 'products/1/160.jpg',	32,	'史丹利 电烙铁 45W 220V 焊接工具',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(161,	'史丹利 电烙铁 30W 220V 焊接工具',	635,	600,	 'products/1/161.jpg',	21,	'轻巧手柄，长时间使用不易疲劳。 发热芯更换简便。',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(162,	'捷科 LSI-50 电烙铁 外热式长寿型 焊接工具',	711,	642,	 'products/1/162.jpg',	45,	'材料采用60Cr-V铬钒钢，强度高韧性好 表面采用镀铬处理，防锈能力强',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(163,	'捷科 LSI-60 电烙铁 外热式长寿型 焊接工具',	225,	185,	 'products/1/163.jpg',	56,	'材料采用60Cr-V铬钒钢，强度高韧性好 表面采用镀铬处理，防锈能力强',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(164,	'世达 电烙铁 60瓦 外热式长寿 焊接工具',	340,	301,	 'products/1/164.jpg',	12,	'60瓦外热式长寿电烙铁',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(165,	'世达 电烙铁 40瓦 陶瓷内热式工业级 焊接工具',	443,	402,	 'products/1/165.jpg',	23,	'40瓦陶瓷内热式工业级电烙铁',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(166,	'世达 电烙铁 60瓦 陶瓷内热式工业级 焊接工具',	576,	523,	 'products/1/166.jpg',	45,	'60瓦陶瓷内热式工业级电烙铁',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(167,	'史丹利 电烙铁 40W 外热式 焊接工具',	234,	200,	 'products/1/167.jpg',	56,	'史丹利外热式电烙铁40W',	0,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(168,	'世达 电烙铁 20瓦/130瓦 快速升温双功率 焊接工具',	654,	623,	 'products/1/168.jpg',	14,	'世达 电烙铁 20瓦/130瓦 快速升温双功率 焊接工具',	1,	'2016-06-20 12:12:12',	17,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(169,	'钢盾 数字万用表 钳式 万能表',	476,	431,	 'products/1/169.jpg',	25,	'本产品是一款性能稳定、安全，可靠的3-1/2位数字钳式表。全量程过载保护和独特的外观设计，使之成为性能更为卓越的新一代实用电工测量仪表。 可用于冶炼、制造、石油、电力',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(170,	'优利德 UT39A 数字万用表 掌上型 万能表',	782,	722,	 'products/1/170.jpg',	36,	'优利德 UT39A 数字万用表 掌上型 万能表',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(171,	'优利德 UT33A 数字万用表(第二代） 掌上型 万能表',	451,	422,	 'products/1/171.jpg',	41,	'优利德 UT33A 数字万用表(第二代） 掌上型 万能表',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(172,	'优利德 UT39C 数字万用表 掌上型 万能表',	324,	300,	 'products/1/172.jpg',	52,	'优利德 UT39C 数字万用表 掌上型 万能表',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(173,	'优利德 UT33D 数字万用表(第二代） 掌上型 万能表',	654,	612,	 'products/1/173.jpg',	63,	'优利德 UT33D 数字万用表(第二代） 掌上型 万能表',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(174,	'优利德 UT136A 数字万用表 掌上型 万能表',	123,	78,	 'products/1/174.jpg',	74,	'优利德 UT136A 数字万用表 掌上型 万能表',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(175,	'史丹利 数字万用表 掌上型 万能表',	256,	211,	 'products/1/175.jpg',	45,	'史丹利掌上型数字万用表',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(176,	'钢盾 数字万用表 万能表',	345,	312,	 'products/1/176.jpg',	61,	'本数字万用表是功能齐全，性能稳定，精度高，功耗低，结构新颖，安全可靠的小型手持式自动量程数字万用表，是广大用户的理想测量仪表。 可用于家庭、学校、冶炼、通讯、制',	1,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(177,	'波斯工具 数显万用表',	642,	621,	 'products/1/177.jpg',	52,	'波斯工具 数显万用表',	0,	'2016-06-20 12:12:12',	18,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(178,	'钢盾 工具车 680x458x995mm 7抽屉 推车 多功能手推车',	624,	578,	 'products/1/178.jpg',	62,	'7抽屉，滚珠滑轨设计，带自锁功能  表面烤漆，防锈能力强，抗刮擦，抗溶解  刹车系统安全可靠  脚轮机动，灵便，耐用',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(179,	'史丹利 工具车 27" 7抽屉轻型 推车 多功能手推车 零件车',	453,	412,	 'products/1/179.jpg',	12,	'史丹利 工具车 27" 7抽屉轻型 推车 多功能手推车 零件车',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(180,	'史丹利 工具车 7抽屉多功能 推车 多功能手推车 零件车',	512,	478,	 'products/1/180.jpg',	23,	'史丹利 工具车 7抽屉多功能 推车 多功能手推车 零件车',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(181,	'捷科 工具车 6抽屉 推车 多功能手推车 零件车',	321,	300,	 'products/1/181.jpg',	45,	'捷科 工具车 6抽屉 推车 多功能手推车 零件车',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(182,	'钢盾 工具车 688x458x885mm 6抽屉 推车 多功能手推车',	267,	212,	 'products/1/182.jpg',	56,	'6抽屉，滚珠滑轨设计，带自锁功能 表面烤漆，防锈能力强，抗刮擦，抗溶解  刹车系统安全可靠  脚轮机动，灵便，耐用',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(183,	'七抽屉专业级工具箱',	360,	312,	 'products/1/183.jpg',	14,	'七抽屉专业级工具箱',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(184,	'史丹利 工具车 7抽屉 推车 多功能手推车 零件车',	784,	724,	 'products/1/184.jpg',	25,	'史丹利 工具车 7抽屉 推车 多功能手推车 零件车',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(185,	'捷科 工具车 7抽屉 推车 多功能手推车 零件车',	346,	322,	 'products/1/185.jpg',	36,	'捷科 工具车 7抽屉 推车 多功能手推车 零件车',	0,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(186,	'世达 工具车七抽屉带轮 推车 多功能手推车 零件车',	455,	422,	 'products/1/186.jpg',	41,	'世达 工具车 680x458x860MM 七抽屉带轮 推车 多功能手推车 零件车',	1,	'2016-06-20 12:12:12',	19,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(187,	'钢盾 工具箱 17" 强力塑料 收纳箱 零件箱',	613,	578,	 'products/1/187.jpg',	52,	'箱体采用高强度耐冲击材料 内含层板，利于有序存放物品 锁扣采用金属材料  提手牢固耐用',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(188,	'世达 工具箱 15" 塑料 收纳箱 零件箱',	456,	412,	 'products/1/188.jpg',	63,	'箱体选用增强型PP材料，含纤维树脂，高强度耐冲击 锁扣、提手采用ABS工程塑料，牢固耐用',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(189,	'世达 工具箱 18" 塑料 收纳箱 零件箱',	321,	277,	 'products/1/189.jpg',	7,	'箱体选用增强型PP材料，含纤维树脂，高强度耐冲击 锁扣、提手采用ABS工程塑料，牢固耐用 内含层板，方便自由分割储物区域',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(190,	'万克宝 工具箱 16" 塑料 多功能维修五金工具盒',	784,	745,	 'products/1/190.jpg',	12,	'万克宝16"塑料工具箱',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(191,	'万克宝19"塑料工具箱',	652,	613,	 'products/1/191.jpg',	23,	'万克宝19"塑料工具箱',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(192,	'万克宝 工具箱 20" 塑料 收纳箱 零件箱',	874,	811,	 'products/1/192.jpg',	21,	'万克宝 工具箱 20" 塑料 收纳箱 零件箱',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(193,	'万克宝13.5"塑料工具箱',	651,	623,	 'products/1/193.jpg',	45,	'万克宝13.5"塑料工具箱',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(194,	'万克宝16"塑料工具箱',	457,	421,	 'products/1/194.jpg',	65,	'万克宝16"塑料工具箱',	0,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(195,	'力易得 工具箱 17" 加强型塑料 收纳箱 零件箱',	632,	600,	 'products/1/195.jpg',	72,	'超强型设计，加厚加固优质塑料注塑而成；内含隔离托盘，独有透明翻盖零件盒。',	1,	'2016-06-20 12:12:12',	20,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(196,	'钢盾 工具组套 61件 机械维修',	456,	412,	 'products/1/196.jpg',	75,	'产品采用优质铬钒钢，表面镀铬，镜面抛光处理',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(197,	'捷科 工具组套 73件 机修',	321,	301,	 'products/1/197.jpg',	76,	'捷科 工具组套 73件 机修',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(198,	'世达 工具组套 58件 机械设备维修',	457,	412,	 'products/1/198.jpg',	74,	'产品特点主要适用于工矿企业的机械设备维修安装涵盖了新旧国家标准M5-M12的螺栓的安装拆卸',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(199,	'力易得 工具组套 52件 机修',	651,	621,	 'products/1/199.jpg',	45,	'外径尺寸：380x260x80mm；机修具组，适用于工矿、物业、家居日常电器维修作业',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(200,	'史丹利 工具组套 58件套 10MM系列公制',	741,	722,	 'products/1/200.jpg',	56,	'史丹利 工具组套 58件套 10MM系列公制',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(201,	'华丰巨箭52件套精品机修组套',	364,	321,	 'products/1/201.jpg',	12,	'HF-81052A',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(202,	'世达 工具组套 33件 电梯维修保养',	126,	87,	 'products/1/202.jpg',	35,	'专为电梯维修保养人员设计，广泛应用于电梯安装，日常保养和维修。电梯组套专用吹塑盒, 便于工具存放和携带, 结实耐用, 特别适合外出施工和物业人员携带。',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(203,	'捷科 工具组套 75件 机修',	574,	533,	 'products/1/203.jpg',	45,	'捷科 工具组套 75件 机修',	0,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(204,	'史丹利 工具套装 53件套 电讯',	423,	378,	 'products/1/204.jpg',	65,	'专业人士必备套装, 适用于日常维护维修和故障解决 工具配备齐全, 使用得心应手 通用性好,广泛应用于各种行业 吹塑工具盒坚固耐用 品质优秀, 值得信赖',	1,	'2016-06-20 12:12:12',	21,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(205,	'万克宝 工具组套 9PC',	652,	611,	 'products/1/205.jpg',	15,	'万克宝 工具组套 9PC',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(206,	'华丰巨箭150件套精品套筒组套',	604,	577,	 'products/1/206.jpg',	26,	'HF-81150A',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(207,	'万克宝 工具组套 170PC',	570,	486,	 'products/1/207.jpg',	14,	'万克宝 工具组套 170PC',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(208,	'华丰巨箭46件套精品套筒组套',	268,	224,	 'products/1/208.jpg',	25,	'HF-81046A',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(209,	'世达 工具组套 26件 12.5MM系列综合',	126,	97,	 'products/1/209.jpg',	36,	'优质铬钒钢锻造，薄壁设计，防锈耐磨，抗冲击性能好',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(210,	'钢盾 工具组套 120件 综合性',	368,	320,	 'products/1/210.jpg',	78,	'产品采用优质铬钒钢，表面镀铬，镜面抛光处理',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(211,	'世达 套筒组套 86件 6.3x12.5MM系列',	247,	211,	 'products/1/211.jpg',	65,	'优质铬钒钢锻造，薄壁设计，防锈耐磨，抗冲击性能好',	1,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(212,	'世达 工具组套 35件 6.3x10MM系列综合花形',	326,	288,	 'products/1/212.jpg',	45,	'35件6.3x10MM系列综合花形工具组套',	0,	'2016-06-20 12:12:12',	22,2,0,1);
	insert into product(pid,pname,market_price,shop_price,image,num,pdesc,is_hot,pdate,csid,uid,is_top,shelves)values(213,	'史丹利 工具组套 58件套 通用',	246,	223,	 'products/1/213.jpg',	32,	'史丹利58件套通用工具组套',	0,	'2016-06-20 12:12:12',	22,2,0,1);

































