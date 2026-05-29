/*
	查看和删除数据库表
	1.查看数据库中的所有表
	2.查看表结构
	3.删除表
*/
# 切换数据库

use db01;
# 1.查看数据库中的所有表
SHOW TABLES;

# 2.查看表结构
desc category;

# 3.查看表的创建的sql语句
show create table employee;

# 4.删除表
drop table if exists category;