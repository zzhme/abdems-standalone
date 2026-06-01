drop database if exists springboot;
create database if not exists springboot;
use springboot;

-- 删除职位表
drop table if exists job;

-- 职位管理
create table if not exists job(
      id int unsigned primary key auto_increment comment '主键ID',
      name varchar(10) not null unique comment '职位名称',
      create_time datetime not null comment '创建时间',
      update_time datetime not null comment '修改时间'
) comment '职位表';

insert into job (id, name, create_time, update_time) values(1,'班主任',now(),now()),(2,'讲师',now(),now()),(3,'学工主管',now(),now()), (4,'教研主管',now(),now()),(5,'咨询',now(),now());


-- 删除部门表
drop table if exists dept;

-- 部门管理
create table if not exists dept(
                     id int unsigned primary key auto_increment comment '主键ID',
                     name varchar(10) not null unique comment '部门名称',
                     create_time datetime not null comment '创建时间',
                     update_time datetime not null comment '修改时间'
) comment '部门表';

insert into dept (id, name, create_time, update_time) values(1,'学工部',now(),now()),(2,'教研部',now(),now()),(3,'咨询部',now(),now()), (4,'就业部',now(),now()),(5,'人事部',now(),now());


-- 删除员工表
drop table if exists emp;
-- 员工管理(带约束)
create table if not exists emp (
     id int unsigned primary key auto_increment comment 'ID',
     username varchar(20) not null unique comment '用户名',
     password varchar(32) default '123456' comment '密码',
     name varchar(10) not null comment '姓名',
     gender tinyint unsigned not null comment '性别, 说明: 1 男, 2 女',
     image varchar(300) comment '图像',
     job tinyint unsigned comment '职位, 说明: 1 班主任,2 讲师, 3 学工主管, 4 教研主管, 5 咨询师',
     entrydate date comment '入职时间',
     dept_id int unsigned comment '部门ID',
     create_time datetime not null comment '创建时间',
     update_time datetime not null comment '修改时间'
) comment '员工表';

INSERT INTO emp
(id, username, password, name, gender, image, job, entrydate,dept_id, create_time, update_time) VALUES
    (1,'jinyong','123456','金庸',1,'1.jpg',4,'2000-01-01',2,now(),now()),
    (2,'zhangwuji','123456','张无忌',1,'2.jpg',2,'2015-01-01',2,now(),now()),
    (3,'yangxiao','123456','杨逍',1,'3.jpg',2,'2008-05-01',2,now(),now()),
    (4,'weiyixiao','123456','韦一笑',1,'4.jpg',2,'2007-01-01',2,now(),now()),
    (5,'changyuchun','123456','常遇春',1,'5.jpg',2,'2012-12-05',2,now(),now()),
    (6,'xiaozhao','123456','小昭',2,'6.jpg',3,'2013-09-05',1,now(),now()),
    (7,'jixiaofu','123456','纪晓芙',2,'7.jpg',1,'2005-08-01',1,now(),now()),
    (8,'zhouzhiruo','123456','周芷若',2,'8.jpg',1,'2014-11-09',1,now(),now()),
    (9,'dingminjun','123456','丁敏君',2,'9.jpg',1,'2011-03-11',1,now(),now()),
    (10,'zhaomin','123456','赵敏',2,'10.jpg',1,'2013-09-05',1,now(),now()),
    (11,'luzhangke','123456','鹿杖客',1,'11.jpg',5,'2007-02-01',3,now(),now()),
    (12,'hebiweng','123456','鹤笔翁',1,'12.jpg',5,'2008-08-18',3,now(),now()),
    (13,'fangdongbai','123456','方东白',1,'13.jpg',5,'2012-11-01',3,now(),now()),
    (14,'zhangsanfeng','123456','张三丰',1,'14.jpg',2,'2002-08-01',2,now(),now()),
    (15,'yulianzhou','123456','俞莲舟',1,'15.jpg',2,'2011-05-01',2,now(),now()),
    (16,'songyuanqiao','123456','宋远桥',1,'16.jpg',2,'2007-01-01',2,now(),now()),
    (17,'chenyouliang','123456','陈友谅',1,'17.jpg',NULL,'2015-03-21',NULL,now(),now());
	
