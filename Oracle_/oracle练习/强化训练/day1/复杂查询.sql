select max(sal),max(sal),max(sal)-max(sal)  from emp


select * from emp where sal=(select min(sal) from emp) or 
sal=(select max(sal) from emp )

select * from emp where sal <= (select avg(sal) from emp)
/*显示每个部门的平均工资和最高工资*/

select a.code,
       b.dept_name,
       max(a.sal) 最高工资,
       avg(a.sal) 平均工资,
       min(a.sal)
  from emp a
  left join dept b
    on a.code = b.code where b.dept_name<>'总裁部'
 group by a.code, b.dept_name ;
 

/*显示每个部门平均工资，最高工资和最小工资，并且按照每个部门的部门好升序排序，按照部门的工资降序排序*/
select a.code,
       b.dept_name,
       
       max(a.sal) 最高工资,
       avg(a.sal) 平均工资,
       min(a.sal) 最小工资
  from emp a
  left join dept b
    on a.code = b.code
 group by a.code, b.dept_name order by a.code asc ,avg(a.sal) desc;

 /*显示平均工资低于2000的部门部门号和他们的平均工资*/
 select e.code, d.dept_name, avg(e.sal) 平均工资
   from emp e
   full join dept d
     on e.code = d.code
  group by e.code, d.dept_name
 having avg(sal) >= 1000000;
 
  /*显示平均工资低于2000的部门部门号和和他的员工号*/
 select a.code, b.dept_name, a.name
   from emp a
   full join dept b
     on a.code = b.code
  where b.dept_name in (select dept_name
                          from emp e
                          full join dept d
                            on e.code = d.code
                         group by e.code, d.dept_name
                        having avg(sal) >= 1000000);
 
  /*显示平均工资低于1000000的部门部门号和和他的员工号以及部门的平均工资     涉及知识点：1.多个子表关联2.分组查询*/
 select a.code, b.dept_name, a.name,a.gonghao,a.sal, c.avg_sal
   from emp a
   full join dept b
     on a.code = b.code
   left join (select e.code, d.dept_name, avg(e.sal) avg_sal
                from emp e
                full join dept d
                  on e.code = d.code
               group by e.code, d.dept_name
              having avg(sal) >= 1000000) c
     on a.code = c.code
  where b.dept_name in (select dept_name
                          from emp e
                          full join dept d
                            on e.code = d.code
                         group by e.code, d.dept_name
                        having avg(sal) >= 1000000);

/*多表查询*/
select * from emp;
select * from dept;
select * from emp,dept;  --笛卡尔积
--笛卡尔积 a表的每一行 

/*省略了inner join 这样执行结果也是inner join */
select * from emp,dept where emp.code=dept.code; 

/*查询和林书豪同部门的其他人*/      

select a.gonghao,b.dept_name,a.* from emp a left join dept b on a.code=b.code where a.code=(select z.code from emp z where z.name='林书豪') order by a.gonghao 

       
