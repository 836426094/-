/*
机构层级维表建设 
涉及的知识点：  left join 一对多的问题

需求描述：
在员工表中 emp，有员工号 gonghao，员工名称 name，员工的上级领导工号 mgr，员工职级lev：
要求：如：a 是一级职员， b1,b2,b3是二级职员，c1,c2,c3是三级职员，a是b1,b2的上级，b1,b2分别是c1,c2的上级，那么表格将这样输出

a员工工号  a员工姓名   B1员工工号 b1员工姓名  c1员工工号 c1员工姓名
a员工工号  a员工姓名   B2员工工号 b2员工姓名  c2员工工号 c2员工姓名
a员工工号  a员工姓名   B3员工工号 b3员工姓名  

根据上面要求做题：
*/
-- 第一种方法：ditinct 和多重left join 
/*
select  distinct b.gonghao id1, b.name name1,b.mgr mgr1,t2.id2,t2.name2,t2.mgr mgr2,t3.id3,t3.name3,t3.mgr mgr3,t4.id4,t4.name4,t4.mgr mgr4
  from emp b
left join 
(select a2.gonghao id2 , a2.name name2,a2.mgr mgr from emp a2 left join emp b2 on a2.gonghao=b2.mgr where  a2.lev=2) t2 on b.gonghao=t2.mgr
left join 
(select a3.gonghao id3, a3.name name3,a3.mgr mgr from emp a3 left join emp b3 on a3.gonghao=b3.mgr where  a3.lev=3) t3 on t2.id2=t3.mgr
left join 
(select a4.gonghao id4, a4.name name4,a4.mgr mgr from emp a4 left join emp b on a4.gonghao=b.mgr where  (a4.lev=4 or a4.lev is null)) t4 on t3.id3=t4.mgr
where b.lev=1;
*/

--第二种方法：group by 和多重left join 的方法

/*
select  b.gonghao id1, b.name name1,b.mgr mgr1,t2.id2,t2.name2,t2.mgr mgr2,t3.id3,t3.name3,t3.mgr mgr3,t4.id4,t4.name4,t4.mgr mgr4
  from emp b
left join 
(select a2.gonghao id2 , a2.name name2,a2.mgr mgr from emp a2 left join emp b2 on a2.gonghao=b2.mgr where  a2.lev=2) t2 on b.gonghao=t2.mgr
left join 
(select a3.gonghao id3, a3.name name3,a3.mgr mgr from emp a3 left join emp b3 on a3.gonghao=b3.mgr where  a3.lev=3) t3 on t2.id2=t3.mgr
left join 
(select a4.gonghao id4, a4.name name4,a4.mgr mgr from emp a4 left join emp b on a4.gonghao=b.mgr where  (a4.lev=4 or a4.lev is null)) t4 on t3.id3=t4.mgr
where b.lev=1 group by b.gonghao, b.name ,b.mgr ,t2.id2,t2.name2,t2.mgr ,t3.id3,t3.name3,t3.mgr,t4.id4,t4.name4,t4.mgr;
*/


以上两种方式对时间复杂度和空间复杂度做了区分

1）、A、distinct的方法占用空间较大，查询速度较快
     B、group by的查询方式速度较慢，但是占用空间较少

     原因：distinct需要将col列中的全部内容都存储在一个内存中，可以理解为一个hash结构，key为col的值，最后计算hash结构中有多少个key即可得到结果。很明显，需要将所有不同的值都存起来。内存消耗可能较大。
而group by的方式是先将col排序。而数据库中的group一般使用sort的方法，即数据库会先对col进行排序。而排序的基本理论是，时间复杂为nlogn，空间为1。然后只要单纯的计数就可以了。优点是空间复杂度小，缺点是要进行一次排序，执行时间会较长。
2）、使用场景

数据分布	去重方式	原因
离散	   group	    distinct空间占用较大，在时间复杂度允许的情况下，group 可以发挥空间复杂度优势
集中	   distinct	  当数据占用空间较小时，可以发挥时间复杂度优势
3）、两个极端

数据列的所有数据都一样，即去重计数的结果为1时，用distinct最佳。
如果数据列唯一，没有相同数值，用group 最好。

--下面是7种关联的练习：

--练习表是 emp 和 dept表：

/*EMP
小奎奎 11    
小马哥 6
平平  2
萌 6
林书豪 1
小明  1
纷纷  2
大飞  3
露露  1
三丰  2
阿明  3
刘德华 4
张程程 5
齐德辽 5

dept:
人事部	1
销售部	2
行政部	3
总裁部	4
大数据业务部	5
神隐部	7
外联部	8
财务部	6*/

select name,code from emp;
select dept_name,code from dept;

--第一种类型：left join 只取了部门编号有交集的5和6
--select e.name,e.code,d.dept_name,d.code from emp e left join dept d on e.code=d.code where d.code in (1,2,3,5,6,7) and e.code in (5,6,11);

--一：left join 以emp为主，取emp全部，去掉dept表中与emp不相交的部分
select e.name,e.code,d.dept_name,d.code from emp e left join dept d on e.code=d.code; 


--二 :right join  emp交于dept,以dept 为主，取dept表的全部，去掉emp表中和dept不相交的部分
select e.name,e.code,d.dept_name,d.code from emp e right join dept d on e.code=d.code; 


--三： inner join 取emp与dept交集的部分，两者不交集的部分都不取
select e.name,e.code,d.dept_name,d.code from emp e inner join dept d on e.code=d.code; 


--四：
--四 取emp 和dept全部的数据，不相交的部分也取，显示为空
select e.name,e.code,d.dept_name,d.code from emp e full join dept d on e.code=d.code ;
select e.name,e.code,d.dept_name,d.code from emp e full outer join dept d on e.code=d.code ;

--五 取emp表中和dept表不相交的部分
select e.name,e.code,d.dept_name,d.code from emp e left join dept d on e.code=d.code where d.code is null; 
--六 取dept表中和emp表不相交的部分
select e.name,e.code,d.dept_name,d.code from emp e right join dept d on e.code=d.code where e.code is null; 

 --七 取两张表不相交的部分
select e.name,e.code,d.dept_name,d.code from emp e full join dept d on e.code=d.code where e.code is null and d.code is null; 

select e.name,e.code,d.dept_name,d.code from emp e full outer join dept d on e.code=d.code where e.code is null and d.code is null; 


select e.name,e.code,d.dept_name,d.code from emp e full outer join dept d on e.code=d.code where e.code=null and d.code=null;





