-- 插入部门表数据 (10条记录)
INSERT INTO dept (name, create_time, update_time) VALUES
('技术部', NOW(), NOW()),
('人力资源部', NOW(), NOW()),
('市场部', NOW(), NOW()),
('财务部', NOW(), NOW()),
('销售部', NOW(), NOW()),
('行政部', NOW(), NOW()),
('研发部', NOW(), NOW()),
('客服部', NOW(), NOW()),
('培训部', NOW(), NOW()),
('法务部', NOW(), NOW());

-- 插入员工表数据 (100条记录，按部门平均分配)
INSERT INTO emp (username, password, name, gender, image, job, entrydate, dept_id, create_time, update_time) VALUES
-- 技术部员工 (1-10)
('tech001', '123456', '张三', 1, 'tech001.jpg', 2, '2023-01-15', 1, NOW(), NOW()),
('tech002', '123456', '李四', 2, 'tech002.jpg', 2, '2023-02-20', 1, NOW(), NOW()),
('tech003', '123456', '王五', 1, 'tech003.jpg', 1, '2023-03-10', 1, NOW(), NOW()),
('tech004', '123456', '赵六', 2, 'tech004.jpg', 3, '2023-04-05', 1, NOW(), NOW()),
('tech005', '123456', '钱七', 1, 'tech005.jpg', 2, '2023-05-25', 1, NOW(), NOW()),
('tech006', '123456', '孙八', 2, 'tech006.jpg', 4, '2023-06-18', 1, NOW(), NOW()),
('tech007', '123456', '周九', 1, 'tech007.jpg', 2, '2023-07-12', 1, NOW(), NOW()),
('tech008', '123456', '吴十', 2, 'tech008.jpg', 1, '2023-08-08', 1, NOW(), NOW()),
('tech009', '123456', '郑十一', 1, 'tech009.jpg', 2, '2023-09-03', 1, NOW(), NOW()),
('tech010', '123456', '王十二', 2, 'tech010.jpg', 5, '2023-10-20', 1, NOW(), NOW()),

-- 人力资源部员工 (11-20)
('hr001', '123456', '刘一', 2, 'hr001.jpg', 1, '2023-01-10', 2, NOW(), NOW()),
('hr002', '123456', '陈二', 1, 'hr002.jpg', 2, '2023-02-15', 2, NOW(), NOW()),
('hr003', '123456', '杨三', 2, 'hr003.jpg', 3, '2023-03-20', 2, NOW(), NOW()),
('hr004', '123456', '黄四', 1, 'hr004.jpg', 2, '2023-04-25', 2, NOW(), NOW()),
('hr005', '123456', '周吴', 2, 'hr005.jpg', 1, '2023-05-30', 2, NOW(), NOW()),
('hr006', '123456', '郑王', 1, 'hr006.jpg', 2, '2023-06-05', 2, NOW(), NOW()),
('hr007', '123456', '冯陈', 2, 'hr007.jpg', 3, '2023-07-10', 2, NOW(), NOW()),
('hr008', '123456', '褚卫', 1, 'hr008.jpg', 2, '2023-08-15', 2, NOW(), NOW()),
('hr009', '123456', '蒋沈', 2, 'hr009.jpg', 1, '2023-09-20', 2, NOW(), NOW()),
('hr010', '123456', '韩杨', 1, 'hr010.jpg', 4, '2023-10-25', 2, NOW(), NOW()),

