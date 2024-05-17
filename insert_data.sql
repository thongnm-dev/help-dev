insert into public.t_prm(prm_order,prm_cd,prm_id,prm_name,prm_value) values 
    (1,'OPTION_SETTING','1',null,'Số liên tiếp')
  , (2,'OPTION_SETTING','2',null,'Trị cố định')
  , (3,'OPTION_SETTING','3',null,'Random')
  , (4,'OPTION_SETTING','4',null,'Phạm Vi')
  , (1,'OPTION_RANDOM','1',null,'Alpha')
  , (2,'OPTION_RANDOM','2',null,'Numeric')
  , (3,'OPTION_RANDOM','3',null,'AlphaNumeric')
  , (1,'OPTION_SQL','1',null,'SELECT')
  , (2,'OPTION_SQL','2',null,'INSERT')
  , (3,'OPTION_SQL','3',null,'UPDATE')
  , (4,'OPTION_SQL','4',null,'DELETE')
  , (5,'OPTION_SQL','5',null,'COUNT')
  , (1,'OPTION_TARGET','0',null,'Excel')
  , (2,'OPTION_TARGET','1',null,'DDL');

insert into public.t_connection(db_host,db_pass,db_port,db_schema,db_target,db_usr,project_id) values 
    ('jdbc:postgresql://localhost:5432/ESS','mowner01','5432','essnewmoela','ESS','mowner01',1);
