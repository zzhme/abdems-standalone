/*
    约束:
    创建student表
	id:主键
	名字:非空
	邮箱:唯一
	score: 默认值是0
	身份证号: 非空 唯一
 */
use db01;
#删除表
drop table if exists student;

#创建表

#插入数据
#证明id唯一/非空

#证明name不能为空

#证明邮箱唯一

#证明默认值: 不给值默认是0,如果你给null,值就是null

#证明身份证号唯一且非空


#删除表
drop table if exists student;

#创建表

#主键字段是数字类型,可以添加auto_increment,表示主键自增长,它的值由mysql控制,我们就不用管了
#必须是数字字段
#添加数据:测试自增长