-- 市场部员工 (21-30)
('marketing001', '123456', '朱一', 1, 'marketing001.jpg', 2, '2023-01-05', 3, NOW(), NOW()),
('marketing002', '123456', '秦二', 2, 'marketing002.jpg', 2, '2023-02-10', 3, NOW(), NOW()),
('marketing003', '123456', '尤三', 1, 'marketing003.jpg', 1, '2023-03-15', 3, NOW(), NOW()),
('marketing004', '123456', '许四', 2, 'marketing004.jpg', 3, '2023-04-20', 3, NOW(), NOW()),
('marketing005', '123456', '何五', 1, 'marketing005.jpg', 2, '2023-05-25', 3, NOW(), NOW()),
('marketing006', '123456', '吕六', 2, 'marketing006.jpg', 4, '2023-06-30', 3, NOW(), NOW()),
('marketing007', '123456', '施七', 1, 'marketing007.jpg', 2, '2023-07-05', 3, NOW(), NOW()),
('marketing008', '123456', '张八', 2, 'marketing008.jpg', 1, '2023-08-10', 3, NOW(), NOW()),
('marketing009', '123456', '孔九', 1, 'marketing009.jpg', 2, '2023-09-15', 3, NOW(), NOW()),
('marketing010', '123456', '曹十', 2, 'marketing010.jpg', 5, '2023-10-20', 3, NOW(), NOW()),

-- 财务部员工 (31-40)
('finance001', '123456', '严一', 2, 'finance001.jpg', 1, '2023-01-10', 4, NOW(), NOW()),
('finance002', '123456', '华二', 1, 'finance002.jpg', 2, '2023-02-15', 4, NOW(), NOW()),
('finance003', '123456', '金三', 2, 'finance003.jpg', 3, '2023-03-20', 4, NOW(), NOW()),
('finance004', '123456', '魏四', 1, 'finance004.jpg', 2, '2023-04-25', 4, NOW(), NOW()),
('finance005', '123456', '陶五', 2, 'finance005.jpg', 1, '2023-05-30', 4, NOW(), NOW()),
('finance006', '123456', '姜六', 1, 'finance006.jpg', 2, '2023-06-05', 4, NOW(), NOW()),
('finance007', '123456', '戚七', 2, 'finance007.jpg', 3, '2023-07-10', 4, NOW(), NOW()),
('finance008', '123456', '谢八', 1, 'finance008.jpg', 2, '2023-08-15', 4, NOW(), NOW()),
('finance009', '123456', '邹九', 2, 'finance009.jpg', 1, '2023-09-20', 4, NOW(), NOW()),
('finance010', '123456', '喻十', 1, 'finance010.jpg', 4, '2023-10-25', 4, NOW(), NOW()),

-- 销售部员工 (41-50)
('sales001', '123456', '柏一', 1, 'sales001.jpg', 2, '2023-01-05', 5, NOW(), NOW()),
('sales002', '123456', '水二', 2, 'sales002.jpg', 2, '2023-02-10', 5, NOW(), NOW()),
('sales003', '123456', '窦三', 1, 'sales003.jpg', 1, '2023-03-15', 5, NOW(), NOW()),
('sales004', '123456', '章四', 2, 'sales004.jpg', 3, '2023-04-20', 5, NOW(), NOW()),
('sales005', '123456', '云五', 1, 'sales005.jpg', 2, '2023-05-25', 5, NOW(), NOW()),
('sales006', '123456', '苏六', 2, 'sales006.jpg', 4, '2023-06-30', 5, NOW(), NOW()),
('sales007', '123456', '潘七', 1, 'sales007.jpg', 2, '2023-07-05', 5, NOW(), NOW()),
('sales008', '123456', '葛八', 2, 'sales008.jpg', 1, '2023-08-10', 5, NOW(), NOW()),
('sales009', '123456', '奚九', 1, 'sales009.jpg', 2, '2023-09-15', 5, NOW(), NOW()),
('sales010', '123456', '范十', 2, 'sales010.jpg', 5, '2023-10-20', 5, NOW(), NOW()),

