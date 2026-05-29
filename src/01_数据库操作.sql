/*
	1.创建数据库
		#创建一个名称为mydb1的数据库。
		#创建一个使用utf8字符集的mydb2数据库。
	2.使用数据库
	3.查看某个数据库的定义的信息
	4.查看所有数据库
	5.查看正在使用的数据库
	6.删除数据库
		#删除前面创建的mydb1数据库
	7.修改数据库编码集
		#将mydb2的编码集改成 gbk
*/
#创建一个名称为mydb1的数据库。
CREATE DATABASE IF NOT EXISTS mydb1;
#创建一个使用utf8字符集的mydb2数据库。
CREATE DATABASE IF NOT EXISTS mydb2 CHARACTER SET utf8mb4;

# 2.使用数据库
USE mydb2;

# 3.查看某个数据库的定义的信息
SHOW CREATE DATABASE mydb2;

# 4.查看所有数据库
SHOW DATABASES;

# 5.查看正在使用的数据库
SELECT DATABASE();

# 6.删除前面创建的mydb1数据库
DROP DATABASE IF EXISTS mydb2;

# 7.将mydb2的编码集改成 gbk
ALTER DATABASE mydb2 CHARACTER SET gbk;