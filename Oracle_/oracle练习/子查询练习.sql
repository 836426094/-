select * from  emp t where t.sal>(select sal from emp where gonghao=11)
--查询员工月薪
select t.name ,t.sal from emp t;
select t.name ,t.sal 月薪,t.sal*12 年薪 from emp t 

--查询部门名称是销售部的员工信息
--两种方式，一种是使用子查询的方式，一种是多表查询的方式
--a.理论上使用多表查询的方式只需要查一次，查询速度要快些，但是多表查询会涉及到多表的笛卡尔积问题，
--所以在实际中表的数据如果太大，可以使用子查询的方式
--一：多表查询的方式
select e.* from emp e left join dept d on e.code=d.code where d.dept_name='销售部';

--二、子查询的方式
select * from emp e where e.code=(select code from dept where dept_name='销售部')



--子查询需要注意的问题7：
/*
一般在子查询中不使用排序，但是在TOP-N分析问题中，必须对子查询进行排序
知识点：1.使用到位列rownum 要使用他就需要将它写出来，需要注意两点
           行号永远按照默认的顺序生成，二、行号只能使用<,<=；不能使用> 或>=
        2、倒序排序  desc  
实例：找到员工表中最高工资的前三名


*/

select ss.*,rownum from (select e.* from emp e order by e.sal desc ) ss where rownum<=3;



--附加题  哪天面试官问了一个问题，要对我们今天的面试情况做一个查询，假如每次面试意见都写进数据库里面，
--到晚上的时候，我们要看面试官最后一个人的意见 只看最后一条，那么怎么查询呢？

select s.*,rownum from (
select * from BEIDAFABAO b order by endtime desc ) s where rownum<=10;


--子查询注意问题8
--一般先执行子查询再执行主查询，但是相关子查询例外；
--实例：找到员工表中薪水大于本部门平均薪资的员工

select * from emp t where sal>
(select avg(sal) from emp where code=t.code )

--如果要在表格中显示员工的工号 月薪 部门的平均工资   两个相关子查询
select t.code,
       t.name,
       t.sal,
       (select avg(sal) from emp where code = t.code) dept_avg_sal
  from emp t
 where t.sal >= (select avg(sal) from emp where code = t.code)
