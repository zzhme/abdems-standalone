/*
	创建表
	格式:
	    create table if not exists 表名(
	        字段名1  类型 约束,
	        字段名2  类型 约束,
	        ...
	        字段名n  类型  约束
	    );
	练习:
		创建student表格
		编号: sid	int
		姓名: sname	varchar(200)
		性别: sgender char(1)
		年龄: sage int
*/
# 创建数据库db01
CREATE DATABASE IF NOT EXISTS db01 CHARACTER SET utf8mb4;
# 使用/切换数据库db01


/*
	创建表
	练习:
		创建分类表category
		分类id: cid int 
		分类名称:cname varchar(100)
*/
use db01;

create table if not exists category(
    cid int,
    cname varchar(100)
);

/*
    创建表
    练习:
        设计一张员工信息表,要求如下:
        1.编号(纯数字)
        2.员工工号(字符串类型,长度不超过10位)
        3.员工姓名(字符串类型,长度不超过10位)
        4.性别(男/女,存储一个汉字)
        5.年龄(正常人年龄,不可能存储负数)
        6.身份证号(二代身份证号均为18位,身份正中有X这样的字符)
        7.入职时间(取值年月日即可)
 */
create table if not exists employee(
    id bigint,
    no varchar(10),
    gender char(1),
    age tinyint unsigned,
    card_no char(18),
    entrydate date
);