-- 行政部员工 (51-60)
('admin001', '123456', '彭一', 2, 'admin001.jpg', 1, '2023-01-10', 6, NOW(), NOW()),
('admin002', '123456', '郎二', 1, 'admin002.jpg', 2, '2023-02-15', 6, NOW(), NOW()),
('admin003', '123456', '鲁三', 2, 'admin003.jpg', 3, '2023-03-20', 6, NOW(), NOW()),
('admin004', '123456', '韦四', 1, 'admin004.jpg', 2, '2023-04-25', 6, NOW(), NOW()),
('admin005', '123456', '昌五', 2, 'admin005.jpg', 1, '2023-05-30', 6, NOW(), NOW()),
('admin006', '123456', '马六', 1, 'admin006.jpg', 2, '2023-06-05', 6, NOW(), NOW()),
('admin007', '123456', '苗七', 2, 'admin007.jpg', 3, '2023-07-10', 6, NOW(), NOW()),
('admin008', '123456', '凤八', 1, 'admin008.jpg', 2, '2023-08-15', 6, NOW(), NOW()),
('admin009', '123456', '花九', 2, 'admin009.jpg', 1, '2023-09-20', 6, NOW(), NOW()),
('admin010', '123456', '方十', 1, 'admin010.jpg', 4, '2023-10-25', 6, NOW(), NOW()),

-- 研发部员工 (61-70)
('rd001', '123456', '俞一', 1, 'rd001.jpg', 2, '2023-01-05', 7, NOW(), NOW()),
('rd002', '123456', '任二', 2, 'rd002.jpg', 2, '2023-02-10', 7, NOW(), NOW()),
('rd003', '123456', '袁三', 1, 'rd003.jpg', 1, '2023-03-15', 7, NOW(), NOW()),
('rd004', '123456', '柳四', 2, 'rd004.jpg', 3, '2023-04-20', 7, NOW(), NOW()),
('rd005', '123456', '酆五', 1, 'rd005.jpg', 2, '2023-05-25', 7, NOW(), NOW()),
('rd006', '123456', '鲍六', 2, 'rd006.jpg', 4, '2023-06-30', 7, NOW(), NOW()),
('rd007', '123456', '史七', 1, 'rd007.jpg', 2, '2023-07-05', 7, NOW(), NOW()),
('rd008', '123456', '唐八', 2, 'rd008.jpg', 1, '2023-08-10', 7, NOW(), NOW()),
('rd009', '123456', '费九', 1, 'rd009.jpg', 2, '2023-09-15', 7, NOW(), NOW()),
('rd010', '123456', '廉十', 2, 'rd010.jpg', 5, '2023-10-20', 7, NOW(), NOW()),

-- 客服部员工 (71-80)
('service001', '123456', '岑一', 2, 'service001.jpg', 1, '2023-01-10', 8, NOW(), NOW()),
('service002', '123456', '薛二', 1, 'service002.jpg', 2, '2023-02-15', 8, NOW(), NOW()),
('service003', '123456', '雷三', 2, 'service003.jpg', 3, '2023-03-20', 8, NOW(), NOW()),
('service004', '123456', '贺四', 1, 'service004.jpg', 2, '2023-04-25', 8, NOW(), NOW()),
('service005', '123456', '倪五', 2, 'service005.jpg', 1, '2023-05-30', 8, NOW(), NOW()),
('service006', '123456', '汤六', 1, 'service006.jpg', 2, '2023-06-05', 8, NOW(), NOW()),
('service007', '123456', '滕七', 2, 'service007.jpg', 3, '2023-07-10', 8, NOW(), NOW()),
('service008', '123456', '殷八', 1, 'service008.jpg', 2, '2023-08-15', 8, NOW(), NOW()),
('service009', '123456', '罗九', 2, 'service009.jpg', 1, '2023-09-20', 8, NOW(), NOW()),
('service010', '123456', '毕十', 1, 'service010.jpg', 4, '2023-10-25', 8, NOW(), NOW()),

