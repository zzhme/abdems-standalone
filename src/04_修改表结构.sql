/*
	修改表结构
	
*/
/*
	修改表添加列
		
	格式:
        alter table 表名 add 字段名 类型(长度) [约束];
		
	练习:
		为分类表添加一个新的字段为 分类描述 desc varchar(20)
*/

use db01;
alter table category
    add `desc` varchar(20);



/*
	修改表修改列的类型长度及约束
	
	格式:
	    alter table 表名 modify 字段名 新的类型(长度) [约束];
	练习:
		为分类表的描述字段进行修改，类型varchar(50) 添加约束 not null
*/
alter table category modify `desc` varchar(50) not null ;

/*
	修改表修改列名
	
	格式:
        alter table 表名 change 旧字段名 新字段名 新的类型(长度) [约束];
	练习:
		为分类表的分类描述字段进行更换 更换为 description varchar(30)
*/
alter table category change  `desc` description varchar(30);
	
/*
	修改表删除列
	
	格式:
	    alter table 表名 drop 字段名;
	
	练习:
		删除分类表中description这列
*/

alter table category drop description;

/*
	修改表名
	
	格式:
	    rename table 旧表名 to 新表名;
	
	练习:
		为分类表category 改名成 c
*/
rename table  db01.category to c;
rename table c to category;

/*
	修改表的字符集
	
	格式:
	    alter table 表名 character set 字符集名字
	
	练习:	
		为分类表 category 的编码表进行修改，修改成 gbk
*/

alter table category character set utf8mb4;