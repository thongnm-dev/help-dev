-- drop table if exists essnewmoela.kukm_ara;
create table /*if not exists*/ essnewmoela.kukm_ara
(
    ara_cd varchar(4) not null
   ,ara_tykis_ymd date not null
   ,ara_tysr_ymd date not null
   ,ara_name varchar(30) not null
   ,ikbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ara_pk primary key
   (
        ara_cd
       ,ara_tykis_ymd
    )
);
comment on table essnewmoela.kukm_ara is '【共通】エリア';
comment on column essnewmoela.kukm_ara.ara_cd is 'エリアコード';
comment on column essnewmoela.kukm_ara.ara_tykis_ymd is 'エリア適用開始年月日';
comment on column essnewmoela.kukm_ara.ara_tysr_ymd is 'エリア適用終了年月日';
comment on column essnewmoela.kukm_ara.ara_name is 'エリア名称';
comment on column essnewmoela.kukm_ara.ikbn is '域区分';
comment on column essnewmoela.kukm_ara.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ara.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ara.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ara.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ara.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ara.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ara.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ara_kijs;
create table /*if not exists*/ essnewmoela.kukm_ara_kijs
(
    ara_cd varchar(4) not null
   ,ara_tykis_ymd date not null
   ,ara_tysr_ymd date not null
   ,ybno_st5k varchar(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ara_kijs_pk primary key
   (
        ara_cd
       ,ara_tykis_ymd
       ,ybno_st5k
    )
);
comment on table essnewmoela.kukm_ara_kijs is '【共通】エリア.区域住所';
comment on column essnewmoela.kukm_ara_kijs.ara_cd is 'エリアコード';
comment on column essnewmoela.kukm_ara_kijs.ara_tykis_ymd is 'エリア適用開始年月日';
comment on column essnewmoela.kukm_ara_kijs.ara_tysr_ymd is 'エリア適用終了年月日';
comment on column essnewmoela.kukm_ara_kijs.ybno_st5k is '郵便番号先頭5桁';
comment on column essnewmoela.kukm_ara_kijs.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ara_kijs.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ara_kijs.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ara_kijs.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ara_kijs.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ara_kijs.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ara_kijs.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_clnd;
create table /*if not exists*/ essnewmoela.kukm_clnd
(
    clnd_cd varchar(3) not null
   ,clnd_gt_ymd date not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_clnd_pk primary key
   (
        clnd_cd
       ,clnd_gt_ymd
    )
);
comment on table essnewmoela.kukm_clnd is '【共通】カレンダー';
comment on column essnewmoela.kukm_clnd.clnd_cd is 'カレンダーコード';
comment on column essnewmoela.kukm_clnd.clnd_gt_ymd is 'カレンダー該当年月日';
comment on column essnewmoela.kukm_clnd.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_clnd.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_clnd.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_clnd.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_clnd.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_clnd.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_clnd.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_crdks;
create table /*if not exists*/ essnewmoela.kukm_crdks
(
    crdks_cd varchar(5) not null
   ,hksy_sbno_strt varchar(6) not null
   ,hksy_sbno_end varchar(6) not null
   ,crdks_name varchar(20) not null
   ,kmit_no varchar(15) not null
   ,kmit_name varchar(20) not null
   ,clnd_cd varchar(3) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_crdks_pk primary key
   (
        crdks_cd
       ,hksy_sbno_strt
    )
);
comment on table essnewmoela.kukm_crdks is '【共通】クレジット会社';
comment on column essnewmoela.kukm_crdks.crdks_cd is 'クレジット会社コード';
comment on column essnewmoela.kukm_crdks.hksy_sbno_strt is '発行者識別番号開始';
comment on column essnewmoela.kukm_crdks.hksy_sbno_end is '発行者識別番号終了';
comment on column essnewmoela.kukm_crdks.crdks_name is 'クレジット会社名称';
comment on column essnewmoela.kukm_crdks.kmit_no is '加盟店番号';
comment on column essnewmoela.kukm_crdks.kmit_name is '加盟店名称';
comment on column essnewmoela.kukm_crdks.clnd_cd is 'カレンダーコード';
comment on column essnewmoela.kukm_crdks.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_crdks.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_crdks.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_crdks.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_crdks.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_crdks.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_crdks.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_hbkr_dtl;
create table /*if not exists*/ essnewmoela.kukm_hbkr_dtl
(
    hbkry_kiki_syb varchar(1) not null
   ,hbkr_htbh_kbn varchar(1) not null
   ,mk_hjkk_kbn varchar(1) not null
   ,hbkr_hisno numeric(5) not null
   ,srkku_wa_eno numeric(5) not null
   ,hbrk_cd varchar(3) not null
   ,hbkr_syb varchar(1) not null
   ,hbkr numeric(3) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_hbkr_dtl_pk primary key
   (
        hbkry_kiki_syb
       ,hbkr_htbh_kbn
       ,mk_hjkk_kbn
       ,hbkr_hisno
       ,srkku_wa_eno
       ,hbrk_cd
    )
);
comment on table essnewmoela.kukm_hbkr_dtl is '【共通】販売掛率DTL';
comment on column essnewmoela.kukm_hbkr_dtl.hbkry_kiki_syb is '販売掛率用機器種別';
comment on column essnewmoela.kukm_hbkr_dtl.hbkr_htbh_kbn is '販売掛率本体部品区分';
comment on column essnewmoela.kukm_hbkr_dtl.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_hbkr_dtl.hbkr_hisno is '販売掛率履歴番号';
comment on column essnewmoela.kukm_hbkr_dtl.srkku_wa_eno is '仕入価格割合枝番';
comment on column essnewmoela.kukm_hbkr_dtl.hbrk_cd is '販売ランクコード';
comment on column essnewmoela.kukm_hbkr_dtl.hbkr_syb is '販売掛率種別';
comment on column essnewmoela.kukm_hbkr_dtl.hbkr is '販売掛率';
comment on column essnewmoela.kukm_hbkr_dtl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_hbkr_dtl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_hbkr_dtl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_hbkr_dtl.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_hbkr_dtl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_hbkr_dtl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_hbkr_dtl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_hbkr_hdr;
create table /*if not exists*/ essnewmoela.kukm_hbkr_hdr
(
    hbkry_kiki_syb varchar(1) not null
   ,hbkr_htbh_kbn varchar(1) not null
   ,mk_hjkk_kbn varchar(1) not null
   ,hbkr_hisno numeric(5) not null
   ,hbkr_tykis_ymd date not null
   ,hbkr_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_hbkr_hdr_pk primary key
   (
        hbkry_kiki_syb
       ,hbkr_htbh_kbn
       ,mk_hjkk_kbn
       ,hbkr_hisno
    )
);
comment on table essnewmoela.kukm_hbkr_hdr is '【共通】販売掛率HDR';
comment on column essnewmoela.kukm_hbkr_hdr.hbkry_kiki_syb is '販売掛率用機器種別';
comment on column essnewmoela.kukm_hbkr_hdr.hbkr_htbh_kbn is '販売掛率本体部品区分';
comment on column essnewmoela.kukm_hbkr_hdr.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_hbkr_hdr.hbkr_hisno is '販売掛率履歴番号';
comment on column essnewmoela.kukm_hbkr_hdr.hbkr_tykis_ymd is '販売掛率適用開始年月日';
comment on column essnewmoela.kukm_hbkr_hdr.hbkr_tysr_ymd is '販売掛率適用終了年月日';
comment on column essnewmoela.kukm_hbkr_hdr.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_hbkr_hdr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_hbkr_hdr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_hbkr_hdr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_hbkr_hdr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_hbkr_hdr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_hbkr_hdr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_hbkr_hdr.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_hbkr_hdr_ix1;
create index /*if not exists*/ kukm_hbkr_hdr_ix1 on essnewmoela.kukm_hbkr_hdr using btree
(
    dtjt_kbn
   ,hbkr_tykis_ymd
   ,hbkr_tysr_ymd
   ,hbkry_kiki_syb
   ,hbkr_htbh_kbn
   ,mk_hjkk_kbn
   ,hbkr_hisno
);
-- drop table if exists essnewmoela.kukm_hbkr_srkku_wa_dtl;
create table /*if not exists*/ essnewmoela.kukm_hbkr_srkku_wa_dtl
(
    hbkry_kiki_syb varchar(1) not null
   ,hbkr_htbh_kbn varchar(1) not null
   ,mk_hjkk_kbn varchar(1) not null
   ,hbkr_hisno numeric(5) not null
   ,srkku_wa_eno numeric(5) not null
   ,hi_strt_srkku_wa numeric(3) not null
   ,hi_end_srkku_wa numeric(3) not null
   ,hbkr_syb varchar(1) not null
   ,hbkr numeric(3) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_hbkr_srkku_wa_dtl_pk primary key
   (
        hbkry_kiki_syb
       ,hbkr_htbh_kbn
       ,mk_hjkk_kbn
       ,hbkr_hisno
       ,srkku_wa_eno
    )
);
comment on table essnewmoela.kukm_hbkr_srkku_wa_dtl is '【共通】販売掛率仕入価格割合DTL';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hbkry_kiki_syb is '販売掛率用機器種別';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hbkr_htbh_kbn is '販売掛率本体部品区分';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hbkr_hisno is '販売掛率履歴番号';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.srkku_wa_eno is '仕入価格割合枝番';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hi_strt_srkku_wa is '範囲開始仕入価格割合';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hi_end_srkku_wa is '範囲終了仕入価格割合';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hbkr_syb is '販売掛率種別';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.hbkr is '販売掛率';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_hbkr_srkku_wa_dtl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_hnyif;
create table /*if not exists*/ essnewmoela.kukm_hnyif
(
    hny_skb_cd varchar(3) not null
   ,hny_skb_name varchar(40) not null
   ,hny_cdt varchar(10) not null
   ,hny_skb_hssg_kbn varchar(1) not null
   ,hnyif_1 varchar(200) not null
   ,hnyif_2 varchar(200)
   ,hnyif_3 varchar(200)
   ,hnyif_4 varchar(200)
   ,hnyif_5 varchar(200)
   ,nkord numeric(5)
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_hnyif_pk primary key
   (
        hny_skb_cd
       ,hny_cdt
    )
);
comment on table essnewmoela.kukm_hnyif is '【共通】汎用情報';
comment on column essnewmoela.kukm_hnyif.hny_skb_cd is '汎用識別コード';
comment on column essnewmoela.kukm_hnyif.hny_skb_name is '汎用識別名称';
comment on column essnewmoela.kukm_hnyif.hny_cdt is '汎用コード値';
comment on column essnewmoela.kukm_hnyif.hny_skb_hssg_kbn is '汎用識別編集制御区分';
comment on column essnewmoela.kukm_hnyif.hnyif_1 is '汎用情報1';
comment on column essnewmoela.kukm_hnyif.hnyif_2 is '汎用情報2';
comment on column essnewmoela.kukm_hnyif.hnyif_3 is '汎用情報3';
comment on column essnewmoela.kukm_hnyif.hnyif_4 is '汎用情報4';
comment on column essnewmoela.kukm_hnyif.hnyif_5 is '汎用情報5';
comment on column essnewmoela.kukm_hnyif.nkord is '並替順序';
comment on column essnewmoela.kukm_hnyif.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_hnyif.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_hnyif.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_hnyif.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_hnyif.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_hnyif.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_hnyif.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_hnyif.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_kiki;
create table /*if not exists*/ essnewmoela.kukm_kiki
(
    kiki_cd varchar(2) not null
   ,kiki_name varchar(20) not null
   ,lspln_syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kiki_pk primary key
   (
        kiki_cd
    )
);
comment on table essnewmoela.kukm_kiki is '【共通】機器';
comment on column essnewmoela.kukm_kiki.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_kiki.kiki_name is '機器名称';
comment on column essnewmoela.kukm_kiki.lspln_syu_kbn is 'リースプラン使用区分';
comment on column essnewmoela.kukm_kiki.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kiki.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kiki.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kiki.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kiki.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kiki.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kiki.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_kjkm;
create table /*if not exists*/ essnewmoela.kukm_kjkm
(
    kjkm_cd varchar(9) not null
   ,km_name varchar(60) not null
   ,kjkm_syb varchar(1) not null
   ,syu_kbn varchar(1) not null
   ,km_cd_1 varchar(5) not null
   ,km_cd_2 varchar(5)
   ,km_cd_3 varchar(5)
   ,kmuw_yh varchar(1)
   ,ths_yh varchar(1) not null
   ,sj_ymd date
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kjkm_pk primary key
   (
        kjkm_cd
    )
);
comment on table essnewmoela.kukm_kjkm is '【共通】勘定科目';
comment on column essnewmoela.kukm_kjkm.kjkm_cd is '勘定科目コード';
comment on column essnewmoela.kukm_kjkm.km_name is '科目名称';
comment on column essnewmoela.kukm_kjkm.kjkm_syb is '勘定科目種別';
comment on column essnewmoela.kukm_kjkm.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_kjkm.km_cd_1 is '科目コード1';
comment on column essnewmoela.kukm_kjkm.km_cd_2 is '科目コード2';
comment on column essnewmoela.kukm_kjkm.km_cd_3 is '科目コード3';
comment on column essnewmoela.kukm_kjkm.kmuw_yh is '科目内訳要否';
comment on column essnewmoela.kukm_kjkm.ths_yh is '取引先要否';
comment on column essnewmoela.kukm_kjkm.sj_ymd is '削除年月日';
comment on column essnewmoela.kukm_kjkm.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kjkm.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kjkm.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kjkm.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kjkm.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kjkm.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kjkm.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_kkss;
create table /*if not exists*/ essnewmoela.kukm_kkss
(
    kkss_cd varchar(10) not null
   ,kkss_name varchar(60) not null
   ,hksk_syu_flg varchar(1) not null
   ,snsk_syu_flg varchar(1) not null
   ,syu_kbn varchar(1) not null
   ,sj_ymd date
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kkss_pk primary key
   (
        kkss_cd
    )
);
comment on table essnewmoela.kukm_kkss is '【共通】会計組織';
comment on column essnewmoela.kukm_kkss.kkss_cd is '会計組織コード';
comment on column essnewmoela.kukm_kkss.kkss_name is '会計組織名称';
comment on column essnewmoela.kukm_kkss.hksk_syu_flg is '発行組織使用フラグ';
comment on column essnewmoela.kukm_kkss.snsk_syu_flg is '責任組織使用フラグ';
comment on column essnewmoela.kukm_kkss.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_kkss.sj_ymd is '削除年月日';
comment on column essnewmoela.kukm_kkss.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kkss.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kkss.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kkss.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kkss.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kkss.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kkss.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ks;
create table /*if not exists*/ essnewmoela.kukm_ks
(
    ks_cd varchar(5) not null
   ,ks_tykis_ymd date not null
   ,ks_tysr_ymd date not null
   ,ks_name varchar(30) not null
   ,ks_telno varchar(20) not null
   ,ks_faxno varchar(20) not null
   ,tksks_hkjgs_trno varchar(15) not null
   ,ybno varchar(7)
   ,ybno_eno numeric(5)
   ,ybe_hisno numeric(5)
   ,ksjs_btn varchar(50)
   ,ksjs_tm_name varchar(30)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ks_pk primary key
   (
        ks_cd
       ,ks_tykis_ymd
    )
);
comment on table essnewmoela.kukm_ks is '【共通】会社';
comment on column essnewmoela.kukm_ks.ks_cd is '会社コード';
comment on column essnewmoela.kukm_ks.ks_tykis_ymd is '会社適用開始年月日';
comment on column essnewmoela.kukm_ks.ks_tysr_ymd is '会社適用終了年月日';
comment on column essnewmoela.kukm_ks.ks_name is '会社名称';
comment on column essnewmoela.kukm_ks.ks_telno is '会社電話番号';
comment on column essnewmoela.kukm_ks.ks_faxno is '会社FAX番号';
comment on column essnewmoela.kukm_ks.tksks_hkjgs_trno is '適格請求書発行事業者登録番号';
comment on column essnewmoela.kukm_ks.ybno is '郵便番号';
comment on column essnewmoela.kukm_ks.ybno_eno is '郵便番号枝番';
comment on column essnewmoela.kukm_ks.ybe_hisno is '郵便枝履歴番号';
comment on column essnewmoela.kukm_ks.ksjs_btn is '会社住所番地など';
comment on column essnewmoela.kukm_ks.ksjs_tm_name is '会社住所建物名称';
comment on column essnewmoela.kukm_ks.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ks.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ks.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ks.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ks.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ks.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ks.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ktks;
create table /*if not exists*/ essnewmoela.kukm_ktks
(
    ktks_cd varchar(5) not null
   ,ktks_name_kn varchar(40) not null
   ,ktks_name varchar(20) not null
   ,ktks_kbn varchar(1) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ktks_pk primary key
   (
        ktks_cd
    )
);
comment on table essnewmoela.kukm_ktks is '【共通】建築会社';
comment on column essnewmoela.kukm_ktks.ktks_cd is '建築会社コード';
comment on column essnewmoela.kukm_ktks.ktks_name_kn is '建築会社名称カナ';
comment on column essnewmoela.kukm_ktks.ktks_name is '建築会社名称';
comment on column essnewmoela.kukm_ktks.ktks_kbn is '建築会社区分';
comment on column essnewmoela.kukm_ktks.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_ktks.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ktks.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ktks.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ktks.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ktks.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ktks.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ktks.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_kykk;
create table /*if not exists*/ essnewmoela.kukm_kykk
(
    kykk_cd varchar(4) not null
   ,kykk_hisno numeric(5) not null
   ,dtjt_kbn varchar(1) not null
   ,kykk_name_kn varchar(15) not null
   ,kykk_name varchar(20) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kykk_pk primary key
   (
        kykk_cd
       ,kykk_hisno
    )
);
comment on table essnewmoela.kukm_kykk is '【共通】金融機関';
comment on column essnewmoela.kukm_kykk.kykk_cd is '金融機関コード';
comment on column essnewmoela.kukm_kykk.kykk_hisno is '金融機関履歴番号';
comment on column essnewmoela.kukm_kykk.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_kykk.kykk_name_kn is '金融機関名称カナ';
comment on column essnewmoela.kukm_kykk.kykk_name is '金融機関名称';
comment on column essnewmoela.kukm_kykk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kykk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kykk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kykk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kykk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kykk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kykk.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_kykk_ix1;
create index /*if not exists*/ kukm_kykk_ix1 on essnewmoela.kukm_kykk using btree
(
    dtjt_kbn
   ,kykk_cd
   ,kykk_hisno
);
-- drop table if exists essnewmoela.kukm_kykk_rkdtk;
create table /*if not exists*/ essnewmoela.kukm_kykk_rkdtk
(
    kykk_rk_cd varchar(7) not null
   ,kykk_name varchar(20) not null
   ,kykk_name_kn varchar(15) not null
   ,kykk_stn_name varchar(20) not null
   ,kykk_stn_name_kn varchar(15) not null
   ,trz_kbn varchar(1)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kykk_rkdtk_pk primary key
   (
        kykk_rk_cd
       ,kykk_name
       ,kykk_name_kn
       ,kykk_stn_name
       ,kykk_stn_name_kn
    )
);
comment on table essnewmoela.kukm_kykk_rkdtk is '【共通】金融機関連係データ取込';
comment on column essnewmoela.kukm_kykk_rkdtk.kykk_rk_cd is '金融機関連係コード';
comment on column essnewmoela.kukm_kykk_rkdtk.kykk_name is '金融機関名称';
comment on column essnewmoela.kukm_kykk_rkdtk.kykk_name_kn is '金融機関名称カナ';
comment on column essnewmoela.kukm_kykk_rkdtk.kykk_stn_name is '金融機関支店名称';
comment on column essnewmoela.kukm_kykk_rkdtk.kykk_stn_name_kn is '金融機関支店名称カナ';
comment on column essnewmoela.kukm_kykk_rkdtk.trz_kbn is '登録済区分';
comment on column essnewmoela.kukm_kykk_rkdtk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kykk_rkdtk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kykk_rkdtk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kykk_rkdtk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kykk_rkdtk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kykk_rkdtk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kykk_rkdtk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_kykk_stn;
create table /*if not exists*/ essnewmoela.kukm_kykk_stn
(
    kykk_cd varchar(4) not null
   ,kykk_hisno numeric(5) not null
   ,kykk_stn_cd varchar(3) not null
   ,kykk_stn_hisno numeric(5) not null
   ,dtjt_kbn varchar(1) not null
   ,kykk_stn_name_kn varchar(15) not null
   ,kykk_stn_name varchar(20) not null
   ,gm_tr_flg varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_kykk_stn_pk primary key
   (
        kykk_cd
       ,kykk_hisno
       ,kykk_stn_cd
       ,kykk_stn_hisno
    )
);
comment on table essnewmoela.kukm_kykk_stn is '【共通】金融機関支店';
comment on column essnewmoela.kukm_kykk_stn.kykk_cd is '金融機関コード';
comment on column essnewmoela.kukm_kykk_stn.kykk_hisno is '金融機関履歴番号';
comment on column essnewmoela.kukm_kykk_stn.kykk_stn_cd is '金融機関支店コード';
comment on column essnewmoela.kukm_kykk_stn.kykk_stn_hisno is '金融機関支店履歴番号';
comment on column essnewmoela.kukm_kykk_stn.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_kykk_stn.kykk_stn_name_kn is '金融機関支店名称カナ';
comment on column essnewmoela.kukm_kykk_stn.kykk_stn_name is '金融機関支店名称';
comment on column essnewmoela.kukm_kykk_stn.gm_tr_flg is '画面登録フラグ';
comment on column essnewmoela.kukm_kykk_stn.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_kykk_stn.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_kykk_stn.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_kykk_stn.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_kykk_stn.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_kykk_stn.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_kykk_stn.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_kykk_stn_ix1;
create index /*if not exists*/ kukm_kykk_stn_ix1 on essnewmoela.kukm_kykk_stn using btree
(
    dtjt_kbn
   ,kykk_cd
   ,kykk_hisno
   ,kykk_stn_cd
   ,kykk_stn_hisno
);
-- drop table if exists essnewmoela.kukm_lstp;
create table /*if not exists*/ essnewmoela.kukm_lstp
(
    lstp_cd varchar(10) not null
   ,lstp_hisno numeric(5) not null
   ,lstp_tykis_ymd date not null
   ,lstp_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,kiki_cd varchar(2) not null
   ,lstp_name varchar(60) not null
   ,lstp_kts varchar(60) not null
   ,lstp_ksry varchar(50)
   ,lstp_bko varchar(50)
   ,syu_kbn varchar(1) not null
   ,sj_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_pk primary key
   (
        lstp_cd
       ,lstp_hisno
    )
);
comment on table essnewmoela.kukm_lstp is '【共通】リースタイプ';
comment on column essnewmoela.kukm_lstp.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp.lstp_hisno is 'リースタイプ履歴番号';
comment on column essnewmoela.kukm_lstp.lstp_tykis_ymd is 'リースタイプ適用開始年月日';
comment on column essnewmoela.kukm_lstp.lstp_tysr_ymd is 'リースタイプ適用終了年月日';
comment on column essnewmoela.kukm_lstp.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_lstp.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_lstp.lstp_name is 'リースタイプ名称';
comment on column essnewmoela.kukm_lstp.lstp_kts is 'リースタイプ型式';
comment on column essnewmoela.kukm_lstp.lstp_ksry is 'リースタイプ更新理由';
comment on column essnewmoela.kukm_lstp.lstp_bko is 'リースタイプ備考';
comment on column essnewmoela.kukm_lstp.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_lstp.sj_kbn is '削除区分';
comment on column essnewmoela.kukm_lstp.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_lstp_ix1;
create index /*if not exists*/ kukm_lstp_ix1 on essnewmoela.kukm_lstp using btree
(
    dtjt_kbn
   ,lstp_tykis_ymd
   ,lstp_tysr_ymd
   ,lstp_cd
   ,lstp_hisno
);
-- drop table if exists essnewmoela.kukm_lstp_bzlst_tpsr;
create table /*if not exists*/ essnewmoela.kukm_lstp_bzlst_tpsr
(
    lstp_cd varchar(10) not null
   ,lstp_hisno numeric(5) not null
   ,bzlst_tpsr_eno numeric(5) not null
   ,hkfle_id varchar(10) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_bzlst_tpsr_pk primary key
   (
        lstp_cd
       ,lstp_hisno
       ,bzlst_tpsr_eno
    )
);
comment on table essnewmoela.kukm_lstp_bzlst_tpsr is '【共通】リースタイプ.部材リスト添付資料';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.lstp_hisno is 'リースタイプ履歴番号';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.bzlst_tpsr_eno is '部材リスト添付資料枝番';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.hkfle_id is '保管ファイルID';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_bzlst_tpsr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_htbh_syh;
create table /*if not exists*/ essnewmoela.kukm_lstp_htbh_syh
(
    lstp_cd varchar(10) not null
   ,lstp_hisno numeric(5) not null
   ,syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,lstp_htbh_kbn varchar(1) not null
   ,lstp_syh_hjord numeric(5) not null
   ,lstp_syhsr numeric(2) not null
   ,lstp_syhkb_srtk numeric(14,2)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_htbh_syh_pk primary key
   (
        lstp_cd
       ,lstp_hisno
       ,syh_cd
    )
);
comment on table essnewmoela.kukm_lstp_htbh_syh is '【共通】リースタイプ本体部品商品';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_hisno is 'リースタイプ履歴番号';
comment on column essnewmoela.kukm_lstp_htbh_syh.syh_cd is '商品コード';
comment on column essnewmoela.kukm_lstp_htbh_syh.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_htbh_kbn is 'リースタイプ本体部品区分';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_syh_hjord is 'リースタイプ商品表示順';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_syhsr is 'リースタイプ商品数量';
comment on column essnewmoela.kukm_lstp_htbh_syh.lstp_syhkb_srtk is 'リースタイプ商品個別仕入単価';
comment on column essnewmoela.kukm_lstp_htbh_syh.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_htbh_syh.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_htbh_syh.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_htbh_syh.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_htbh_syh.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_htbh_syh.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_htbh_syh.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_iktr_bh;
create table /*if not exists*/ essnewmoela.kukm_lstp_iktr_bh
(
    lstp_iktr_no varchar(10) not null
   ,lstp_bhms_seq numeric(5) not null
   ,lstp_cd varchar(10) not null
   ,syh_cd varchar(30) not null
   ,lstp_syhkb_srtk numeric(14,2)
   ,lstp_syhsr numeric(2)
   ,lstp_syh_hjord numeric(5)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_iktr_bh_pk primary key
   (
        lstp_iktr_no
       ,lstp_bhms_seq
    )
);
comment on table essnewmoela.kukm_lstp_iktr_bh is '【共通】リースタイプ.一括登録.部品';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_iktr_no is 'リースタイプ一括登録番号';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_bhms_seq is 'リースタイプ部品明細SEQ';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_iktr_bh.syh_cd is '商品コード';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_syhkb_srtk is 'リースタイプ商品個別仕入単価';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_syhsr is 'リースタイプ商品数量';
comment on column essnewmoela.kukm_lstp_iktr_bh.lstp_syh_hjord is 'リースタイプ商品表示順';
comment on column essnewmoela.kukm_lstp_iktr_bh.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_iktr_bh.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_iktr_bh.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_iktr_bh.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_iktr_bh.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_iktr_bh.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_iktr_bh.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_iktr_ht;
create table /*if not exists*/ essnewmoela.kukm_lstp_iktr_ht
(
    lstp_iktr_no varchar(10) not null
   ,lstp_ht_seq numeric(5) not null
   ,lstp_tykis_ymd date not null
   ,lstp_iktr_sri_kbn varchar(1) not null
   ,lstp_cd varchar(10) not null
   ,lstp_name varchar(60) not null
   ,lstp_kts varchar(60) not null
   ,syh_cd varchar(30)
   ,lstp_syhkb_srtk numeric(14,2) not null
   ,jsy_pln varchar(2) not null
   ,lstp_pln_hbkg numeric(12) not null
   ,ua_lsr numeric(6) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_iktr_ht_pk primary key
   (
        lstp_iktr_no
       ,lstp_ht_seq
    )
);
comment on table essnewmoela.kukm_lstp_iktr_ht is '【共通】リースタイプ.一括登録.本体';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_iktr_no is 'リースタイプ一括登録番号';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_ht_seq is 'リースタイプ本体SEQ';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_tykis_ymd is 'リースタイプ適用開始年月日';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_iktr_sri_kbn is 'リースタイプ一括登録処理区分';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_name is 'リースタイプ名称';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_kts is 'リースタイプ型式';
comment on column essnewmoela.kukm_lstp_iktr_ht.syh_cd is '商品コード';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_syhkb_srtk is 'リースタイプ商品個別仕入単価';
comment on column essnewmoela.kukm_lstp_iktr_ht.jsy_pln is '実績用プラン';
comment on column essnewmoela.kukm_lstp_iktr_ht.lstp_pln_hbkg is 'リースタイププラン販売金額';
comment on column essnewmoela.kukm_lstp_iktr_ht.ua_lsr is '売上リース料';
comment on column essnewmoela.kukm_lstp_iktr_ht.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_iktr_ht.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_iktr_ht.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_iktr_ht.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_iktr_ht.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_iktr_ht.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_iktr_ht.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn;
create table /*if not exists*/ essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn
(
    lstp_cd varchar(10) not null
   ,lsrk_irh_ksi_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_lsrk_irh_ksi_kbn_pk primary key
   (
        lstp_cd
    )
);
comment on table essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn is '【共通】リースタイプ.リース料金一覧表掲載区分';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.lsrk_irh_ksi_kbn is 'リース料金一覧表掲載区分';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_lsrk_irh_ksi_kbn.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_pln;
create table /*if not exists*/ essnewmoela.kukm_lstp_pln
(
    lstp_cd varchar(10) not null
   ,lstp_hisno numeric(5) not null
   ,plncd varchar(2) not null
   ,kiki_cd varchar(2) not null
   ,pln_hisno numeric(5) not null
   ,lstp_pln_hbkg numeric(12) not null
   ,lstp_pln_sikg numeric(12) not null
   ,lstp_pln_ar numeric(12) not null
   ,lstp_pln_arr numeric(4,1) not null
   ,lstp_pln_ua_lsr numeric(6) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_pln_pk primary key
   (
        lstp_cd
       ,lstp_hisno
       ,plncd
       ,kiki_cd
    )
);
comment on table essnewmoela.kukm_lstp_pln is '【共通】リースタイププラン';
comment on column essnewmoela.kukm_lstp_pln.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_pln.lstp_hisno is 'リースタイプ履歴番号';
comment on column essnewmoela.kukm_lstp_pln.plncd is 'プランコード';
comment on column essnewmoela.kukm_lstp_pln.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_lstp_pln.pln_hisno is 'プラン履歴番号';
comment on column essnewmoela.kukm_lstp_pln.lstp_pln_hbkg is 'リースタイププラン販売金額';
comment on column essnewmoela.kukm_lstp_pln.lstp_pln_sikg is 'リースタイププラン仕入金額';
comment on column essnewmoela.kukm_lstp_pln.lstp_pln_ar is 'リースタイププラン粗利';
comment on column essnewmoela.kukm_lstp_pln.lstp_pln_arr is 'リースタイププラン粗利率';
comment on column essnewmoela.kukm_lstp_pln.lstp_pln_ua_lsr is 'リースタイププラン売上リース料';
comment on column essnewmoela.kukm_lstp_pln.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_pln.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_pln.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_pln.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_pln.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_pln.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_pln.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_lstp_pln_gkkms;
create table /*if not exists*/ essnewmoela.kukm_lstp_pln_gkkms
(
    lstp_cd varchar(10) not null
   ,lstp_hisno numeric(5) not null
   ,plncd varchar(2) not null
   ,kiki_cd varchar(2) not null
   ,pln_hisno numeric(5) not null
   ,syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,plnls_gkkms_um_kbn varchar(1) not null
   ,lstp_gkkms_hjord numeric(5) not null
   ,lstp_gkkms_sr numeric(2) not null
   ,lstp_gkkms_kb_srtk numeric(14,2)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_lstp_pln_gkkms_pk primary key
   (
        lstp_cd
       ,lstp_hisno
       ,plncd
       ,kiki_cd
       ,syh_cd
    )
);
comment on table essnewmoela.kukm_lstp_pln_gkkms is '【共通】リースタイププラン原価項目商品';
comment on column essnewmoela.kukm_lstp_pln_gkkms.lstp_cd is 'リースタイプコード';
comment on column essnewmoela.kukm_lstp_pln_gkkms.lstp_hisno is 'リースタイプ履歴番号';
comment on column essnewmoela.kukm_lstp_pln_gkkms.plncd is 'プランコード';
comment on column essnewmoela.kukm_lstp_pln_gkkms.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_lstp_pln_gkkms.pln_hisno is 'プラン履歴番号';
comment on column essnewmoela.kukm_lstp_pln_gkkms.syh_cd is '商品コード';
comment on column essnewmoela.kukm_lstp_pln_gkkms.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_lstp_pln_gkkms.plnls_gkkms_um_kbn is 'プランリース原価項目商品有無区分';
comment on column essnewmoela.kukm_lstp_pln_gkkms.lstp_gkkms_hjord is 'リースタイプ原価項目商品表示順';
comment on column essnewmoela.kukm_lstp_pln_gkkms.lstp_gkkms_sr is 'リースタイプ原価項目商品数量';
comment on column essnewmoela.kukm_lstp_pln_gkkms.lstp_gkkms_kb_srtk is 'リースタイプ原価項目商品個別仕入単価';
comment on column essnewmoela.kukm_lstp_pln_gkkms.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_lstp_pln_gkkms.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_lstp_pln_gkkms.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_lstp_pln_gkkms.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_lstp_pln_gkkms.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_lstp_pln_gkkms.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_lstp_pln_gkkms.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_mk;
create table /*if not exists*/ essnewmoela.kukm_mk
(
    mk_cd varchar(3) not null
   ,mk_name varchar(20) not null
   ,mk_rname varchar(10) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_mk_pk primary key
   (
        mk_cd
    )
);
comment on table essnewmoela.kukm_mk is '【共通】メーカー';
comment on column essnewmoela.kukm_mk.mk_cd is 'メーカーコード';
comment on column essnewmoela.kukm_mk.mk_name is 'メーカー名称';
comment on column essnewmoela.kukm_mk.mk_rname is 'メーカー略称';
comment on column essnewmoela.kukm_mk.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_mk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_mk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_mk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_mk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_mk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_mk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_mk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_pln;
create table /*if not exists*/ essnewmoela.kukm_pln
(
    plncd varchar(2) not null
   ,kiki_cd varchar(2) not null
   ,pln_hisno numeric(5) not null
   ,pln_tykis_ymd date not null
   ,pln_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,tls_kbn varchar(1) not null
   ,syuk_kbn varchar(1) not null
   ,kttk_kh_kbn varchar(1) not null
   ,asspt_hmtk_tsy_kbn varchar(1) not null
   ,khn_lskk numeric(3) not null
   ,sls_kkn numeric(3) not null
   ,pln_ksry varchar(50)
   ,kky_ths_cd varchar(10)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_pln_pk primary key
   (
        plncd
       ,kiki_cd
       ,pln_hisno
    )
);
comment on table essnewmoela.kukm_pln is '【共通】プラン';
comment on column essnewmoela.kukm_pln.plncd is 'プランコード';
comment on column essnewmoela.kukm_pln.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_pln.pln_hisno is 'プラン履歴番号';
comment on column essnewmoela.kukm_pln.pln_tykis_ymd is 'プラン適用開始年月日';
comment on column essnewmoela.kukm_pln.pln_tysr_ymd is 'プラン適用終了年月日';
comment on column essnewmoela.kukm_pln.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_pln.tls_kbn is '転リース区分';
comment on column essnewmoela.kukm_pln.syuk_kbn is '所有権区分';
comment on column essnewmoela.kukm_pln.kttk_kh_kbn is '期中取替可否区分';
comment on column essnewmoela.kukm_pln.asspt_hmtk_tsy_kbn is 'あんしんサポート訪問点検対象区分';
comment on column essnewmoela.kukm_pln.khn_lskk is '基本リース期間';
comment on column essnewmoela.kukm_pln.sls_kkn is '再リース期間';
comment on column essnewmoela.kukm_pln.pln_ksry is 'プラン更新理由';
comment on column essnewmoela.kukm_pln.kky_ths_cd is '顧客・取引先コード';
comment on column essnewmoela.kukm_pln.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_pln.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_pln.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_pln.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_pln.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_pln.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_pln.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_pln_ix1;
create index /*if not exists*/ kukm_pln_ix1 on essnewmoela.kukm_pln using btree
(
    dtjt_kbn
   ,pln_tykis_ymd
   ,pln_tysr_ymd
   ,plncd
   ,kiki_cd
   ,pln_hisno
);
-- drop table if exists essnewmoela.kukm_plncd_kr;
create table /*if not exists*/ essnewmoela.kukm_plncd_kr
(
    plncd varchar(2) not null
   ,pln_name varchar(20) not null
   ,bksr_kbn varchar(1) not null
   ,lstp_srtk_hkkh_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_plncd_kr_pk primary key
   (
        plncd
    )
);
comment on table essnewmoela.kukm_plncd_kr is '【共通】プランコード管理';
comment on column essnewmoela.kukm_plncd_kr.plncd is 'プランコード';
comment on column essnewmoela.kukm_plncd_kr.pln_name is 'プラン名称';
comment on column essnewmoela.kukm_plncd_kr.bksr_kbn is '物件種類区分';
comment on column essnewmoela.kukm_plncd_kr.lstp_srtk_hkkh_kbn is 'リースタイプ仕入単価変更可否区分';
comment on column essnewmoela.kukm_plncd_kr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_plncd_kr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_plncd_kr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_plncd_kr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_plncd_kr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_plncd_kr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_plncd_kr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_plnls_gkkms;
create table /*if not exists*/ essnewmoela.kukm_plnls_gkkms
(
    plncd varchar(2) not null
   ,kiki_cd varchar(2) not null
   ,pln_hisno numeric(5) not null
   ,syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,plnls_gkkms_hjord numeric(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_plnls_gkkms_pk primary key
   (
        plncd
       ,kiki_cd
       ,pln_hisno
       ,syh_cd
    )
);
comment on table essnewmoela.kukm_plnls_gkkms is '【共通】プランリース原価項目商品';
comment on column essnewmoela.kukm_plnls_gkkms.plncd is 'プランコード';
comment on column essnewmoela.kukm_plnls_gkkms.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_plnls_gkkms.pln_hisno is 'プラン履歴番号';
comment on column essnewmoela.kukm_plnls_gkkms.syh_cd is '商品コード';
comment on column essnewmoela.kukm_plnls_gkkms.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_plnls_gkkms.plnls_gkkms_hjord is 'プランリース原価項目商品表示順';
comment on column essnewmoela.kukm_plnls_gkkms.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_plnls_gkkms.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_plnls_gkkms.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_plnls_gkkms.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_plnls_gkkms.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_plnls_gkkms.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_plnls_gkkms.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_plnls_ksif;
create table /*if not exists*/ essnewmoela.kukm_plnls_ksif
(
    plncd varchar(2) not null
   ,kiki_cd varchar(2) not null
   ,pln_hisno numeric(5) not null
   ,pln_lsrr_eno numeric(5) not null
   ,lsrr_srkbn varchar(2) not null
   ,lsrr numeric(8,5) not null
   ,lsks_plncd varchar(2)
   ,lsks_pln_name varchar(20)
   ,lsks_pln_br_cd varchar(1)
   ,lsks_pln_br_name varchar(10)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_plnls_ksif_pk primary key
   (
        plncd
       ,kiki_cd
       ,pln_hisno
       ,pln_lsrr_eno
    )
);
comment on table essnewmoela.kukm_plnls_ksif is '【共通】プランリース会社情報';
comment on column essnewmoela.kukm_plnls_ksif.plncd is 'プランコード';
comment on column essnewmoela.kukm_plnls_ksif.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_plnls_ksif.pln_hisno is 'プラン履歴番号';
comment on column essnewmoela.kukm_plnls_ksif.pln_lsrr_eno is 'プランリース料率枝番';
comment on column essnewmoela.kukm_plnls_ksif.lsrr_srkbn is 'リース料率種類区分';
comment on column essnewmoela.kukm_plnls_ksif.lsrr is 'リース料率';
comment on column essnewmoela.kukm_plnls_ksif.lsks_plncd is 'リース会社プランコード';
comment on column essnewmoela.kukm_plnls_ksif.lsks_pln_name is 'リース会社プラン名称';
comment on column essnewmoela.kukm_plnls_ksif.lsks_pln_br_cd is 'リース会社プラン分類コード';
comment on column essnewmoela.kukm_plnls_ksif.lsks_pln_br_name is 'リース会社プラン分類名称';
comment on column essnewmoela.kukm_plnls_ksif.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_plnls_ksif.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_plnls_ksif.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_plnls_ksif.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_plnls_ksif.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_plnls_ksif.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_plnls_ksif.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_shzr;
create table /*if not exists*/ essnewmoela.kukm_shzr
(
    shzr_cd varchar(1) not null
   ,shz_tykis_ymd date not null
   ,shz_tysr_ymd date not null
   ,shz_hj_name varchar(5) not null
   ,shzr numeric(5,2) not null
   ,shz_hjord numeric(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_shzr_pk primary key
   (
        shzr_cd
    )
);
comment on table essnewmoela.kukm_shzr is '【共通】消費税率';
comment on column essnewmoela.kukm_shzr.shzr_cd is '消費税率コード';
comment on column essnewmoela.kukm_shzr.shz_tykis_ymd is '消費税適用開始年月日';
comment on column essnewmoela.kukm_shzr.shz_tysr_ymd is '消費税適用終了年月日';
comment on column essnewmoela.kukm_shzr.shz_hj_name is '消費税表示名称';
comment on column essnewmoela.kukm_shzr.shzr is '消費税率';
comment on column essnewmoela.kukm_shzr.shz_hjord is '消費税表示順';
comment on column essnewmoela.kukm_shzr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_shzr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_shzr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_shzr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_shzr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_shzr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_shzr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_sk;
create table /*if not exists*/ essnewmoela.kukm_sk
(
    sk_cd varchar(7) not null
   ,sk_hisno numeric(5) not null
   ,sk_tykis_ymd date not null
   ,sk_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,sk_name varchar(20) not null
   ,itsk_kbn varchar(1) not null
   ,sk_hjord numeric(5) not null
   ,sk_telno varchar(20)
   ,sk_faxno varchar(20)
   ,sk_ksry varchar(50)
   ,ybno varchar(7) not null
   ,ybno_eno numeric(5) not null
   ,ybe_hisno numeric(5) not null
   ,skjs_btn varchar(50)
   ,skjs_tm_name varchar(50)
   ,ssk_cd varchar(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_sk_pk primary key
   (
        sk_cd
       ,sk_hisno
    )
);
comment on table essnewmoela.kukm_sk is '【共通】倉庫';
comment on column essnewmoela.kukm_sk.sk_cd is '倉庫コード';
comment on column essnewmoela.kukm_sk.sk_hisno is '倉庫履歴番号';
comment on column essnewmoela.kukm_sk.sk_tykis_ymd is '倉庫適用開始年月日';
comment on column essnewmoela.kukm_sk.sk_tysr_ymd is '倉庫適用終了年月日';
comment on column essnewmoela.kukm_sk.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_sk.sk_name is '倉庫名称';
comment on column essnewmoela.kukm_sk.itsk_kbn is '委託倉庫区分';
comment on column essnewmoela.kukm_sk.sk_hjord is '倉庫表示順';
comment on column essnewmoela.kukm_sk.sk_telno is '倉庫電話番号';
comment on column essnewmoela.kukm_sk.sk_faxno is '倉庫FAX番号';
comment on column essnewmoela.kukm_sk.sk_ksry is '倉庫更新理由';
comment on column essnewmoela.kukm_sk.ybno is '郵便番号';
comment on column essnewmoela.kukm_sk.ybno_eno is '郵便番号枝番';
comment on column essnewmoela.kukm_sk.ybe_hisno is '郵便枝履歴番号';
comment on column essnewmoela.kukm_sk.skjs_btn is '倉庫住所番地など';
comment on column essnewmoela.kukm_sk.skjs_tm_name is '倉庫住所建物名称';
comment on column essnewmoela.kukm_sk.ssk_cd is '組織コード';
comment on column essnewmoela.kukm_sk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_sk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_sk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_sk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_sk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_sk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_sk.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_sk_ix1;
create index /*if not exists*/ kukm_sk_ix1 on essnewmoela.kukm_sk using btree
(
    dtjt_kbn
   ,sk_tykis_ymd
   ,sk_tysr_ymd
   ,sk_cd
   ,sk_hisno
);
-- drop table if exists essnewmoela.kukm_ssk;
create table /*if not exists*/ essnewmoela.kukm_ssk
(
    ssk_cd varchar(5) not null
   ,ssk_hisno numeric(5) not null
   ,ssk_tykis_ymd date not null
   ,ssk_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,b_cd varchar(1)
   ,ssk_name varchar(30) not null
   ,ssk_rname varchar(20) not null
   ,ssk_telno varchar(20) not null
   ,ssk_thy_telno varchar(20) not null
   ,ssk_faxno varchar(20) not null
   ,ssk_mail varchar(100)
   ,ybno varchar(7) not null
   ,ybno_eno numeric(5) not null
   ,ybe_hisno numeric(5) not null
   ,sskjs_btn varchar(50) not null
   ,sskjs_tm_name varchar(30)
   ,kykk_cd varchar(4)
   ,kykk_hisno numeric(5)
   ,kykk_stn_cd varchar(3)
   ,kykk_stn_hisno numeric(5)
   ,yk_syb varchar(1)
   ,kz_no varchar(7)
   ,kz_mg_kn varchar(30)
   ,kz_mg varchar(30)
   ,hksk_kkss_cd varchar(10) not null
   ,snsk_kkss_cd varchar(10) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ssk_pk primary key
   (
        ssk_cd
       ,ssk_hisno
    )
);
comment on table essnewmoela.kukm_ssk is '【共通】組織';
comment on column essnewmoela.kukm_ssk.ssk_cd is '組織コード';
comment on column essnewmoela.kukm_ssk.ssk_hisno is '組織履歴番号';
comment on column essnewmoela.kukm_ssk.ssk_tykis_ymd is '組織適用開始年月日';
comment on column essnewmoela.kukm_ssk.ssk_tysr_ymd is '組織適用終了年月日';
comment on column essnewmoela.kukm_ssk.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_ssk.b_cd is '部コード';
comment on column essnewmoela.kukm_ssk.ssk_name is '組織名称';
comment on column essnewmoela.kukm_ssk.ssk_rname is '組織略称';
comment on column essnewmoela.kukm_ssk.ssk_telno is '組織電話番号';
comment on column essnewmoela.kukm_ssk.ssk_thy_telno is '組織帳票電話番号';
comment on column essnewmoela.kukm_ssk.ssk_faxno is '組織FAX番号';
comment on column essnewmoela.kukm_ssk.ssk_mail is '組織メールアドレス';
comment on column essnewmoela.kukm_ssk.ybno is '郵便番号';
comment on column essnewmoela.kukm_ssk.ybno_eno is '郵便番号枝番';
comment on column essnewmoela.kukm_ssk.ybe_hisno is '郵便枝履歴番号';
comment on column essnewmoela.kukm_ssk.sskjs_btn is '組織住所番地など';
comment on column essnewmoela.kukm_ssk.sskjs_tm_name is '組織住所建物名称';
comment on column essnewmoela.kukm_ssk.kykk_cd is '金融機関コード';
comment on column essnewmoela.kukm_ssk.kykk_hisno is '金融機関履歴番号';
comment on column essnewmoela.kukm_ssk.kykk_stn_cd is '金融機関支店コード';
comment on column essnewmoela.kukm_ssk.kykk_stn_hisno is '金融機関支店履歴番号';
comment on column essnewmoela.kukm_ssk.yk_syb is '預金種別';
comment on column essnewmoela.kukm_ssk.kz_no is '口座番号';
comment on column essnewmoela.kukm_ssk.kz_mg_kn is '口座名義カナ';
comment on column essnewmoela.kukm_ssk.kz_mg is '口座名義';
comment on column essnewmoela.kukm_ssk.hksk_kkss_cd is '発行組織会計組織コード';
comment on column essnewmoela.kukm_ssk.snsk_kkss_cd is '責任組織会計組織コード';
comment on column essnewmoela.kukm_ssk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ssk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ssk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ssk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ssk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ssk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ssk.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_ssk_ix1;
create index /*if not exists*/ kukm_ssk_ix1 on essnewmoela.kukm_ssk using btree
(
    dtjt_kbn
   ,ssk_tykis_ymd
   ,ssk_tysr_ymd
   ,ssk_cd
   ,ssk_hisno
);
-- drop table if exists essnewmoela.kukm_ssk_sksk;
create table /*if not exists*/ essnewmoela.kukm_ssk_sksk
(
    ssk_cd varchar(5) not null
   ,ssk_hisno numeric(5) not null
   ,sksk_cd varchar(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ssk_sksk_pk primary key
   (
        ssk_cd
       ,ssk_hisno
    )
);
comment on table essnewmoela.kukm_ssk_sksk is '【共通】組織.総括組織';
comment on column essnewmoela.kukm_ssk_sksk.ssk_cd is '組織コード';
comment on column essnewmoela.kukm_ssk_sksk.ssk_hisno is '組織履歴番号';
comment on column essnewmoela.kukm_ssk_sksk.sksk_cd is '総括組織コード';
comment on column essnewmoela.kukm_ssk_sksk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ssk_sksk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ssk_sksk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ssk_sksk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ssk_sksk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ssk_sksk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ssk_sksk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_st_clnd;
create table /*if not exists*/ essnewmoela.kukm_st_clnd
(
    st_clnd_cd varchar(3) not null
   ,shytb_syb varchar(2) not null
   ,st_ymd date not null
   ,sh_smk_ymd date not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_st_clnd_pk primary key
   (
        st_clnd_cd
       ,shytb_syb
       ,st_ymd
    )
);
comment on table essnewmoela.kukm_st_clnd is '【共通】出納カレンダー';
comment on column essnewmoela.kukm_st_clnd.st_clnd_cd is '出納カレンダーコード';
comment on column essnewmoela.kukm_st_clnd.shytb_syb is '支払予定日種別';
comment on column essnewmoela.kukm_st_clnd.st_ymd is '出納年月日';
comment on column essnewmoela.kukm_st_clnd.sh_smk_ymd is '支払締切年月日';
comment on column essnewmoela.kukm_st_clnd.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_st_clnd.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_st_clnd.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_st_clnd.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_st_clnd.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_st_clnd.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_st_clnd.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh;
create table /*if not exists*/ essnewmoela.kukm_syh
(
    syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,syh_tykis_ymd date not null
   ,syh_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,syu_kbn varchar(1) not null
   ,syh_name varchar(80) not null
   ,syh_kts varchar(60)
   ,ti_kbn varchar(2) not null
   ,sykt_kbn varchar(1) not null
   ,syh_svs_brkbn varchar(1) not null
   ,syh_svs_ssi_kbn varchar(2) not null
   ,kiki_cd varchar(2)
   ,hbkry_kiki_syb varchar(1)
   ,mk_cd varchar(3)
   ,kzh_um_kbn varchar(1) not null
   ,hjk_tsy_kbn varchar(1)
   ,mk_hjkk_kbn varchar(1)
   ,syh_hbtk numeric(14,2) not null
   ,mk_hjkk numeric(14,2)
   ,ksgkk numeric(14,2)
   ,tas_syh_cd varchar(30)
   ,tas_syh_name varchar(80)
   ,syh_dbr_cd varchar(1)
   ,syh_tbr_cd varchar(4)
   ,b_cd varchar(1)
   ,syh_trir_no varchar(10)
   ,syh_trir_eno numeric(5)
   ,syh_ksry varchar(50)
   ,syh_iktr_ry varchar(50)
   ,sj_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_pk primary key
   (
        syh_cd
       ,syh_hisno
    )
);
comment on table essnewmoela.kukm_syh is '【共通】商品';
comment on column essnewmoela.kukm_syh.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh.syh_tykis_ymd is '商品適用開始年月日';
comment on column essnewmoela.kukm_syh.syh_tysr_ymd is '商品適用終了年月日';
comment on column essnewmoela.kukm_syh.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_syh.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_syh.syh_name is '商品名称';
comment on column essnewmoela.kukm_syh.syh_kts is '商品型式';
comment on column essnewmoela.kukm_syh.ti_kbn is '単位区分';
comment on column essnewmoela.kukm_syh.sykt_kbn is '諸口区分';
comment on column essnewmoela.kukm_syh.syh_svs_brkbn is '商品サービス分類区分';
comment on column essnewmoela.kukm_syh.syh_svs_ssi_kbn is '商品サービス詳細区分';
comment on column essnewmoela.kukm_syh.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_syh.hbkry_kiki_syb is '販売掛率用機器種別';
comment on column essnewmoela.kukm_syh.mk_cd is 'メーカーコード';
comment on column essnewmoela.kukm_syh.kzh_um_kbn is '課税品有無区分';
comment on column essnewmoela.kukm_syh.hjk_tsy_kbn is '補助金対象区分';
comment on column essnewmoela.kukm_syh.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_syh.syh_hbtk is '商品販売単価';
comment on column essnewmoela.kukm_syh.mk_hjkk is 'メーカー標準価格';
comment on column essnewmoela.kukm_syh.ksgkk is '決済限度価格';
comment on column essnewmoela.kukm_syh.tas_syh_cd is '他社商品コード';
comment on column essnewmoela.kukm_syh.tas_syh_name is '他社商品名称';
comment on column essnewmoela.kukm_syh.syh_dbr_cd is '商品大分類コード';
comment on column essnewmoela.kukm_syh.syh_tbr_cd is '商品中分類コード';
comment on column essnewmoela.kukm_syh.b_cd is '部コード';
comment on column essnewmoela.kukm_syh.syh_trir_no is '商品登録依頼番号';
comment on column essnewmoela.kukm_syh.syh_trir_eno is '商品登録依頼枝番';
comment on column essnewmoela.kukm_syh.syh_ksry is '商品更新理由';
comment on column essnewmoela.kukm_syh.syh_iktr_ry is '商品一括登録理由';
comment on column essnewmoela.kukm_syh.sj_kbn is '削除区分';
comment on column essnewmoela.kukm_syh.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_syh_ix1;
create index /*if not exists*/ kukm_syh_ix1 on essnewmoela.kukm_syh using btree
(
    dtjt_kbn
   ,syh_tykis_ymd
   ,syh_tysr_ymd
   ,syh_cd
   ,syh_hisno
);
-- drop table if exists essnewmoela.kukm_syh_dbr;
create table /*if not exists*/ essnewmoela.kukm_syh_dbr
(
    syh_dbr_cd varchar(1) not null
   ,syh_dbr_name varchar(20) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_dbr_pk primary key
   (
        syh_dbr_cd
    )
);
comment on table essnewmoela.kukm_syh_dbr is '【共通】商品大分類';
comment on column essnewmoela.kukm_syh_dbr.syh_dbr_cd is '商品大分類コード';
comment on column essnewmoela.kukm_syh_dbr.syh_dbr_name is '商品大分類名称';
comment on column essnewmoela.kukm_syh_dbr.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_syh_dbr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_dbr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_dbr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_dbr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_dbr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_dbr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_dbr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_hbgm_srtk;
create table /*if not exists*/ essnewmoela.kukm_syh_hbgm_srtk
(
    syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,hbgm_srtk_syb varchar(2) not null
   ,syh_srtk numeric(14,2) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_hbgm_srtk_pk primary key
   (
        syh_cd
       ,syh_hisno
       ,hbgm_srtk_syb
    )
);
comment on table essnewmoela.kukm_syh_hbgm_srtk is '【共通】商品.販売業務仕入単価';
comment on column essnewmoela.kukm_syh_hbgm_srtk.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_hbgm_srtk.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh_hbgm_srtk.hbgm_srtk_syb is '販売業務仕入単価種別';
comment on column essnewmoela.kukm_syh_hbgm_srtk.syh_srtk is '商品仕入単価';
comment on column essnewmoela.kukm_syh_hbgm_srtk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_hbgm_srtk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_hbgm_srtk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_hbgm_srtk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_hbgm_srtk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_hbgm_srtk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_hbgm_srtk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_hbrkb_hbtk;
create table /*if not exists*/ essnewmoela.kukm_syh_hbrkb_hbtk
(
    syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,hbrk_cd varchar(3) not null
   ,hbrkb_hbtk numeric(14,2) not null
   ,hbkry_kiki_syb varchar(1)
   ,hbkr_htbh_kbn varchar(1)
   ,mk_hjkk_kbn varchar(1)
   ,hbkr_hisno numeric(5)
   ,srkku_wa_eno numeric(5)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_hbrkb_hbtk_pk primary key
   (
        syh_cd
       ,syh_hisno
       ,hbrk_cd
    )
);
comment on table essnewmoela.kukm_syh_hbrkb_hbtk is '【共通】商品.販売ランク別販売単価';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.hbrk_cd is '販売ランクコード';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.hbrkb_hbtk is '販売ランク別販売単価';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.hbkry_kiki_syb is '販売掛率用機器種別';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.hbkr_htbh_kbn is '販売掛率本体部品区分';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.hbkr_hisno is '販売掛率履歴番号';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.srkku_wa_eno is '仕入価格割合枝番';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_hbrkb_hbtk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_krbz;
create table /*if not exists*/ essnewmoela.kukm_syh_krbz
(
    syh_cd varchar(30) not null
   ,syh_krbz_hisno numeric(5) not null
   ,krbz_syh_cd varchar(30) not null
   ,dtjt_kbn varchar(1) not null
   ,krbz_sr numeric(3) not null
   ,krbz_hjord numeric(5)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_krbz_pk primary key
   (
        syh_cd
       ,syh_krbz_hisno
       ,krbz_syh_cd
    )
);
comment on table essnewmoela.kukm_syh_krbz is '【共通】商品.関連部材';
comment on column essnewmoela.kukm_syh_krbz.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_krbz.syh_krbz_hisno is '商品関連部材履歴番号';
comment on column essnewmoela.kukm_syh_krbz.krbz_syh_cd is '関連部材商品コード';
comment on column essnewmoela.kukm_syh_krbz.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_syh_krbz.krbz_sr is '関連部材数量';
comment on column essnewmoela.kukm_syh_krbz.krbz_hjord is '関連部材表示順';
comment on column essnewmoela.kukm_syh_krbz.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_krbz.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_krbz.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_krbz.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_krbz.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_krbz.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_krbz.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_syh_krbz_ix1;
create index /*if not exists*/ kukm_syh_krbz_ix1 on essnewmoela.kukm_syh_krbz using btree
(
    dtjt_kbn
   ,syh_cd
   ,syh_krbz_hisno
   ,krbz_syh_cd
);
-- drop table if exists essnewmoela.kukm_syh_ksh;
create table /*if not exists*/ essnewmoela.kukm_syh_ksh
(
    syh_cd varchar(30) not null
   ,ksh_hisno numeric(5) not null
   ,ksh_cd varchar(30) not null
   ,dtjt_kbn varchar(1) not null
   ,ksh_sr numeric(3) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_ksh_pk primary key
   (
        syh_cd
       ,ksh_hisno
       ,ksh_cd
    )
);
comment on table essnewmoela.kukm_syh_ksh is '【共通】商品.組商品';
comment on column essnewmoela.kukm_syh_ksh.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_ksh.ksh_hisno is '組商品履歴番号';
comment on column essnewmoela.kukm_syh_ksh.ksh_cd is '組商品コード';
comment on column essnewmoela.kukm_syh_ksh.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_syh_ksh.ksh_sr is '組商品数量';
comment on column essnewmoela.kukm_syh_ksh.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_ksh.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_ksh.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_ksh.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_ksh.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_ksh.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_ksh.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_syh_ksh_ix1;
create index /*if not exists*/ kukm_syh_ksh_ix1 on essnewmoela.kukm_syh_ksh using btree
(
    dtjt_kbn
   ,syh_cd
   ,ksh_hisno
   ,ksh_cd
);
-- drop index if exists essnewmoela.kukm_syh_ksh_ix2;
create index /*if not exists*/ kukm_syh_ksh_ix2 on essnewmoela.kukm_syh_ksh using btree
(
    dtjt_kbn
   ,ksh_cd
   ,syh_cd
   ,ksh_hisno
);
-- drop table if exists essnewmoela.kukm_syh_ls_srtk;
create table /*if not exists*/ essnewmoela.kukm_syh_ls_srtk
(
    syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,plncd varchar(2) not null
   ,syh_srtk numeric(14,2) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_ls_srtk_pk primary key
   (
        syh_cd
       ,syh_hisno
       ,plncd
    )
);
comment on table essnewmoela.kukm_syh_ls_srtk is '【共通】商品.リース仕入単価';
comment on column essnewmoela.kukm_syh_ls_srtk.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_ls_srtk.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh_ls_srtk.plncd is 'プランコード';
comment on column essnewmoela.kukm_syh_ls_srtk.syh_srtk is '商品仕入単価';
comment on column essnewmoela.kukm_syh_ls_srtk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_ls_srtk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_ls_srtk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_ls_srtk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_ls_srtk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_ls_srtk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_ls_srtk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_rnk;
create table /*if not exists*/ essnewmoela.kukm_syh_rnk
(
    syh_rnk_cd varchar(1) not null
   ,syh_rnk_name varchar(10) not null
   ,syh_hkr numeric(5,2) not null
   ,syh_rnk_hjord numeric(5) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_rnk_pk primary key
   (
        syh_rnk_cd
    )
);
comment on table essnewmoela.kukm_syh_rnk is '【共通】商品ランク';
comment on column essnewmoela.kukm_syh_rnk.syh_rnk_cd is '商品ランクコード';
comment on column essnewmoela.kukm_syh_rnk.syh_rnk_name is '商品ランク名称';
comment on column essnewmoela.kukm_syh_rnk.syh_hkr is '商品評価率';
comment on column essnewmoela.kukm_syh_rnk.syh_rnk_hjord is '商品ランク表示順';
comment on column essnewmoela.kukm_syh_rnk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_rnk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_rnk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_rnk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_rnk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_rnk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_rnk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_sy;
create table /*if not exists*/ essnewmoela.kukm_syh_sy
(
    syh_sy_cd varchar(5) not null
   ,syh_sy_kso numeric(1) not null
   ,kiki_cd varchar(2) not null
   ,syh_sy_name varchar(40) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_sy_pk primary key
   (
        syh_sy_cd
       ,syh_sy_kso
       ,kiki_cd
    )
);
comment on table essnewmoela.kukm_syh_sy is '【共通】商品仕様';
comment on column essnewmoela.kukm_syh_sy.syh_sy_cd is '商品仕様コード';
comment on column essnewmoela.kukm_syh_sy.syh_sy_kso is '商品仕様階層';
comment on column essnewmoela.kukm_syh_sy.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_syh_sy.syh_sy_name is '商品仕様名称';
comment on column essnewmoela.kukm_syh_sy.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_syh_sy.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_sy.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_sy.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_sy.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_sy.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_sy.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_sy.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_syh_sy;
create table /*if not exists*/ essnewmoela.kukm_syh_syh_sy
(
    syh_cd varchar(30) not null
   ,syh_hisno numeric(5) not null
   ,syh_sy_cd varchar(5) not null
   ,syh_sy_kso numeric(1) not null
   ,kiki_cd varchar(2) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_syh_sy_pk primary key
   (
        syh_cd
       ,syh_hisno
       ,syh_sy_cd
       ,syh_sy_kso
       ,kiki_cd
    )
);
comment on table essnewmoela.kukm_syh_syh_sy is '【共通】商品.商品仕様';
comment on column essnewmoela.kukm_syh_syh_sy.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_syh_sy.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh_syh_sy.syh_sy_cd is '商品仕様コード';
comment on column essnewmoela.kukm_syh_syh_sy.syh_sy_kso is '商品仕様階層';
comment on column essnewmoela.kukm_syh_syh_sy.kiki_cd is '機器コード';
comment on column essnewmoela.kukm_syh_syh_sy.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_syh_sy.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_syh_sy.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_syh_sy.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_syh_sy.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_syh_sy.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_syh_sy.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_tbr;
create table /*if not exists*/ essnewmoela.kukm_syh_tbr
(
    syh_dbr_cd varchar(1) not null
   ,syh_tbr_cd varchar(4) not null
   ,syh_tbr_name varchar(20) not null
   ,b_cd varchar(1) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_tbr_pk primary key
   (
        syh_dbr_cd
       ,syh_tbr_cd
    )
);
comment on table essnewmoela.kukm_syh_tbr is '【共通】商品中分類';
comment on column essnewmoela.kukm_syh_tbr.syh_dbr_cd is '商品大分類コード';
comment on column essnewmoela.kukm_syh_tbr.syh_tbr_cd is '商品中分類コード';
comment on column essnewmoela.kukm_syh_tbr.syh_tbr_name is '商品中分類名称';
comment on column essnewmoela.kukm_syh_tbr.b_cd is '部コード';
comment on column essnewmoela.kukm_syh_tbr.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_syh_tbr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_tbr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_tbr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_tbr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_tbr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_tbr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_tbr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_tbr_kjkm;
create table /*if not exists*/ essnewmoela.kukm_syh_tbr_kjkm
(
    syh_dbr_cd varchar(1) not null
   ,syh_tbr_cd varchar(4) not null
   ,kjkm_kbn varchar(1) not null
   ,kjkm_cd varchar(9) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_tbr_kjkm_pk primary key
   (
        syh_dbr_cd
       ,syh_tbr_cd
       ,kjkm_kbn
    )
);
comment on table essnewmoela.kukm_syh_tbr_kjkm is '【共通】商品中分類勘定科目';
comment on column essnewmoela.kukm_syh_tbr_kjkm.syh_dbr_cd is '商品大分類コード';
comment on column essnewmoela.kukm_syh_tbr_kjkm.syh_tbr_cd is '商品中分類コード';
comment on column essnewmoela.kukm_syh_tbr_kjkm.kjkm_kbn is '勘定科目区分';
comment on column essnewmoela.kukm_syh_tbr_kjkm.kjkm_cd is '勘定科目コード';
comment on column essnewmoela.kukm_syh_tbr_kjkm.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_tbr_kjkm.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_tbr_kjkm.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_tbr_kjkm.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_tbr_kjkm.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_tbr_kjkm.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_tbr_kjkm.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_trir_dtl;
create table /*if not exists*/ essnewmoela.kukm_syh_trir_dtl
(
    syh_trir_no varchar(10) not null
   ,syh_trir_hisno numeric(5) not null
   ,syh_trir_eno numeric(5) not null
   ,syh_cd varchar(30) not null
   ,syh_hisno numeric(5)
   ,syh_name varchar(80) not null
   ,mk_cd varchar(3) not null
   ,syh_htbh_kbn varchar(1)
   ,ti_kbn varchar(2)
   ,mk_hjkk_kbn varchar(1)
   ,mk_hjkk numeric(14,2)
   ,hbgm_srtk_syb varchar(2)
   ,syh_srtk numeric(14,2)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_trir_dtl_pk primary key
   (
        syh_trir_no
       ,syh_trir_hisno
       ,syh_trir_eno
    )
);
comment on table essnewmoela.kukm_syh_trir_dtl is '【共通】商品登録依頼DTL';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_trir_no is '商品登録依頼番号';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_trir_hisno is '商品登録依頼履歴番号';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_trir_eno is '商品登録依頼枝番';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_cd is '商品コード';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_hisno is '商品履歴番号';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_name is '商品名称';
comment on column essnewmoela.kukm_syh_trir_dtl.mk_cd is 'メーカーコード';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_htbh_kbn is '商品本体部品区分';
comment on column essnewmoela.kukm_syh_trir_dtl.ti_kbn is '単位区分';
comment on column essnewmoela.kukm_syh_trir_dtl.mk_hjkk_kbn is 'メーカー標準価格区分';
comment on column essnewmoela.kukm_syh_trir_dtl.mk_hjkk is 'メーカー標準価格';
comment on column essnewmoela.kukm_syh_trir_dtl.hbgm_srtk_syb is '販売業務仕入単価種別';
comment on column essnewmoela.kukm_syh_trir_dtl.syh_srtk is '商品仕入単価';
comment on column essnewmoela.kukm_syh_trir_dtl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_trir_dtl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_trir_dtl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_trir_dtl_toymd;
create table /*if not exists*/ essnewmoela.kukm_syh_trir_dtl_toymd
(
    syh_trir_no varchar(10) not null
   ,syh_trir_hisno numeric(5) not null
   ,syh_trir_eno numeric(5) not null
   ,toymd date not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_trir_dtl_toymd_pk primary key
   (
        syh_trir_no
       ,syh_trir_hisno
       ,syh_trir_eno
    )
);
comment on table essnewmoela.kukm_syh_trir_dtl_toymd is '【共通】商品登録依頼DTL.商品登録依頼対応年月日';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.syh_trir_no is '商品登録依頼番号';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.syh_trir_hisno is '商品登録依頼履歴番号';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.syh_trir_eno is '商品登録依頼枝番';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.toymd is '商品登録依頼対応年月日';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl_toymd.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_trir_dtl_tpfl;
create table /*if not exists*/ essnewmoela.kukm_syh_trir_dtl_tpfl
(
    syh_trir_no varchar(10) not null
   ,syh_trir_hisno numeric(5) not null
   ,syh_trir_eno numeric(5) not null
   ,syh_trir_tpfl_eno numeric(5) not null
   ,hkfle_id varchar(10) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_trir_dtl_tpfl_pk primary key
   (
        syh_trir_no
       ,syh_trir_hisno
       ,syh_trir_eno
       ,syh_trir_tpfl_eno
    )
);
comment on table essnewmoela.kukm_syh_trir_dtl_tpfl is '【共通】商品登録依頼DTL.添付ファイル';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.syh_trir_no is '商品登録依頼番号';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.syh_trir_hisno is '商品登録依頼履歴番号';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.syh_trir_eno is '商品登録依頼枝番';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.syh_trir_tpfl_eno is '商品登録依頼添付ファイル枝番';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.hkfle_id is '保管ファイルID';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_trir_dtl_tpfl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_syh_trir_hdr;
create table /*if not exists*/ essnewmoela.kukm_syh_trir_hdr
(
    syh_trir_no varchar(10) not null
   ,syh_trir_hisno numeric(5) not null
   ,dtjt_kbn varchar(1) not null
   ,ssk_cd varchar(5) not null
   ,ssk_hisno numeric(5) not null
   ,usr_id varchar(20) not null
   ,usr_hisno numeric(5) not null
   ,syh_trir_ymd date not null
   ,syh_trir_kbn varchar(1) not null
   ,syh_trirs_kbn varchar(1) not null
   ,syh_trir_ksry varchar(50)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_syh_trir_hdr_pk primary key
   (
        syh_trir_no
       ,syh_trir_hisno
    )
);
comment on table essnewmoela.kukm_syh_trir_hdr is '【共通】商品登録依頼HDR';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trir_no is '商品登録依頼番号';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trir_hisno is '商品登録依頼履歴番号';
comment on column essnewmoela.kukm_syh_trir_hdr.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_syh_trir_hdr.ssk_cd is '組織コード';
comment on column essnewmoela.kukm_syh_trir_hdr.ssk_hisno is '組織履歴番号';
comment on column essnewmoela.kukm_syh_trir_hdr.usr_id is 'ユーザーID';
comment on column essnewmoela.kukm_syh_trir_hdr.usr_hisno is 'ユーザー履歴番号';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trir_ymd is '商品登録依頼年月日';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trir_kbn is '商品登録依頼区分';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trirs_kbn is '商品登録依頼先区分';
comment on column essnewmoela.kukm_syh_trir_hdr.syh_trir_ksry is '商品登録依頼更新理由';
comment on column essnewmoela.kukm_syh_trir_hdr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_syh_trir_hdr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_syh_trir_hdr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_syh_trir_hdr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_syh_trir_hdr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_syh_trir_hdr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_syh_trir_hdr.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_syh_trir_hdr_ix1;
create index /*if not exists*/ kukm_syh_trir_hdr_ix1 on essnewmoela.kukm_syh_trir_hdr using btree
(
    dtjt_kbn
   ,syh_trir_no
   ,syh_trir_hisno
);
-- drop table if exists essnewmoela.kukm_tgdr_mk;
create table /*if not exists*/ essnewmoela.kukm_tgdr_mk
(
    tgdr_mk_cd varchar(5) not null
   ,tgdr_mk_name varchar(40) not null
   ,tgdr_mk_rname varchar(20) not null
   ,mk_cd varchar(3)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_tgdr_mk_pk primary key
   (
        tgdr_mk_cd
    )
);
comment on table essnewmoela.kukm_tgdr_mk is '【共通】中国電力メーカー';
comment on column essnewmoela.kukm_tgdr_mk.tgdr_mk_cd is '中国電力メーカーコード';
comment on column essnewmoela.kukm_tgdr_mk.tgdr_mk_name is '中国電力メーカー名称';
comment on column essnewmoela.kukm_tgdr_mk.tgdr_mk_rname is '中国電力メーカー略称';
comment on column essnewmoela.kukm_tgdr_mk.mk_cd is 'メーカーコード';
comment on column essnewmoela.kukm_tgdr_mk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_tgdr_mk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_tgdr_mk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_tgdr_mk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_tgdr_mk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_tgdr_mk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_tgdr_mk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ths_dbr;
create table /*if not exists*/ essnewmoela.kukm_ths_dbr
(
    ths_dbr_cd varchar(1) not null
   ,ths_dbr_name varchar(20) not null
   ,syu_kbn varchar(1) not null
   ,ukk_kjkm_cd varchar(9) not null
   ,kkk_kjkm_cd varchar(9) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ths_dbr_pk primary key
   (
        ths_dbr_cd
    )
);
comment on table essnewmoela.kukm_ths_dbr is '【共通】取引先大分類';
comment on column essnewmoela.kukm_ths_dbr.ths_dbr_cd is '取引先大分類コード';
comment on column essnewmoela.kukm_ths_dbr.ths_dbr_name is '取引先大分類名称';
comment on column essnewmoela.kukm_ths_dbr.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_ths_dbr.ukk_kjkm_cd is '売掛金勘定科目コード';
comment on column essnewmoela.kukm_ths_dbr.kkk_kjkm_cd is '買掛金勘定科目コード';
comment on column essnewmoela.kukm_ths_dbr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ths_dbr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ths_dbr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ths_dbr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ths_dbr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ths_dbr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ths_dbr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ths_sbr;
create table /*if not exists*/ essnewmoela.kukm_ths_sbr
(
    ths_dbr_cd varchar(1) not null
   ,ths_tbr_cd varchar(1) not null
   ,ths_sbr_cd varchar(2) not null
   ,ths_sbr_name varchar(30) not null
   ,syu_kbn varchar(1) not null
   ,pk_kkks_cd varchar(4)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ths_sbr_pk primary key
   (
        ths_dbr_cd
       ,ths_tbr_cd
       ,ths_sbr_cd
    )
);
comment on table essnewmoela.kukm_ths_sbr is '【共通】取引先小分類';
comment on column essnewmoela.kukm_ths_sbr.ths_dbr_cd is '取引先大分類コード';
comment on column essnewmoela.kukm_ths_sbr.ths_tbr_cd is '取引先中分類コード';
comment on column essnewmoela.kukm_ths_sbr.ths_sbr_cd is '取引先小分類コード';
comment on column essnewmoela.kukm_ths_sbr.ths_sbr_name is '取引先小分類名称';
comment on column essnewmoela.kukm_ths_sbr.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_ths_sbr.pk_kkks_cd is 'パワー経理関係会社コード';
comment on column essnewmoela.kukm_ths_sbr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ths_sbr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ths_sbr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ths_sbr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ths_sbr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ths_sbr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ths_sbr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ths_tbr;
create table /*if not exists*/ essnewmoela.kukm_ths_tbr
(
    ths_dbr_cd varchar(1) not null
   ,ths_tbr_cd varchar(1) not null
   ,ths_tbr_name varchar(20) not null
   ,syu_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ths_tbr_pk primary key
   (
        ths_dbr_cd
       ,ths_tbr_cd
    )
);
comment on table essnewmoela.kukm_ths_tbr is '【共通】取引先中分類';
comment on column essnewmoela.kukm_ths_tbr.ths_dbr_cd is '取引先大分類コード';
comment on column essnewmoela.kukm_ths_tbr.ths_tbr_cd is '取引先中分類コード';
comment on column essnewmoela.kukm_ths_tbr.ths_tbr_name is '取引先中分類名称';
comment on column essnewmoela.kukm_ths_tbr.syu_kbn is '使用区分';
comment on column essnewmoela.kukm_ths_tbr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ths_tbr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ths_tbr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ths_tbr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ths_tbr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ths_tbr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ths_tbr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_usr;
create table /*if not exists*/ essnewmoela.kukm_usr
(
    usr_id varchar(20) not null
   ,usr_hisno numeric(5) not null
   ,usr_tykis_ymd date not null
   ,usr_tysr_ymd date not null
   ,dtjt_kbn varchar(1) not null
   ,usr_name_kn varchar(40) not null
   ,usr_name varchar(15) not null
   ,usr_kbn varchar(1) not null
   ,usr_mail varchar(100)
   ,ssk_cd varchar(5)
   ,ys_cd varchar(2) not null
   ,kgn_grp_cd varchar(2) not null
   ,mst_upd_kgn_kbn varchar(1)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_usr_pk primary key
   (
        usr_id
       ,usr_hisno
    )
);
comment on table essnewmoela.kukm_usr is '【共通】ユーザー';
comment on column essnewmoela.kukm_usr.usr_id is 'ユーザーID';
comment on column essnewmoela.kukm_usr.usr_hisno is 'ユーザー履歴番号';
comment on column essnewmoela.kukm_usr.usr_tykis_ymd is 'ユーザー適用開始年月日';
comment on column essnewmoela.kukm_usr.usr_tysr_ymd is 'ユーザー適用終了年月日';
comment on column essnewmoela.kukm_usr.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_usr.usr_name_kn is 'ユーザー名称カナ';
comment on column essnewmoela.kukm_usr.usr_name is 'ユーザー名称';
comment on column essnewmoela.kukm_usr.usr_kbn is 'ユーザー区分';
comment on column essnewmoela.kukm_usr.usr_mail is 'ユーザーメールアドレス';
comment on column essnewmoela.kukm_usr.ssk_cd is '組織コード';
comment on column essnewmoela.kukm_usr.ys_cd is '役職コード';
comment on column essnewmoela.kukm_usr.kgn_grp_cd is '権限グループコード';
comment on column essnewmoela.kukm_usr.mst_upd_kgn_kbn is 'マスタ更新権限区分';
comment on column essnewmoela.kukm_usr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_usr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_usr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_usr.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_usr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_usr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_usr.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_usr_ix1;
create index /*if not exists*/ kukm_usr_ix1 on essnewmoela.kukm_usr using btree
(
    dtjt_kbn
   ,usr_tykis_ymd
   ,usr_tysr_ymd
   ,usr_id
   ,usr_hisno
);
-- drop table if exists essnewmoela.kukm_usr_acunt;
create table /*if not exists*/ essnewmoela.kukm_usr_acunt
(
    usr_id varchar(20) not null
   ,pwd text not null
   ,pwd_hek_y_flg varchar(1) not null
   ,pwd_nssp_kisu numeric(5) not null
   ,acunt_lock_flg varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_usr_acunt_pk primary key
   (
        usr_id
    )
);
comment on table essnewmoela.kukm_usr_acunt is '【共通】ユーザーアカウント';
comment on column essnewmoela.kukm_usr_acunt.usr_id is 'ユーザーID';
comment on column essnewmoela.kukm_usr_acunt.pwd is 'パスワード';
comment on column essnewmoela.kukm_usr_acunt.pwd_hek_y_flg is 'パスワード変更要フラグ';
comment on column essnewmoela.kukm_usr_acunt.pwd_nssp_kisu is 'パスワード認証失敗回数';
comment on column essnewmoela.kukm_usr_acunt.acunt_lock_flg is 'アカウントロックフラグ';
comment on column essnewmoela.kukm_usr_acunt.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_usr_acunt.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_usr_acunt.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_usr_acunt.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_usr_acunt.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_usr_acunt.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_usr_acunt.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ybno_dtk;
create table /*if not exists*/ essnewmoela.kukm_ybno_dtk
(
    ybno varchar(7) not null
   ,tdfk_kn varchar(10) not null
   ,tdfk varchar(5) not null
   ,skgts_kn varchar(80) not null
   ,skgts varchar(40) not null
   ,js_3_kn varchar(80) not null
   ,js_3 varchar(40) not null
   ,ybno_rno numeric(6) not null
   ,js_skb varchar(5) not null
   ,ybno_bs varchar(5) not null
   ,ybno_kbn_1 varchar(1)
   ,ybno_kbn_2 varchar(1)
   ,ybno_kbn_3 varchar(1)
   ,ybno_kbn_4 varchar(1)
   ,ybno_kbn_5 varchar(1)
   ,ybno_kbn_6 varchar(1)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
);
comment on table essnewmoela.kukm_ybno_dtk is '【共通】郵便番号データ取込';
comment on column essnewmoela.kukm_ybno_dtk.ybno is '郵便番号';
comment on column essnewmoela.kukm_ybno_dtk.tdfk_kn is '都道府県カナ';
comment on column essnewmoela.kukm_ybno_dtk.tdfk is '都道府県';
comment on column essnewmoela.kukm_ybno_dtk.skgts_kn is '市区郡町村カナ';
comment on column essnewmoela.kukm_ybno_dtk.skgts is '市区郡町村';
comment on column essnewmoela.kukm_ybno_dtk.js_3_kn is '住所3カナ';
comment on column essnewmoela.kukm_ybno_dtk.js_3 is '住所3';
comment on column essnewmoela.kukm_ybno_dtk.ybno_rno is '郵便番号連番';
comment on column essnewmoela.kukm_ybno_dtk.js_skb is '住所識別';
comment on column essnewmoela.kukm_ybno_dtk.ybno_bs is '郵便番号抜粋';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_1 is '郵便番号区分1';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_2 is '郵便番号区分2';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_3 is '郵便番号区分3';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_4 is '郵便番号区分4';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_5 is '郵便番号区分5';
comment on column essnewmoela.kukm_ybno_dtk.ybno_kbn_6 is '郵便番号区分6';
comment on column essnewmoela.kukm_ybno_dtk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ybno_dtk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ybno_dtk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ybno_dtk.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ybno_dtk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ybno_dtk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ybno_dtk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kukm_ybno_js;
create table /*if not exists*/ essnewmoela.kukm_ybno_js
(
    ybno varchar(7) not null
   ,ybno_eno numeric(5) not null
   ,ybe_hisno numeric(5) not null
   ,dtjt_kbn varchar(1) not null
   ,tdfk_kn varchar(10) not null
   ,tdfk varchar(5) not null
   ,skgts_kn varchar(80) not null
   ,skgts varchar(40) not null
   ,js_3_kn varchar(80)
   ,js_3 varchar(40)
   ,sj_ymd date not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kukm_ybno_js_pk primary key
   (
        ybno
       ,ybno_eno
       ,ybe_hisno
    )
);
comment on table essnewmoela.kukm_ybno_js is '【共通】郵便番号住所';
comment on column essnewmoela.kukm_ybno_js.ybno is '郵便番号';
comment on column essnewmoela.kukm_ybno_js.ybno_eno is '郵便番号枝番';
comment on column essnewmoela.kukm_ybno_js.ybe_hisno is '郵便枝履歴番号';
comment on column essnewmoela.kukm_ybno_js.dtjt_kbn is 'データ状態区分';
comment on column essnewmoela.kukm_ybno_js.tdfk_kn is '都道府県カナ';
comment on column essnewmoela.kukm_ybno_js.tdfk is '都道府県';
comment on column essnewmoela.kukm_ybno_js.skgts_kn is '市区郡町村カナ';
comment on column essnewmoela.kukm_ybno_js.skgts is '市区郡町村';
comment on column essnewmoela.kukm_ybno_js.js_3_kn is '住所3カナ';
comment on column essnewmoela.kukm_ybno_js.js_3 is '住所3';
comment on column essnewmoela.kukm_ybno_js.sj_ymd is '削除年月日';
comment on column essnewmoela.kukm_ybno_js.gymev_name is '業務イベント名称';
comment on column essnewmoela.kukm_ybno_js.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kukm_ybno_js.tr_usr is '登録ユーザー';
comment on column essnewmoela.kukm_ybno_js.tr_pg is '登録プログラム';
comment on column essnewmoela.kukm_ybno_js.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kukm_ybno_js.upd_usr is '更新ユーザー';
comment on column essnewmoela.kukm_ybno_js.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kukm_ybno_js_ix1;
create index /*if not exists*/ kukm_ybno_js_ix1 on essnewmoela.kukm_ybno_js using btree
(
    dtjt_kbn
   ,ybno
   ,ybno_eno
   ,ybe_hisno
);
-- drop table if exists essnewmoela.kuku_bat_srkk;
create table /*if not exists*/ essnewmoela.kuku_bat_srkk
(
    srkk_sry_ymd_time timestamp not null
   ,batsr_id varchar(10) not null
   ,batsr_ymd date not null
   ,srkk_kbn varchar(1) not null
   ,err_ny varchar(1000)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_bat_srkk_pk primary key
   (
        srkk_sry_ymd_time
       ,batsr_id
    )
);
comment on table essnewmoela.kuku_bat_srkk is '【共通】バッチ処理結果';
comment on column essnewmoela.kuku_bat_srkk.srkk_sry_ymd_time is '処理結果出力年月日時刻';
comment on column essnewmoela.kuku_bat_srkk.batsr_id is 'バッチ処理ID';
comment on column essnewmoela.kuku_bat_srkk.batsr_ymd is 'バッチ処理年月日';
comment on column essnewmoela.kuku_bat_srkk.srkk_kbn is '処理結果区分';
comment on column essnewmoela.kuku_bat_srkk.err_ny is 'エラー内容';
comment on column essnewmoela.kuku_bat_srkk.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_bat_srkk.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_bat_srkk.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_bat_srkk.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_bat_srkk.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_bat_srkk.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_bat_srkk.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_drnst;
create table /*if not exists*/ essnewmoela.kuku_drnst
(
    usr_id varchar(20) not null
   ,drn_usr_id varchar(20) not null
   ,drnst_yko_strt_ymd date not null
   ,drnst_yko_end_ymd date not null
   ,drnst_kssr_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_drnst_pk primary key
   (
        usr_id
       ,drn_usr_id
       ,drnst_yko_strt_ymd
    )
);
comment on table essnewmoela.kuku_drnst is '【共通】代理人設定';
comment on column essnewmoela.kuku_drnst.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_drnst.drn_usr_id is '代理人ユーザーID';
comment on column essnewmoela.kuku_drnst.drnst_yko_strt_ymd is '代理人設定有効開始年月日';
comment on column essnewmoela.kuku_drnst.drnst_yko_end_ymd is '代理人設定有効終了年月日';
comment on column essnewmoela.kuku_drnst.drnst_kssr_kbn is '代理人設定更新処理区分';
comment on column essnewmoela.kuku_drnst.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_drnst.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_drnst.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_drnst.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_drnst.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_drnst.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_drnst.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_gm_ijhz;
create table /*if not exists*/ essnewmoela.kuku_gm_ijhz
(
    gm_ijhz_id varchar(10) not null
   ,usr_id varchar(20) not null
   ,kin_id varchar(9) not null
   ,gm_ijhz_ymd_time timestamp not null
   ,sjyt_ymd date not null
   ,gm_ijhz_if jsonb
   ,gm_ijhz_hj_name varchar(500)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_gm_ijhz_pk primary key
   (
        gm_ijhz_id
    )
);
comment on table essnewmoela.kuku_gm_ijhz is '【共通】画面一時保存';
comment on column essnewmoela.kuku_gm_ijhz.gm_ijhz_id is '画面一時保存ID';
comment on column essnewmoela.kuku_gm_ijhz.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_gm_ijhz.kin_id is '機能ID';
comment on column essnewmoela.kuku_gm_ijhz.gm_ijhz_ymd_time is '画面一時保存年月日時刻';
comment on column essnewmoela.kuku_gm_ijhz.sjyt_ymd is '削除予定年月日';
comment on column essnewmoela.kuku_gm_ijhz.gm_ijhz_if is '画面一時保存情報';
comment on column essnewmoela.kuku_gm_ijhz.gm_ijhz_hj_name is '画面一時保存表示名称';
comment on column essnewmoela.kuku_gm_ijhz.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_gm_ijhz.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_gm_ijhz.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_gm_ijhz.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_gm_ijhz.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_gm_ijhz.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_gm_ijhz.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_hbz_cd_kr;
create table /*if not exists*/ essnewmoela.kuku_hbz_cd_kr
(
    rcd_skb_cd varchar(7) not null
   ,hbz_cd varchar(20) not null
   ,hbz_kt_cd varchar(20) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_hbz_cd_kr_pk primary key
   (
        rcd_skb_cd
       ,hbz_cd
       ,hbz_kt_cd
    )
);
comment on table essnewmoela.kuku_hbz_cd_kr is '【共通】発番済コード管理';
comment on column essnewmoela.kuku_hbz_cd_kr.rcd_skb_cd is 'レコード識別コード';
comment on column essnewmoela.kuku_hbz_cd_kr.hbz_cd is '発番済コード';
comment on column essnewmoela.kuku_hbz_cd_kr.hbz_kt_cd is '発番済共通コード';
comment on column essnewmoela.kuku_hbz_cd_kr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_hbz_cd_kr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_hbz_cd_kr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_hbz_cd_kr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_hbz_cd_kr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_hbz_cd_kr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_hbz_cd_kr.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kuku_hbz_cd_kr_ix1;
create index /*if not exists*/ kuku_hbz_cd_kr_ix1 on essnewmoela.kuku_hbz_cd_kr using btree
(
    hbz_kt_cd
   ,hbz_cd
);
-- drop table if exists essnewmoela.kuku_hkfle_kr;
create table /*if not exists*/ essnewmoela.kuku_hkfle_kr
(
    hkfle_id varchar(10) not null
   ,jfle_folpt text not null
   ,hjfle_name varchar(200) not null
   ,kin_id varchar(9) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_hkfle_kr_pk primary key
   (
        hkfle_id
    )
);
comment on table essnewmoela.kuku_hkfle_kr is '【共通】保管ファイル管理';
comment on column essnewmoela.kuku_hkfle_kr.hkfle_id is '保管ファイルID';
comment on column essnewmoela.kuku_hkfle_kr.jfle_folpt is '実ファイルフォルダーパス';
comment on column essnewmoela.kuku_hkfle_kr.hjfle_name is '表示ファイル名称';
comment on column essnewmoela.kuku_hkfle_kr.kin_id is '機能ID';
comment on column essnewmoela.kuku_hkfle_kr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_hkfle_kr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_hkfle_kr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_hkfle_kr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_hkfle_kr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_hkfle_kr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_hkfle_kr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_hta_if;
create table /*if not exists*/ essnewmoela.kuku_hta_if
(
    hta_segyo_no numeric(15) not null
   ,hta_data_syb_cd varchar(30) not null
   ,usr_id varchar(20) not null
   ,hta_if_ss_ymd_time timestamp not null
   ,hta_keyt_01 varchar(80) not null
   ,hta_keyt_02 varchar(80) not null
   ,hta_keyt_03 varchar(80) not null
   ,hta_keyt_04 varchar(80) not null
   ,hta_keyt_05 varchar(80) not null
   ,hta_keyt_06 varchar(80) not null
   ,hta_keyt_07 varchar(80) not null
   ,hta_keyt_08 varchar(80) not null
   ,hta_keyt_09 varchar(80) not null
   ,hta_keyt_10 varchar(80) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_hta_if_pk primary key
   (
        hta_data_syb_cd
       ,hta_keyt_01
       ,hta_keyt_02
       ,hta_keyt_03
       ,hta_keyt_04
       ,hta_keyt_05
       ,hta_keyt_06
       ,hta_keyt_07
       ,hta_keyt_08
       ,hta_keyt_09
       ,hta_keyt_10
    )
);
comment on table essnewmoela.kuku_hta_if is '【共通】排他情報';
comment on column essnewmoela.kuku_hta_if.hta_segyo_no is '排他制御番号';
comment on column essnewmoela.kuku_hta_if.hta_data_syb_cd is '排他データ種別コード';
comment on column essnewmoela.kuku_hta_if.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_hta_if.hta_if_ss_ymd_time is '排他情報作成年月日時刻';
comment on column essnewmoela.kuku_hta_if.hta_keyt_01 is '排他キー値01';
comment on column essnewmoela.kuku_hta_if.hta_keyt_02 is '排他キー値02';
comment on column essnewmoela.kuku_hta_if.hta_keyt_03 is '排他キー値03';
comment on column essnewmoela.kuku_hta_if.hta_keyt_04 is '排他キー値04';
comment on column essnewmoela.kuku_hta_if.hta_keyt_05 is '排他キー値05';
comment on column essnewmoela.kuku_hta_if.hta_keyt_06 is '排他キー値06';
comment on column essnewmoela.kuku_hta_if.hta_keyt_07 is '排他キー値07';
comment on column essnewmoela.kuku_hta_if.hta_keyt_08 is '排他キー値08';
comment on column essnewmoela.kuku_hta_if.hta_keyt_09 is '排他キー値09';
comment on column essnewmoela.kuku_hta_if.hta_keyt_10 is '排他キー値10';
comment on column essnewmoela.kuku_hta_if.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_hta_if.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_hta_if.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_hta_if.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_hta_if.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_hta_if.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_hta_if.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_kin;
create table /*if not exists*/ essnewmoela.kuku_kin
(
    kin_id varchar(9) not null
   ,kin_syb varchar(1) not null
   ,kin_name varchar(50) not null
   ,bat_kin_id varchar(9)
   ,srthd_skb varchar(2)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_kin_pk primary key
   (
        kin_id
    )
);
comment on table essnewmoela.kuku_kin is '【共通】機能';
comment on column essnewmoela.kuku_kin.kin_id is '機能ID';
comment on column essnewmoela.kuku_kin.kin_syb is '機能種別';
comment on column essnewmoela.kuku_kin.kin_name is '機能名称';
comment on column essnewmoela.kuku_kin.bat_kin_id is 'バッチ機能ID';
comment on column essnewmoela.kuku_kin.srthd_skb is '処理スレッド識別';
comment on column essnewmoela.kuku_kin.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_kin.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_kin.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_kin.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_kin.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_kin.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_kin.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_menu_prmt;
create table /*if not exists*/ essnewmoela.kuku_menu_prmt
(
    menu_cd varchar(30) not null
   ,b_cd varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_menu_prmt_pk primary key
   (
        menu_cd
       ,b_cd
    )
);
comment on table essnewmoela.kuku_menu_prmt is '【共通】メニューパラメーター';
comment on column essnewmoela.kuku_menu_prmt.menu_cd is 'メニューCD';
comment on column essnewmoela.kuku_menu_prmt.b_cd is '部コード';
comment on column essnewmoela.kuku_menu_prmt.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_menu_prmt.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_menu_prmt.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_menu_prmt.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_menu_prmt.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_menu_prmt.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_menu_prmt.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_mfx_sssj_dtl;
create table /*if not exists*/ essnewmoela.kuku_mfx_sssj_dtl
(
    mfx_sssj_no varchar(10) not null
   ,kky_ths_cd varchar(10) not null
   ,kky_ths_hisno numeric(5) not null
   ,srthd_skb varchar(2) not null
   ,kky_ths_mail varchar(100)
   ,kky_ths_telno varchar(20)
   ,sskk_kbn varchar(1)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_mfx_sssj_dtl_pk primary key
   (
        mfx_sssj_no
       ,kky_ths_cd
    )
);
comment on table essnewmoela.kuku_mfx_sssj_dtl is '【共通】メール・FAX送信指示DTL';
comment on column essnewmoela.kuku_mfx_sssj_dtl.mfx_sssj_no is 'メール・FAX送信指示番号';
comment on column essnewmoela.kuku_mfx_sssj_dtl.kky_ths_cd is '顧客・取引先コード';
comment on column essnewmoela.kuku_mfx_sssj_dtl.kky_ths_hisno is '顧客・取引先履歴番号';
comment on column essnewmoela.kuku_mfx_sssj_dtl.srthd_skb is '処理スレッド識別';
comment on column essnewmoela.kuku_mfx_sssj_dtl.kky_ths_mail is '顧客・取引先メールアドレス';
comment on column essnewmoela.kuku_mfx_sssj_dtl.kky_ths_telno is '顧客・取引先電話番号';
comment on column essnewmoela.kuku_mfx_sssj_dtl.sskk_kbn is '送信結果区分';
comment on column essnewmoela.kuku_mfx_sssj_dtl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_mfx_sssj_dtl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_dtl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_dtl.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_mfx_sssj_dtl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_dtl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_dtl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_mfx_sssj_hdr;
create table /*if not exists*/ essnewmoela.kuku_mfx_sssj_hdr
(
    mfx_sssj_no varchar(10) not null
   ,usr_id varchar(20) not null
   ,usr_hisno numeric(5) not null
   ,mfx_sssj_ymd_time timestamp not null
   ,mfx_ssn_kky_ths_kbn varchar(1) not null
   ,ssn_knm varchar(100) not null
   ,ssn_hb_ny varchar(3000)
   ,mfx_kbn varchar(1) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_mfx_sssj_hdr_pk primary key
   (
        mfx_sssj_no
    )
);
comment on table essnewmoela.kuku_mfx_sssj_hdr is '【共通】メール・FAX送信指示HDR';
comment on column essnewmoela.kuku_mfx_sssj_hdr.mfx_sssj_no is 'メール・FAX送信指示番号';
comment on column essnewmoela.kuku_mfx_sssj_hdr.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_mfx_sssj_hdr.usr_hisno is 'ユーザー履歴番号';
comment on column essnewmoela.kuku_mfx_sssj_hdr.mfx_sssj_ymd_time is 'メール・FAX送信指示年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr.mfx_ssn_kky_ths_kbn is 'メール・FAX送信顧客取引先区分';
comment on column essnewmoela.kuku_mfx_sssj_hdr.ssn_knm is '送信件名';
comment on column essnewmoela.kuku_mfx_sssj_hdr.ssn_hb_ny is '送信本文・内容';
comment on column essnewmoela.kuku_mfx_sssj_hdr.mfx_kbn is 'メール・FAX区分';
comment on column essnewmoela.kuku_mfx_sssj_hdr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_mfx_sssj_hdr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_mfx_sssj_hdr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_mfx_sssj_hdr_asfle;
create table /*if not exists*/ essnewmoela.kuku_mfx_sssj_hdr_asfle
(
    mfx_sssj_no varchar(10) not null
   ,mfx_sssf_asfle_eno numeric(5) not null
   ,hkfle_id varchar(10) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_mfx_sssj_hdr_asfle_pk primary key
   (
        mfx_sssj_no
       ,mfx_sssf_asfle_eno
    )
);
comment on table essnewmoela.kuku_mfx_sssj_hdr_asfle is '【共通】メール・FAX送信指示HDR.宛先ファイル';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.mfx_sssj_no is 'メール・FAX送信指示番号';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.mfx_sssf_asfle_eno is 'メール・FAX送信送付宛先ファイル枝番';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.hkfle_id is '保管ファイルID';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr_asfle.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_mfx_sssj_hdr_sfsr;
create table /*if not exists*/ essnewmoela.kuku_mfx_sssj_hdr_sfsr
(
    mfx_sssj_no varchar(10) not null
   ,mfx_ssn_sfsr_eno numeric(5) not null
   ,hkfle_id varchar(10) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_mfx_sssj_hdr_sfsr_pk primary key
   (
        mfx_sssj_no
       ,mfx_ssn_sfsr_eno
    )
);
comment on table essnewmoela.kuku_mfx_sssj_hdr_sfsr is '【共通】メール・FAX送信指示HDR.送付資料';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.mfx_sssj_no is 'メール・FAX送信指示番号';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.mfx_ssn_sfsr_eno is 'メール・FAX送信送付資料枝番';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.hkfle_id is '保管ファイルID';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_mfx_sssj_hdr_sfsr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_msg;
create table /*if not exists*/ essnewmoela.kuku_msg
(
    msg_id varchar(5) not null
   ,msg_syb varchar(1) not null
   ,msg_ny varchar(100) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_msg_pk primary key
   (
        msg_id
    )
);
comment on table essnewmoela.kuku_msg is '【共通】メッセージ';
comment on column essnewmoela.kuku_msg.msg_id is 'メッセージID';
comment on column essnewmoela.kuku_msg.msg_syb is 'メッセージ種別';
comment on column essnewmoela.kuku_msg.msg_ny is 'メッセージ内容';
comment on column essnewmoela.kuku_msg.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_msg.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_msg.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_msg.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_msg.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_msg.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_msg.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_sb;
create table /*if not exists*/ essnewmoela.kuku_sb
(
    rcd_skb_cd varchar(7) not null
   ,sisn_no numeric(15) not null
   ,all_ktsu numeric(2) not null
   ,skb_cd_ktsu numeric(2) not null
   ,rno_skt numeric(10) not null
   ,rno_max numeric(15) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_sb_pk primary key
   (
        rcd_skb_cd
    )
);
comment on table essnewmoela.kuku_sb is '【共通】採番';
comment on column essnewmoela.kuku_sb.rcd_skb_cd is 'レコード識別コード';
comment on column essnewmoela.kuku_sb.sisn_no is '最新番号';
comment on column essnewmoela.kuku_sb.all_ktsu is '全体桁数';
comment on column essnewmoela.kuku_sb.skb_cd_ktsu is '識別コード桁数';
comment on column essnewmoela.kuku_sb.rno_skt is '連番初期値';
comment on column essnewmoela.kuku_sb.rno_max is '連番最大値';
comment on column essnewmoela.kuku_sb.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_sb.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_sb.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_sb.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_sb.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_sb.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_sb.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_sser_mail;
create table /*if not exists*/ essnewmoela.kuku_sser_mail
(
    err_mail varchar(100)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
);
comment on table essnewmoela.kuku_sser_mail is '【共通】送信エラーメールアドレス';
comment on column essnewmoela.kuku_sser_mail.err_mail is 'エラーメールアドレス';
comment on column essnewmoela.kuku_sser_mail.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_sser_mail.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_sser_mail.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_sser_mail.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_sser_mail.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_sser_mail.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_sser_mail.upd_pg is '更新プログラム';
-- drop index if exists essnewmoela.kuku_sser_mail_ix1;
create index /*if not exists*/ kuku_sser_mail_ix1 on essnewmoela.kuku_sser_mail using btree
(
    err_mail
);
-- drop table if exists essnewmoela.kuku_ssk_wf_grp;
create table /*if not exists*/ essnewmoela.kuku_ssk_wf_grp
(
    ssk_cd varchar(5) not null
   ,wf_grp_cd varchar(2) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_ssk_wf_grp_pk primary key
   (
        ssk_cd
       ,wf_grp_cd
    )
);
comment on table essnewmoela.kuku_ssk_wf_grp is '【共通】組織.ワークフローグループ';
comment on column essnewmoela.kuku_ssk_wf_grp.ssk_cd is '組織コード';
comment on column essnewmoela.kuku_ssk_wf_grp.wf_grp_cd is 'ワークフローグループコード';
comment on column essnewmoela.kuku_ssk_wf_grp.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_ssk_wf_grp.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_ssk_wf_grp.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_ssk_wf_grp.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_ssk_wf_grp.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_ssk_wf_grp.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_ssk_wf_grp.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_sysss_hkfle_kr;
create table /*if not exists*/ essnewmoela.kuku_sysss_hkfle_kr
(
    sysss_hkfle_id varchar(10) not null
   ,sysss_hkfle_kbn varchar(5) not null
   ,sysss_fle_tsy_ym date/*ym*/ not null
   ,jfle_folpt text not null
   ,hjfle_name varchar(200) not null
   ,sysss_fle_ksjk_if jsonb
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_sysss_hkfle_kr_pk primary key
   (
        sysss_hkfle_id
    )
);
comment on table essnewmoela.kuku_sysss_hkfle_kr is '【共通】システム作成保管ファイル管理';
comment on column essnewmoela.kuku_sysss_hkfle_kr.sysss_hkfle_id is 'システム作成保管ファイルID';
comment on column essnewmoela.kuku_sysss_hkfle_kr.sysss_hkfle_kbn is 'システム作成保管ファイル区分';
comment on column essnewmoela.kuku_sysss_hkfle_kr.sysss_fle_tsy_ym is 'システム作成ファイル対象年月';
comment on column essnewmoela.kuku_sysss_hkfle_kr.jfle_folpt is '実ファイルフォルダーパス';
comment on column essnewmoela.kuku_sysss_hkfle_kr.hjfle_name is '表示ファイル名称';
comment on column essnewmoela.kuku_sysss_hkfle_kr.sysss_fle_ksjk_if is 'システム作成ファイル検索条件情報';
comment on column essnewmoela.kuku_sysss_hkfle_kr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_sysss_hkfle_kr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_sysss_hkfle_kr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_sysss_hkfle_kr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_sysss_hkfle_kr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_sysss_hkfle_kr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_sysss_hkfle_kr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_thyss;
create table /*if not exists*/ essnewmoela.kuku_thyss
(
    thyss_no varchar(10) not null
   ,usr_id varchar(20) not null
   ,kin_id varchar(9) not null
   ,thy_srsj_ymd_time timestamp not null
   ,thy_ssjt_kbn varchar(1) not null
   ,srthd_skb varchar(2)
   ,thyss_prmt jsonb
   ,thy_sskka_ymd_time timestamp
   ,thy_fle_folpt text
   ,thy_ksjk_if jsonb
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_thyss_pk primary key
   (
        thyss_no
    )
);
comment on table essnewmoela.kuku_thyss is '【共通】帳票作成';
comment on column essnewmoela.kuku_thyss.thyss_no is '帳票作成番号';
comment on column essnewmoela.kuku_thyss.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_thyss.kin_id is '機能ID';
comment on column essnewmoela.kuku_thyss.thy_srsj_ymd_time is '帳票出力指示年月日時刻';
comment on column essnewmoela.kuku_thyss.thy_ssjt_kbn is '帳票作成状態区分';
comment on column essnewmoela.kuku_thyss.srthd_skb is '処理スレッド識別';
comment on column essnewmoela.kuku_thyss.thyss_prmt is '帳票作成パラメーター';
comment on column essnewmoela.kuku_thyss.thy_sskka_ymd_time is '帳票作成結果年月日時刻';
comment on column essnewmoela.kuku_thyss.thy_fle_folpt is '帳票ファイルフォルダーパス';
comment on column essnewmoela.kuku_thyss.thy_ksjk_if is '帳票検索条件情報';
comment on column essnewmoela.kuku_thyss.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_thyss.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_thyss.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_thyss.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_thyss.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_thyss.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_thyss.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_top_osrs;
create table /*if not exists*/ essnewmoela.kuku_top_osrs
(
    top_osrs_no varchar(5) not null
   ,top_osrs_ymd date not null
   ,top_osrs_ny varchar(500) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_top_osrs_pk primary key
   (
        top_osrs_no
    )
);
comment on table essnewmoela.kuku_top_osrs is '【共通】トップお知らせ';
comment on column essnewmoela.kuku_top_osrs.top_osrs_no is 'トップお知らせ番号';
comment on column essnewmoela.kuku_top_osrs.top_osrs_ymd is 'トップお知らせ年月日';
comment on column essnewmoela.kuku_top_osrs.top_osrs_ny is 'トップお知らせ内容';
comment on column essnewmoela.kuku_top_osrs.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_top_osrs.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_top_osrs.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_top_osrs.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_top_osrs.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_top_osrs.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_top_osrs.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_uyb_kr;
create table /*if not exists*/ essnewmoela.kuku_uyb_kr
(
    uyb_syb varchar(1) not null
   ,sys_ymd date not null
   ,bat_srt_flg varchar(1)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_uyb_kr_pk primary key
   (
        uyb_syb
    )
);
comment on table essnewmoela.kuku_uyb_kr is '【共通】運用日管理';
comment on column essnewmoela.kuku_uyb_kr.uyb_syb is '運用日種別';
comment on column essnewmoela.kuku_uyb_kr.sys_ymd is 'システム年月日';
comment on column essnewmoela.kuku_uyb_kr.bat_srt_flg is 'バッチ処理中フラグ';
comment on column essnewmoela.kuku_uyb_kr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_uyb_kr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_uyb_kr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_uyb_kr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_uyb_kr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_uyb_kr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_uyb_kr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_wf_dtl;
create table /*if not exists*/ essnewmoela.kuku_wf_dtl
(
    wf_no varchar(5) not null
   ,wf_ktord numeric(5) not null
   ,ssk_cd varchar(5) not null
   ,ssk_name varchar(30) not null
   ,kgn_grp_cd varchar(2) not null
   ,kgn_grp_name varchar(100) not null
   ,ys_cd varchar(2) not null
   ,ys_name varchar(100) not null
   ,wf_sri_yt timestamp
   ,wf_sri_kbn varchar(1)
   ,dr_um_kbn varchar(1)
   ,usr_id varchar(20)
   ,usr_name varchar(15)
   ,wf_cmnt varchar(100)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_wf_dtl_pk primary key
   (
        wf_no
       ,wf_ktord
    )
);
comment on table essnewmoela.kuku_wf_dtl is '【共通】ワークフローDTL';
comment on column essnewmoela.kuku_wf_dtl.wf_no is 'ワークフロー番号';
comment on column essnewmoela.kuku_wf_dtl.wf_ktord is 'ワークフロー工程順';
comment on column essnewmoela.kuku_wf_dtl.ssk_cd is '組織コード';
comment on column essnewmoela.kuku_wf_dtl.ssk_name is '組織名称';
comment on column essnewmoela.kuku_wf_dtl.kgn_grp_cd is '権限グループコード';
comment on column essnewmoela.kuku_wf_dtl.kgn_grp_name is '権限グループ名称';
comment on column essnewmoela.kuku_wf_dtl.ys_cd is '役職コード';
comment on column essnewmoela.kuku_wf_dtl.ys_name is '役職名称';
comment on column essnewmoela.kuku_wf_dtl.wf_sri_yt is 'ワークフロー処理日時';
comment on column essnewmoela.kuku_wf_dtl.wf_sri_kbn is 'ワークフロー処理区分';
comment on column essnewmoela.kuku_wf_dtl.dr_um_kbn is '代理有無区分';
comment on column essnewmoela.kuku_wf_dtl.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_wf_dtl.usr_name is 'ユーザー名称';
comment on column essnewmoela.kuku_wf_dtl.wf_cmnt is 'ワークフローコメント';
comment on column essnewmoela.kuku_wf_dtl.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_wf_dtl.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_wf_dtl.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_wf_dtl.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_wf_dtl.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_wf_dtl.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_wf_dtl.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_wf_grp_kfpt_kot;
create table /*if not exists*/ essnewmoela.kuku_wf_grp_kfpt_kot
(
    wf_grp_cd varchar(2) not null
   ,wf_kfpt_cd varchar(2) not null
   ,wf_ktord numeric(5) not null
   ,ssk_cd varchar(5)
   ,kgn_grp_cd varchar(2)
   ,ys_cd varchar(2)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_wf_grp_kfpt_kot_pk primary key
   (
        wf_grp_cd
       ,wf_kfpt_cd
       ,wf_ktord
    )
);
comment on table essnewmoela.kuku_wf_grp_kfpt_kot is '【共通】ワークフローグループ回付パターン工程';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.wf_grp_cd is 'ワークフローグループコード';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.wf_kfpt_cd is 'ワークフロー回付パターンコード';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.wf_ktord is 'ワークフロー工程順';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.ssk_cd is '組織コード';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.kgn_grp_cd is '権限グループコード';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.ys_cd is '役職コード';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_wf_grp_kfpt_kot.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_wf_hdr;
create table /*if not exists*/ essnewmoela.kuku_wf_hdr
(
    wf_no varchar(5) not null
   ,wf_grp_cd varchar(2) not null
   ,wf_kfpt_cd varchar(2) not null
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_wf_hdr_pk primary key
   (
        wf_no
    )
);
comment on table essnewmoela.kuku_wf_hdr is '【共通】ワークフローHDR';
comment on column essnewmoela.kuku_wf_hdr.wf_no is 'ワークフロー番号';
comment on column essnewmoela.kuku_wf_hdr.wf_grp_cd is 'ワークフローグループコード';
comment on column essnewmoela.kuku_wf_hdr.wf_kfpt_cd is 'ワークフロー回付パターンコード';
comment on column essnewmoela.kuku_wf_hdr.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_wf_hdr.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_wf_hdr.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_wf_hdr.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_wf_hdr.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_wf_hdr.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_wf_hdr.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_wf_hji;
create table /*if not exists*/ essnewmoela.kuku_wf_hji
(
    wf_no varchar(5) not null
   ,wf_ktord numeric(5)
   ,wf_lsri_ymd timestamp not null
   ,wf_jk_cd varchar(2) not null
   ,jgsyn_kbn varchar(1) not null
   ,kin_id varchar(9) not null
   ,gm_sri_mode varchar(10) not null
   ,wf_syb_cd varchar(3) not null
   ,ssk_cd varchar(5) not null
   ,ssk_name varchar(30) not null
   ,usr_id varchar(20) not null
   ,usr_name varchar(15) not null
   ,gm_kekm varchar(10)
   ,gm_kekm_hisno numeric(5)
   ,dp_ymd varchar(10)
   ,ku_ymd date
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_wf_hji_pk primary key
   (
        wf_no
    )
);
comment on table essnewmoela.kuku_wf_hji is '【共通】ワークフロー保持';
comment on column essnewmoela.kuku_wf_hji.wf_no is 'ワークフロー番号';
comment on column essnewmoela.kuku_wf_hji.wf_ktord is 'ワークフロー工程順';
comment on column essnewmoela.kuku_wf_hji.wf_lsri_ymd is 'ワークフロー最終処理年月日';
comment on column essnewmoela.kuku_wf_hji.wf_jk_cd is 'ワークフロー状況コード';
comment on column essnewmoela.kuku_wf_hji.jgsyn_kbn is '事後承認区分';
comment on column essnewmoela.kuku_wf_hji.kin_id is '機能ID';
comment on column essnewmoela.kuku_wf_hji.gm_sri_mode is '画面処理モード';
comment on column essnewmoela.kuku_wf_hji.wf_syb_cd is 'ワークフロー種別コード';
comment on column essnewmoela.kuku_wf_hji.ssk_cd is '組織コード';
comment on column essnewmoela.kuku_wf_hji.ssk_name is '組織名称';
comment on column essnewmoela.kuku_wf_hji.usr_id is 'ユーザーID';
comment on column essnewmoela.kuku_wf_hji.usr_name is 'ユーザー名称';
comment on column essnewmoela.kuku_wf_hji.gm_kekm is '画面キー項目';
comment on column essnewmoela.kuku_wf_hji.gm_kekm_hisno is '画面キー項目履歴番号';
comment on column essnewmoela.kuku_wf_hji.dp_ymd is '伝票年月日';
comment on column essnewmoela.kuku_wf_hji.ku_ymd is '借受年月日';
comment on column essnewmoela.kuku_wf_hji.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_wf_hji.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_wf_hji.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_wf_hji.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_wf_hji.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_wf_hji.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_wf_hji.upd_pg is '更新プログラム';
-- drop table if exists essnewmoela.kuku_wf_kfpt_hti;
create table /*if not exists*/ essnewmoela.kuku_wf_kfpt_hti
(
    kin_id varchar(9) not null
   ,gm_sri_mode varchar(10) not null
   ,wf_kfpt_cd varchar(2) not null
   ,wf_kfpt_hti_srord numeric(5) not null
   ,wf_syb_cd varchar(3) not null
   ,jgsyn_kh_kbn varchar(1) not null
   ,wf_kfpt_hti_jkn_1 varchar(100)
   ,wf_kfpt_hti_jkn_2 varchar(100)
   ,wf_kfpt_hti_jkn_3 varchar(100)
   ,wf_kfpt_hti_jkn_4 varchar(100)
   ,wf_kfpt_hti_jkn_5 varchar(100)
   ,gymev_name varchar(20)
   ,tr_ymd_time timestamp not null default current_timestamp
   ,tr_usr varchar(32) not null default user
   ,tr_pg varchar(128)
   ,upd_ymd_time timestamp
   ,upd_usr varchar(32)
   ,upd_pg varchar(128)
   ,constraint kuku_wf_kfpt_hti_pk primary key
   (
        kin_id
       ,gm_sri_mode
       ,wf_kfpt_cd
       ,wf_kfpt_hti_srord
    )
);
comment on table essnewmoela.kuku_wf_kfpt_hti is '【共通】ワークフロー回付パターン判定';
comment on column essnewmoela.kuku_wf_kfpt_hti.kin_id is '機能ID';
comment on column essnewmoela.kuku_wf_kfpt_hti.gm_sri_mode is '画面処理モード';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_cd is 'ワークフロー回付パターンコード';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_srord is 'ワークフロー回付パターン判定処理順';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_syb_cd is 'ワークフロー種別コード';
comment on column essnewmoela.kuku_wf_kfpt_hti.jgsyn_kh_kbn is '事後承認可否区分';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_jkn_1 is 'ワークフロー回付パターン判定条件1';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_jkn_2 is 'ワークフロー回付パターン判定条件2';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_jkn_3 is 'ワークフロー回付パターン判定条件3';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_jkn_4 is 'ワークフロー回付パターン判定条件4';
comment on column essnewmoela.kuku_wf_kfpt_hti.wf_kfpt_hti_jkn_5 is 'ワークフロー回付パターン判定条件5';
comment on column essnewmoela.kuku_wf_kfpt_hti.gymev_name is '業務イベント名称';
comment on column essnewmoela.kuku_wf_kfpt_hti.tr_ymd_time is '登録年月日時刻';
comment on column essnewmoela.kuku_wf_kfpt_hti.tr_usr is '登録ユーザー';
comment on column essnewmoela.kuku_wf_kfpt_hti.tr_pg is '登録プログラム';
comment on column essnewmoela.kuku_wf_kfpt_hti.upd_ymd_time is '更新年月日時刻';
comment on column essnewmoela.kuku_wf_kfpt_hti.upd_usr is '更新ユーザー';
comment on column essnewmoela.kuku_wf_kfpt_hti.upd_pg is '更新プログラム';
