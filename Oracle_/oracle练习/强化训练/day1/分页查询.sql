--�磺���ַ�ʽ����ѯ��ʱ�򽫲鲻������
select e2.*,rownum from (select e.* from emp e where rownum between 2 and 10) e2 where rownum <=5;
 
select * from emp where rownum<=10;

select * from emp where rownum between 0 and 10;

--�ȽϷ���ѯ����ѯroenumǰ10������
select e.*,rownum rn from(select * from emp)e where rownum<=10;
--�����ѯcase1:��ѯrownum��[5,10]������
--select e.*,rownum rn from(select * from emp)e where rn between 5 and 6;  --������ִ�в��������ĳ���������
select e.* from(select z.*,rownum rn from emp z)e where e.rn between 5 and 10;
--�����ѯcase2:��ѯrownum��[2,6]������
/*select * from 
 (select e.*,rownum rn from(select * from emp)e where rownum<=10) 
 where rn>=5;   --������ִ�в����� �ĳ�����������*/

select * from 
 (select e.* from(select emp.*,rownum rn from emp)e where e.rn<=10) 
 where rn>=5; 
/* 
˵����ע�������ѯ�����ָ�ʽ������rownum��һ��sql�����ֻ��ʹ��һ�Σ�
���Բ���ʹ��where rownum<=10 and rownum>=5������case1������ʹ��between and ����ʾ��
����case2�У��൱�����η�ҳ���������ǲ�ѯ��rownum<=10�����ݣ��ǵ�һ�η�ҳ��
Ȼ���ٰ���Щ������Ϊ�ڶ��η�ҳ���Ӳ�ѯ���ڶ��η�ҳ���ǽ�rn>=5�����յõ�[5,10]֮��ķ�ҳ���ݡ�
ps�������ѯ��case1��ʽ�����ˣ�����ѯ�ٶ�ȴ����case2�����η�ҳ��ѯ�ٶȡ�
ע��1����������Ĳ�ѯ�����ǲ�ѯ�����ֶ���Ϣ��select *��ѯ������case2ֻ��Ҫ��ѯ�����ֶΣ�
��ֻ��Ҫ��ѯԱ������ename��Ա��н��sal������ֻ��Ҫ�޸������Ĳ�ѯ���ɣ�
*/

--��ѯrownumΪ[5,10]��Ա�������͹���
--��ҳ��ʽ1 
select e.* from (   select z.name,z.sal,rownum rn from emp z ) e where e.rn between 5 and 10;  --��ʱ0.136��
--��ҳ��ʽ2
select *
  from (select *
          from (select z.name, z.sal, rownum rn from emp z) e1
         where e1.rn <= 10) e2
 where e2.rn >= 5; --��ʱ0.059��
