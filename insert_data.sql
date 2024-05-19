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



insert into public.t_connection(db_url,db_schema,db_pass,db_usr,project_id) values
    ('jdbc:postgresql://localhost:5432/ESS','essnewmoela','mowner01','mowner01',1);

insert into public.t_setting(id,project_id,setting_json,setting_type) values
    (1,1,'{"tr_pg": "BATCH", "tr_usr": "SYSTEM", "upd_pg": "BATCH", "upd_usr": "SYSTEM", "gymev_name": "SYSTEM", "tr_ymd_time": "2495/09/01 12:45:49", "upd_ymd_time": "2495/09/01 12:45:49"}','HISTORY')
  , (2,1,'{"columns": {"nkord": "並替順序", "hny_cdt": "汎用コード値", "hnyif_1": "汎用情報1", "hnyif_2": "汎用情報2", "hnyif_3": "汎用情報3", "hnyif_4": "汎用情報4", "hnyif_5": "汎用情報5", "syu_kbn": "使用区分", "hny_skb_cd": "汎用識別コード", "hny_skb_name": "汎用識別名称", "hny_skb_hssg_kbn": "汎用識別編集制御区分"}, "table_name": "kukm_hnyif", "table_logical": "【共通】汎用情報"}','TABLE_MST');
