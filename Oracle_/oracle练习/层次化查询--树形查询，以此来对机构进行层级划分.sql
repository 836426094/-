--��λ���ѯ
select * from emp t;
/*
a:level��һ��α�У������������㼶�ּ���level�����ƿ�����������
b��connect by prior Ա����=�����     �ּ�����
c:start with mgr is null �Ӿ����Ϊ�յ�Ա����ʼ����ȻҲ���ԴӶ�����ʼ����start with mgr=5;
d:order by 1  �Բ㼶��������
*/

select level,gonghao,name ,mgr from emp connect by prior gonghao=mgr start with mgr is null order by 1;

select level,gonghao,name ,mgr from emp connect by prior gonghao=mgr start with mgr=5 --order by 1; 
