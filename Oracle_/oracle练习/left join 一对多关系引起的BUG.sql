--DROP TABLE IF EXISTS  t_product ;
CREATE TABLE t_product (
  product_id  char(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  pro_name  varchar(64) DEFAULT NULL COMMENT '商品名称',
  cash  double(10,2) DEFAULT '0.00' COMMENT '商品价格',
  pro_code  varchar(32) DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY ( product_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

INSERT INTO  t_product  ( product_id ,  pro_name ,  cash ,  pro_code )
VALUES
    ('1','小米',888.00,'001'),
    ('2','华为',1888.00,'002');



DROP TABLE IF EXISTS  t_order ;
CREATE TABLE  t_order  (
   order_id  char(32) NOT NULL DEFAULT '' COMMENT '主键ID',
   product_id  char(32) DEFAULT NULL COMMENT '商品ID',
   sale_amount  double(16,2) DEFAULT '0.00' COMMENT '订单金额',
   order_number  varchar(40) DEFAULT NULL COMMENT '订单编码',
   status  int(2) DEFAULT '1' COMMENT '订单状态 0订单无效1兑换功成2、已发货',
  PRIMARY KEY ( order_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

INSERT INTO  t_order  ( order_id ,  product_id ,  sale_amount ,  order_number ,  status )
VALUES
    ('1','1',888.00,'001001',1),
    ('2','2',1888.00,'001002',1);
    
    
DROP TABLE IF EXISTS  t_logistics ;
CREATE TABLE  t_logistics  (
   logistics_id  char(32) NOT NULL DEFAULT '' COMMENT '主键ID',
   order_id  char(32) DEFAULT NULL COMMENT '订单ID',
   logistics_company_name  varchar(32) DEFAULT NULL COMMENT '物流公司名称',
   courier_number  varchar(32) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY ( logistics_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流信息表';

INSERT INTO  t_logistics  ( logistics_id ,  order_id ,  logistics_company_name ,  courier_number )
VALUES
    ('1','1','顺丰','001'),
    ('2','1','顺丰','002');
    ('3','2','中通','003');
    
select o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id ;

select o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id  group by o. order_id ;

select distinct o. order_id ,o. sale_amount ,l. logistics_company_name  from t_order o left join t_logistics l on o. order_id =l. order_id ;
