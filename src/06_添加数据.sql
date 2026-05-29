/*
	添加数据
		格式:
		insert into 表名(字段名1,字段名2,...字段名n) values(字段值1,字段值2,...字段值n)
	除了数字类型以外,其它字段都要使用引号引起来,建议使用单引号''
	    "insert into category values (null,'箱包'),(null,'珠宝'),(null,'房产')"
*/
# 使用/切换数据库db01
use db01;
drop table if exists category;
create table if not exists category(
   cid int primary key auto_increment comment '分类编号',
   cname varchar(100) comment '分类名称'
);
#指定全部列名和全部列值

#省略全部列名,给定全部列的值

#指定字段名,id是主键,自动增长,mysql帮助我们维护值,不用指定

#指定主键名,省略主键值,但是需要写null进行占位

#省略全部列名,不指定主键值,需要写null给id进行占位			----经常使用----

#以上所有方式,都支持批量添加

#指定全部列名和全部列值

#省略全部列名,给定全部列的值

#指定字段名,id是主键,自动增长,mysql帮助我们维护值,不用指定

#指定主键名,省略主键值,但是需要写null进行占位

#省略全部列名,不指定主键值,需要写null给id进行占位			----经常使用----