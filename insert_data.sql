insert into public.t_prm(id,prm_order,prm_cd,prm_id,prm_value) values
    (1,1,'OPTION_SETTING','0','Logical')
  , (2,2,'OPTION_SETTING','1','Số liên tiếp')
  , (3,2,'OPTION_SETTING','2','Trị cố định')
  , (4,3,'OPTION_SETTING','3','Random')
  , (5,4,'OPTION_SETTING','4','Phạm Vi')
  , (6,1,'OPTION_RANDOM','1','Alpha')
  , (7,2,'OPTION_RANDOM','2','Numeric')
  , (8,3,'OPTION_RANDOM','3','AlphaNumeric')
  , (9,4,'OPTION_RANDOM','4','Fullsize')
  , (10,1,'OPTION_TARGET','0','Excel')
  , (11,2,'OPTION_TARGET','1','DDL')
  , (12,1,'OPTION_MST_DATA','0','File')
  , (13,2,'OPTION_MST_DATA','1','Database');

insert into public.t_project(project_cd,project_descript,project_name) values 
    ('ESS','ESS','ESS');

insert into public.t_connection(db_url,db_schema,db_pass,db_usr,project_id) values
    ('jdbc:postgresql://localhost:5432/ESS','essnewmoela','mowner01','mowner01',1);

insert into public.t_setting(project_id,setting_json,setting_type) values 
    (1,'{"tr_pg": "BATCH", "tr_usr": "SYSTEM", "upd_pg": "BATCH", "upd_usr": "SYSTEM", "gymev_name": "SYSTEM", "tr_ymd_time": "2495/09/01 12:45:49", "upd_ymd_time": "2495/09/01 12:45:49"}','HISTORY')
  , (1,'{"table_name":"kukm_hnyif","table_logical":"【共通】汎用情報","columns":[{"rowNum":1,"headerText":"汎用識別コード","property":"hny_skb_cd","display":true,"align":"center"},{"rowNum":2,"headerText":"汎用識別名称","property":"hny_skb_name","display":false,"align":"left"},{"rowNum":3,"headerText":"汎用コード値","property":"hny_cdt","display":true,"align":"center"},{"rowNum":4,"headerText":"汎用識別編集制御区分","property":"hny_skb_hssg_kbn","display":false,"align":"left"},{"rowNum":5,"headerText":"汎用情報1","property":"hnyif_1","display":true,"align":"left"},{"rowNum":6,"headerText":"汎用情報2","property":"hnyif_2","display":true,"align":"left"},{"rowNum":7,"headerText":"汎用情報3","property":"hnyif_3","display":true,"align":"left"},{"rowNum":8,"headerText":"汎用情報4","property":"hnyif_4","display":true,"align":"left"},{"rowNum":9,"headerText":"汎用情報5","property":"hnyif_5","display":true,"align":"left"},{"rowNum":10,"headerText":"並替順序","property":"nkord","display":false,"align":"left"},{"rowNum":11,"headerText":"使用区分","property":"syu_kbn","display":true,"align":"left"}]}','TABLE_MST');
