--DROP TABLE IF EXISTS  t_product ;
CREATE TABLE t_product (
  product_id  char(32) NOT NULL DEFAULT '' COMMENT '����ID',
  pro_name  varchar(64) DEFAULT NULL COMMENT '��Ʒ����',
  cash  double(10,2) DEFAULT '0.00' COMMENT '��Ʒ�۸�',
  pro_code  varchar(32) DEFAULT NULL COMMENT '��Ʒ���',
  PRIMARY KEY ( product_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';

INSERT INTO  t_product  ( product_id ,  pro_name ,  cash ,  pro_code )
VALUES
    ('1','С��',888.00,'001'),
    ('2','��Ϊ',1888.00,'002');



DROP TABLE IF EXISTS  t_order ;
CREATE TABLE  t_order  (
   order_id  char(32) NOT NULL DEFAULT '' COMMENT '����ID',
   product_id  char(32) DEFAULT NULL COMMENT '��ƷID',
   sale_amount  double(16,2) DEFAULT '0.00' COMMENT '�������',
   order_number  varchar(40) DEFAULT NULL COMMENT '��������',
   status  int(2) DEFAULT '1' COMMENT '����״̬ 0������Ч1�һ�����2���ѷ���',
  PRIMARY KEY ( order_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

INSERT INTO  t_order  ( order_id ,  product_id ,  sale_amount ,  order_number ,  status )
VALUES
    ('1','1',888.00,'001001',1),
    ('2','2',1888.00,'001002',1);
    
    
DROP TABLE IF EXISTS  t_logistics ;
CREATE TABLE  t_logistics  (
   logistics_id  char(32) NOT NULL DEFAULT '' COMMENT '����ID',
   order_id  char(32) DEFAULT NULL COMMENT '����ID',
   logistics_company_name  varchar(32) DEFAULT NULL COMMENT '������˾����',
   courier_number  varchar(32) DEFAULT NULL COMMENT '��ݵ���',
  PRIMARY KEY ( logistics_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ��';

INSERT INTO  t_logistics  ( logistics_id ,  order_id ,  logistics_company_name ,  courier_number )
VALUES
    ('1','1','˳��','001'),
    ('2','1','˳��','002');
    ('3','2','��ͨ','003');
    
select o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id ;

select o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id  group by o. order_id ;

select distinct o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id ;