-- 培训部员工 (81-90)
('training001', '123456', '郝一', 1, 'training001.jpg', 2, '2023-01-05', 9, NOW(), NOW()),
('training002', '123456', '邬二', 2, 'training002.jpg', 2, '2023-02-10', 9, NOW(), NOW()),
('training003', '123456', '安三', 1, 'training003.jpg', 1, '2023-03-15', 9, NOW(), NOW()),
('training004', '123456', '常四', 2, 'training004.jpg', 3, '2023-04-20', 9, NOW(), NOW()),
('training005', '123456', '乐五', 1, 'training005.jpg', 2, '2023-05-25', 9, NOW(), NOW()),
('training006', '123456', '于六', 2, 'training006.jpg', 4, '2023-06-30', 9, NOW(), NOW()),
('training007', '123456', '时七', 1, 'training007.jpg', 2, '2023-07-05', 9, NOW(), NOW()),
('training008', '123456', '傅八', 2, 'training008.jpg', 1, '2023-08-10', 9, NOW(), NOW()),
('training009', '123456', '皮九', 1, 'training009.jpg', 2, '2023-09-15', 9, NOW(), NOW()),
('training010', '123456', '卞十', 2, 'training010.jpg', 5, '2023-10-20', 9, NOW(), NOW()),

-- 法务部员工 (91-100)
('legal001', '123456', '齐一', 2, 'legal001.jpg', 1, '2023-01-10', 10, NOW(), NOW()),
('legal002', '123456', '康二', 1, 'legal002.jpg', 2, '2023-02-15', 10, NOW(), NOW()),
('legal003', '123456', '伍三', 2, 'legal003.jpg', 3, '2023-03-20', 10, NOW(), NOW()),
('legal004', '123456', '余四', 1, 'legal004.jpg', 2, '2023-04-25', 10, NOW(), NOW()),
('legal005', '123456', '元五', 2, 'legal005.jpg', 1, '2023-05-30', 10, NOW(), NOW()),
('legal006', '123456', '卜六', 1, 'legal006.jpg', 2, '2023-06-05', 10, NOW(), NOW()),
('legal007', '123456', '顾七', 2, 'legal007.jpg', 3, '2023-07-10', 10, NOW(), NOW()),
('legal008', '123456', '孟八', 1, 'legal008.jpg', 2, '2023-08-15', 10, NOW(), NOW()),
('legal009', '123456', '平九', 2, 'legal009.jpg', 1, '2023-09-20', 10, NOW(), NOW()),
('legal010', '123456', '黄十', 1, 'legal010.jpg', 4, '2023-10-25', 10, NOW(), NOW());


drop table if exists operate_log;
-- 操作日志表
create table if not exists operate_log(
      id int unsigned primary key auto_increment comment 'ID',
      operate_user varchar(100) comment '操作人',
      operate_time datetime comment '操作时间',
      class_name varchar(100) comment '操作的类名',
      method_name varchar(100) comment '操作的方法名',
      method_params varchar(1000) comment '方法参数',
      return_value varchar(2000) comment '返回值',
      cost_time bigint comment '方法执行耗时, 单位:ms'
) comment '操作日志表';

