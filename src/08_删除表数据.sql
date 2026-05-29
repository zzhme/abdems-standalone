/*
	删除表数据
		格式:
	    delete from 表名 where 条件
	    条件:
	        关系运算: >,<,>=,<=,=,!=,<>
	        逻辑运算: and(&&), or(||), not
	        范围: between A and B  表示>=A 并且 <= B  [A,B]
	        取值列表: in(A,B,C)  表示A或者B或者C
	        模糊查询: like
	        是空判断: is null
	        非空判断: is not null
		#删除cid为7的记录

		#删除id不是偶数的记录

		#删除cid为2或者cname为'汽车用品'

		#删除表中的所有数据

		#删除表中的所有数据

    delete和truncate的区别?
		1.delete属于DML语句,truncate属于DDL语句
	    2.delete只删除表中的所有数据,记录id的最大值,不会摧毁表结构 效率低 属于DML语句 是可以恢复的
	        delete后面可以使用where写条件
	    3.truncate 直接摧毁表结构,重新建立表结构  不记录id值 效率高 属于DDL语句 是无法恢复
	        truncate后面不能跟条件
*/
#删除cid为7的记录

#删除cid不是偶数的记录

#删除cid为2或者cname为'汽车用品'
#把cid为10的记录cname改成汽车用品

#删除表中的所有数据

#删除所有数据后,再次添加一条数据

#删除表中的所有数据

#删除所有数据后,再次添加一条数据