-- 删除brand表
drop table if exists brand;
-- 创建brand表
create table if not exists brand
(
    -- id 主键
    id           int primary key auto_increment,
    -- 品牌名称
    brand_name   varchar(100),
    -- 企业名称
    company_name varchar(100),
    -- 排序字段
    ordered      int,
    -- 图片
    image varchar(200),
    -- 描述信息
    description  varchar(200),
    -- 状态：0：禁用  1：启用
    status       int
);
-- 添加数据
insert into brand (brand_name, company_name, ordered, image, description, status)
values
    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司', 10, 'ali-4.jpg',  '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50,'tengxun-5.jpg',  '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),
    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('三只松鼠', '三只松鼠股份有限公司', 5, 'songshu-8.jpg', '好吃不上火', 0),

    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司', 10, 'ali-4.jpg', '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50, 'tengxun-5.jpg', '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),
    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1),

    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司',  10, 'ali-4.jpg', '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50, 'tengxun-5.jpg', '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),
    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('三只松鼠', '三只松鼠股份有限公司', 5, 'songshu-8.jpg', '好吃不上火', 0),

    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司', 10, 'ali-4.jpg', '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50, 'tengxun-5.jpg', '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),

    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1),
    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司', 10, 'ali-4.jpg', '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50, 'tengxun-5.jpg', '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),
    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('三只松鼠', '三只松鼠股份有限公司', 5, 'songshu-8.jpg', '好吃不上火', 0),

    ('华为', '华为技术有限公司', 100, 'huawei-1.jpg', '万物互联', 1),
    ('小米', '小米科技有限公司', 50, 'xiaomi-2.jpg', 'are you ok', 1),
    ('格力', '格力电器股份有限公司', 30, 'geli-3.jpg', '让世界爱上中国造', 1),
    ('阿里巴巴', '阿里巴巴集团控股有限公司', 10, 'ali-4.jpg', '买买买', 1),
    ('腾讯', '腾讯计算机系统有限公司', 50, 'tengxun-5.jpg', '玩玩玩', 0),
    ('百度', '百度在线网络技术公司', 5, 'baidu-6.jpg', '搜搜搜', 0),
    ('京东', '北京京东世纪贸易有限公司', 40, 'jingdong-7.jpg', '就是快', 1);

-- =========================================
-- 产品表（在已有业务库中执行，例如 jhytest 或 abde_db）
-- =========================================
drop table if exists product;

create table product (
                         id bigint unsigned primary key auto_increment comment '产品ID',
                         name varchar(100) not null comment '产品名称',
                         description varchar(500) default null comment '产品简介',
                         cover_url varchar(500) default null comment '封面图URL（OSS等）',
                         price decimal(12, 2) not null default 0.00 comment '单价',
                         status tinyint unsigned not null default 1 comment '状态: 1上架 0下架',
                         create_time datetime not null default current_timestamp comment '创建时间',
                         update_time datetime not null default current_timestamp on update current_timestamp comment '更新时间'
) engine=innodb default charset=utf8mb4 comment='产品表';

create index idx_product_name on product(name);
create index idx_product_status on product(status);

-- =========================================
-- 测试数据（cover_url 可替换为你实际上传后的 OSS 地址）
-- =========================================
insert into product (name, description, cover_url, price, status)
values
    ('Spring Boot 实战教程', '从入门到项目实战，含 JWT、MyBatis、OSS 上传等', 'https://example.com/covers/spring-boot.png', 99.00, 1),
    ('Vue2 管理后台模板', 'Element UI 表格、表单、路由守卫示例', 'https://example.com/covers/vue-admin.png', 49.90, 1),
    ('MySQL 性能优化笔记', '索引、执行计划、分页与慢查询', 'https://example.com/covers/mysql.png', 68.00, 0),
    ('阿里云 OSS 对象存储入门', 'Java SDK 上传与访问域名说明', 'https://example.com/covers/oss.png', 19.90, 1);


create database if not exists springboot;
use springboot;
drop table if exists account;
create table if not exists account(
                                      id int primary key auto_increment comment '主键',
                                      name varchar(100) not null unique comment '账户名称',
                                      money double(10,2) comment '账户余额',
                                      home_address varchar(200) comment '家庭地址'

);
insert into account (name, money,home_address)
values
    ('tom',10000,'北京昌平区'),
    ('jack',50000,'浙江杭州余杭区'),
    ('lucy',80000,'江苏徐州沛县'),
    ('jerry',30000,'山东聊城高唐县'),
    ('kitty',60000,'浙江杭州西湖区'),
    ('merry',20000,'湖北武汉江汉区'),
    ('lily',70000,'湖南长沙芙蓉区');