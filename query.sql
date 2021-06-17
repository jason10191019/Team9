set sql_safe_updates=0;
delete from tag;
insert into tag(target,tag,time,good,face)
select 代號,'近一周融資劇增',0,1,1 from (
select 代號,sum(融資) as 5日融資, sum(融券) as 5日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 5日融資>2500;
insert into tag(target,tag,time,good,face)
select 代號,'近一周融資劇減',0,0,1 from (
select 代號,sum(融資) as 5日融資, sum(融券) as 5日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 5日融資<-2500;
insert into tag(target,tag,time,good,face)
select 代號,'近一周融券劇增',0,0,1 from (
select 代號,sum(融資) as 5日融資, sum(融券) as 5日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 5日融券>2500;
insert into tag(target,tag,time,good,face)
select 代號,'近一周融券劇增',0,1,1 from (
select 代號,sum(融資) as 5日融資, sum(融券) as 5日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 5日融券<-2500;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資買超前10名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資買超前50名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資買超前100名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資賣超前10名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資賣超前50名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周外資賣超前100名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一周外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周外資買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信買超前10名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信買超前50名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信買超前100名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信賣超前10名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信賣超前50名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周投信賣超前100名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一周投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周投信買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商買超前10名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商買超前50名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商買超前100名',0,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商賣超前10名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商賣超前50名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一周自營商賣超前100名',0,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一周自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 group by 代號 order by 一周自營商買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'外資連買3日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'外資連賣3日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'外資連買5日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'外資連賣5日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'外資連買10日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'外資連賣10日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.外資*today.外資>0) as same
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,外資
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.外資<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連買3日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連賣3日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連買5日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連賣5日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連買10日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'自營商連賣10日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.自營商*today.自營商>0) as same
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,自營商
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.自營商<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'投信連買3日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'投信連賣3日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 3) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=3;

insert into tag(target,tag,time,good,face)
select 代號,'投信連買5日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'投信連賣5日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 5) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=5;

insert into tag(target,tag,time,good,face)
select 代號,'投信連買10日',0,1,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信>0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'投信連賣10日',0,0,1  from(
select 代號,sum(same) as sum from
(
select fiveday.*,(fiveday.投信*today.投信>0) as same
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 10) as date
where 法人進出.日期=date.日期 order by 代號,法人進出.日期 desc) as fiveday,
(
select 代號,法人進出.日期,投信
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1) as date
where 法人進出.日期=date.日期 and 法人進出.投信<0 order by 代號,法人進出.日期 desc)as today
where today.代號=fiveday.代號 )as cnt group by 代號) as cnt where sum=10;

insert into tag(target,tag,time,good,face)
select 代號,'外資由賣轉買',0,1,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.外資*today.外資<0) as notsame
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,外資 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 外資>0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'外資由買轉賣',0,0,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.外資*today.外資<0) as notsame
from
(
select 代號,法人進出.日期,外資
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,外資 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 外資<0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'投信由賣轉買',0,1,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.投信*today.投信<0) as notsame
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,投信 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 投信>0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'投信由買轉賣',0,0,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.投信*today.投信<0) as notsame
from
(
select 代號,法人進出.日期,投信
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,投信 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 投信<0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'自營商由賣轉買',0,1,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.自營商*today.自營商<0) as notsame
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,自營商 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 自營商>0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'自營商由買轉賣',0,0,1  from(
select 代號,sum(notsame) as cnt from(
select fewday.代號,日期,(fewday.自營商*today.自營商<0) as notsame
from
(
select 代號,法人進出.日期,自營商
from 法人進出,
(
select 日期
from
(
SELECT @rownum := @rownum+1 AS 'Rank', a.*
FROM (SELECT distinct 日期
       FROM 法人進出 
       ORDER BY 日期 DESC) a, (SELECT @rownum := 0) r )as date
where date.Rank>1 and date.Rank<=4)as date
where 法人進出.日期=date.日期) as fewday,
(
select 代號,自營商 
from 法人進出,
(select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 自營商<0) as today
where today.代號=fewday.代號)as notsame
group by 代號)as notsame
where notsame.cnt=3;

insert into tag(target,tag,time,good,face)
select 代號,'土洋合作買超',0,1,1  
from 法人進出,(
select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 外資>0 and 投信>0 and 自營商>0;

insert into tag(target,tag,time,good,face)
select 代號,'土洋合作賣超',0,0,1  
from 法人進出,(
select distinct 日期 from 法人進出 order by 日期 desc limit 1)as date
where 法人進出.日期=date.日期 and 外資<0 and 投信<0 and 自營商<0;

insert into tag(target,tag,time,good,face)
select 代號,'近一周籌碼集中',0,1,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(5日買進-5日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 5)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)>0.2) a;

insert into tag(target,tag,time,good,face)
select 代號,'近一周籌碼分散',0,0,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(5日買進-5日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 5)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)<-0.2) a ;

insert into tag(target,tag,time,good,face)
select ThisWeek.代號,'大股東持股增加',0,1,1
from (
select 代號,`占集保庫存數比例%`as 比例 
from 股權分布,(
select 資料日期, Rank() over(order by 資料日期) as My_rank 
from(
select distinct 資料日期   from 股權分布 order by 資料日期 desc)as a)as a
where 股權分布.資料日期=a.資料日期 and a.My_rank =2 and 持股分級=15)as ThisWeek,
(
select 代號,`占集保庫存數比例%` as 比例
from 股權分布,(
select 資料日期, Rank() over(order by 資料日期) as My_rank 
from(
select distinct 資料日期   from 股權分布 order by 資料日期 desc)as a)as a
where 股權分布.資料日期=a.資料日期 and a.My_rank =1 and 持股分級=15)as LastWeek
where ThisWeek.代號=LastWeek.代號 and ThisWeek.比例-LastWeek.比例>1;

insert into tag(target,tag,time,good,face)
select ThisWeek.代號,'大股東持股減少',0,0,1
from (
select 代號,`占集保庫存數比例%`as 比例 
from 股權分布,(
select 資料日期, Rank() over(order by 資料日期) as My_rank 
from(
select distinct 資料日期   from 股權分布 order by 資料日期 desc)as a)as a
where 股權分布.資料日期=a.資料日期 and a.My_rank =2 and 持股分級=15)as ThisWeek,
(
select 代號,`占集保庫存數比例%` as 比例
from 股權分布,(
select 資料日期, Rank() over(order by 資料日期) as My_rank 
from(
select distinct 資料日期   from 股權分布 order by 資料日期 desc)as a)as a
where 股權分布.資料日期=a.資料日期 and a.My_rank =1 and 持股分級=15)as LastWeek
where ThisWeek.代號=LastWeek.代號 and ThisWeek.比例-LastWeek.比例<-1;

insert into tag(target,tag,time,good,face)
select 代號,'近一月融資劇增',1,1,1 from (
select 代號,sum(融資) as 20日融資, sum(融券) as 20日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 20日融資>500*20;
insert into tag(target,tag,time,good,face)
select 代號,'近一月融資劇減',1,0,1 from (
select 代號,sum(融資) as 20日融資, sum(融券) as 20日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 20日融資<-500*20;
insert into tag(target,tag,time,good,face)
select 代號,'近一月融券劇增',1,0,1 from (
select 代號,sum(融資) as 20日融資, sum(融券) as 20日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 20日融券>500*20;
insert into tag(target,tag,time,good,face)
select 代號,'近一月融券劇增',1,1,1 from (
select 代號,sum(融資) as 20日融資, sum(融券) as 20日融券
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 5) as date
where a.日期=date.日期 group by 代號  )as d where 20日融券<-500*20;

insert into tag(target,tag,time,good,face)
select 代號,'融資使用率過高',1,0,1
from 融資融券 as a,(
select distinct 日期 from 融資融券 order by 日期 desc limit 1) as date
where a.日期=date.日期 and 融資使用率>30;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月外資賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一月外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月外資買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月投信賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一月投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月投信買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一月自營商賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一月自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 20) as date
where 法人進出.日期=date.日期 group by 代號 order by 一月自營商買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季外資賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(外資) as 一季外資買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季外資買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季投信賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(投信) as 一季投信買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季投信買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商買超前10名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商買超前50名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商買超前100名',1,1,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超 desc limit 100)as  a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商賣超前10名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超  limit 100) a) as r
where r.Rank>=1 and r.Rank<=10;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商賣超前50名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超  limit 100) a) as r
where r.Rank>=11 and r.Rank<=50;

insert into tag(target,tag,time,good,face)
select 代號,'近一季自營商賣超前100名',1,0,1
from(
select a.*,@rownum := @rownum+1 AS 'Rank'
from (SELECT @rownum := 0) r,(
select 代號,sum(自營商) as 一季自營商買賣超 
from 法人進出,
(select distinct 日期 from 融資融券 order by 日期 desc limit 60) as date
where 法人進出.日期=date.日期 group by 代號 order by 一季自營商買賣超  limit 100) a) as r
where r.Rank>=51 and r.Rank<=100;

insert into tag(target,tag,time,good,face)
select 代號,'近一月籌碼集中',1,1,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(20日買進-20日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 20)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)>0.15) a;

insert into tag(target,tag,time,good,face)
select 代號,'近一月籌碼分散',1,0,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(20日買進-20日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 20)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)<-0.15) a ;

insert into tag(target,tag,time,good,face)
select 代號,'近一季籌碼集中',1,1,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(60日買進-60日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 60)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)>0.1) a;

insert into tag(target,tag,time,good,face)
select 代號,'近一季籌碼分散',1,0,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(60日買進-60日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 60)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)<-0.1) a ;
insert into tag(target,tag,time,good,face)
select 代號,'近一年籌碼集中',1,1,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(240日買進-240日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 240)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)>0.1) a;

insert into tag(target,tag,time,good,face)
select 代號,'近一年籌碼分散',1,0,1 from(
select 集中.代號,if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)as 籌碼集中度
from
(
SELECT 代號,(240日買進-240日賣出) as 張數 FROM finalproject.券商進出
where 更新日期=(select distinct 日期 from 法人進出 order by 日期 desc limit 1)) as 集中,
(select 代號,sum(volume)/1000 as 成交量
from 股價,
(select distinct date from 股價 order by date desc limit 240)AS date
where 股價.date =date.date group by 代號 order by 代號)as 成交量
where 集中.代號=成交量.代號 and if(集中.張數/成交量.成交量>1,集中.張數/成交量.成交量/1000,集中.張數/成交量.成交量)<-0.1) a ;

insert into tag(target,tag,time,good,face)
select 代號 ,'大股東持有比>70%',1,1,1  from(
SELECT 代號, sum(`占集保庫存數比例%`)as 集中,資料日期,持股分級 FROM finalproject.股權分布
where 資料日期=(select  distinct 資料日期 from 股權分布 order by 資料日期 desc limit 1) and 持股分級=15 
group by 代號 order by 集中)as a
where 集中>70;

insert into tag(target,tag,time,good,face)
select 代號 ,'董監持股>35%',1,1,1  from
價值
where 董監持股>35 and 更新日期=(select max(更新日期) from 價值);

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創60日新高',0,1,2  from(
select today.代號 from
(select 代號,max(high) as 最高價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 60)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格>max.最高價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=60)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創60日新低',0,0,2  from(
select today.代號 from
(select 代號,min(low) as 最低價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 60)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格<max.最低價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=60)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創20日新高',0,1,2  from(
select today.代號 from
(select 代號,max(high) as 最高價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 20)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格>max.最高價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=20)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創20日新低',0,0,2  from(
select today.代號 from
(select 代號,min(low) as 最低價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 20)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格<max.最低價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=20)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創5日新高',0,1,2  from(
select today.代號 from
(select 代號,max(high) as 最高價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 5)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格>max.最高價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=5)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創5日新低',0,0,2  from(
select today.代號 from
(select 代號,min(low) as 最低價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 5)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格<max.最低價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=5)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'跌破月均線',0,0,2  from(
select a.代號,a.close, 今日日均線.20均
from 股價 a,股價 b,(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close<今日日均線.20均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close>昨日日均線.20均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'突破月均線',0,1,2  from (
select a.代號,a.close, 今日日均線.20均
from 股價 a,股價 b,(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close>今日日均線.20均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close<昨日日均線.20均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'跌破雙周均線',0,0,2  from(
select a.代號,a.close, 今日日均線.10均
from 股價 a,股價 b,(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close<今日日均線.10均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close>昨日日均線.10均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'突破雙周均線',0,1,2  from (
select a.代號,a.close, 今日日均線.10均
from 股價 a,股價 b,(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close>今日日均線.10均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close<昨日日均線.10均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'跌破周均線',0,0,2  from(
select a.代號,a.close, 今日日均線.5均
from 股價 a,股價 b,(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close<今日日均線.5均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close>昨日日均線.5均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'突破周均線',0,1,2  from (
select a.代號,a.close, 今日日均線.5均
from 股價 a,股價 b,(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close>今日日均線.5均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close<昨日日均線.5均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'日均線多頭排列',0,1,2  from (
select distinct 周均線.代號 from
(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 周均線,
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 雙周均線,
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 月均線,
(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 季均線
where 周均線.5均>雙周均線.10均 and 雙周均線.10均>月均線.20均 and 月均線.20均>季均線.60均
and 周均線.代號=雙周均線.代號 and 雙周均線.代號=月均線.代號 and 月均線.代號=季均線.代號
)a ;

insert into tag(target,tag,time,good,face)
select 代號 ,'日均線空頭排列',0,0,2  from (
select distinct 周均線.代號 from
(
select 代號,(avg(close))as 5均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as 周均線,
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as 雙周均線,
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as 月均線,
(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 季均線
where 周均線.5均<雙周均線.10均 and 雙周均線.10均<月均線.20均 and 月均線.20均<季均線.60均
and 周均線.代號=雙周均線.代號 and 雙周均線.代號=月均線.代號 and 月均線.代號=季均線.代號)
as a;

insert into tag(target,tag,time,good,face)
select 代號 ,'周線多頭',0,1,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 desc limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'周線空頭',0,0,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'雙周線多頭',0,1,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 desc limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'雙周線空頭',0,0,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'月線多頭',0,1,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 desc limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'月線空頭',0,0,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價突破糾結均線',0,1,2  from (
select distinct b.代號,((b.close-max)/max) as 突破數 ,min,max,b.close from
(
select 代號,min(均) as min,max(均) as max
from(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號
union
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號)
union
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號)) as a group by 代號)as a,股價 b,股價 c
where b.date=(select max(date) from 股價) and
c.date = (select date from 股價 where date!=(select max(date) from 股價) order by date desc limit 1) and
c.date!=b.date and a.代號=b.代號 and (max-min)/min<=0.02 and (b.close-c.close)/c.close>=0.03 and b.close>max and b.代號=c.代號)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價跌破糾結均線',0,0,2  from (
select distinct b.代號,((b.close-min)/min) as 突破數 ,min,max,b.close from
(
select 代號,min(均) as min,max(均) as max
from(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 5 )as yesterday
where 股價.date=yesterday.date group by 代號
union
(
select 代號,(avg(close))as 10均
from 股價,
(select distinct date from 股價 order by date desc limit 10 )as yesterday
where 股價.date=yesterday.date group by 代號)
union
(
select 代號,(avg(close))as 20均
from 股價,
(select distinct date from 股價 order by date desc limit 20 )as yesterday
where 股價.date=yesterday.date group by 代號)) as a group by 代號)as a,股價 b,股價 c
where b.date=(select max(date) from 股價) and
c.date = (select date from 股價 where date!=(select max(date) from 股價) order by date desc limit 1) and
c.date!=b.date and a.代號=b.代號 and (max-min)/min<=0.02 and (b.close-c.close)/c.close<=-0.03 and b.close<min and b.代號=c.代號)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價跌破下關價',0,0,2  from (
select 股價.代號,close
from 股價,(
select 代號,(high-(high-low)*1.382) as 下關價
from 股價,
(select date from 股價 where date !=(select max(date) from 股價) order by date desc limit 1 )as yesterday
where 股價.date=yesterday.date group by 代號)下關價
where 股價.代號=下關價.代號 and 股價.close<下關價.下關價 and 股價.date=(select max(date) from 股價))a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價突破上關價',0,1,2  from (
select 股價.代號,close
from 股價,(
select 代號,(low+(high-low)*1.382) as 上關價
from 股價,
(select date from 股價 where date !=(select max(date) from 股價) order by date desc limit 1 )as yesterday
where 股價.date=yesterday.date group by 代號)上關價
where 股價.代號=上關價.代號 and 股價.close>上關價.上關價 and 股價.date=(select max(date) from 股價))a;

insert into tag(target,tag,time,good,face)
select 代號 ,'跌破季均線',1,0,2  from(
select a.代號,a.close, 今日日均線.60均
from 股價 a,股價 b,(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close<今日日均線.60均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close>昨日日均線.60均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'突破季均線',1,1,2  from (
select a.代號,a.close, 今日日均線.60均
from 股價 a,股價 b,(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 今日日均線,
(
select 代號,(avg(close))as 60均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as 昨日日均線
where a.代號=今日日均線.代號 and a.close>今日日均線.60均 and a.date=(select max(date) from 股價) and
b.date=(select date from 股價 where date!=(select max(date) from 股價 where date) order by date desc limit 1) and
b.close<昨日日均線.60均 and a.代號=b.代號 AND b.代號=昨日日均線.代號
)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'季線多頭',1,1,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 desc limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'季線空頭',1,0,2  from (
select close.代號,((today.均- yesterday.均)/close.close) as 成長幅度
from
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as today,
(
select 代號,(avg(close))as 均
from 股價,
(select distinct date from 股價 where date!=(select max(date) from 股價)order by date desc limit 60 )as yesterday
where 股價.date=yesterday.date group by 代號) as yesterday,
(select 代號,close
from 股價
where date=(select max(date) from 股價))as close
where today.代號=yesterday.代號 and yesterday.代號=close.代號
order by 成長幅度 limit 50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創240日新高',1,1,2  from(
select today.代號 from
(select 代號,max(high) as 最高價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 240)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格>max.最高價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=240)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創240日新低',1,0,2  from(
select today.代號 from
(select 代號,min(low) as 最低價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 240)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格<max.最低價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=240)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創120日新高',1,1,2  from(
select today.代號 from
(select 代號,max(high) as 最高價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 120)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格>max.最高價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=120)
) a;

insert into tag(target,tag,time,good,face)
select 代號 ,'股價創120日新低',1,0,2  from(
select today.代號 from
(select 代號,min(low) as 最低價 from
(SELECT distinct date FROM finalproject.股價 where date!=(select max(date)from 股價) order by date desc limit 120)as date,
股價
where 股價.date=date.date
group by 代號) as max,
(select 代號,close as 當日價格 from
(SELECT distinct date FROM finalproject.股價 order by date desc limit 1)as date,
股價
where 股價.date=date.date
group by 代號)as today
where today.當日價格<max.最低價 and today.代號=max.代號 and
today.代號 in (select 代號 from(
select 代號,count(*) as cnt
from 股價
group by 代號)days
where days.cnt>=120)
) a;

insert into tag(target,tag,time,good,face)
select target ,'近12月營收同業前>20% ',1,1,3  from(
select target,產業類別 from
(
select T1.* from(

select target,avg,b.產業類別,if(b.cnt*0.2<1,1,b.cnt*0.2) as take_rank
from 上市公司列表 c,
(
select avg(Earn)  avg ,target
from 月營收
where month between '2020/5/1' and '2021/4/1'
group by target) a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where target=代號 and b.產業類別=c.產業類別) as T1
LEFT JOIN
(
select distinct avg,b.產業類別,if(b.cnt*0.2<1,1,b.cnt*0.2) as take_rank
from 上市公司列表 c,(
select avg(Earn) avg ,target
from 月營收
where month between '2020/5/1' and '2021/4/1'
group by target) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where target=代號 and b.產業類別=c.產業類別) T2
ON T1.產業類別=T2.產業類別
AND T1.avg<T2.avg
GROUP BY target,avg,產業類別
HAVING count(1)<=T1.take_rank
ORDER BY T1.target,產業類別) a)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近4季毛利率>50% ',1,1,3  from(
select 代號,近4季平均毛利率
from(
select 代號,avg(毛利率) as 近4季平均毛利率
from 季營收
where 季度 between '2020-2' and '2021-1'
group by 代號) as a
where 近4季平均毛利率>50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近8季毛利率>50% ',1,1,3  from(
select 代號,近8季平均毛利率
from(
select 代號,avg(毛利率) as 近8季平均毛利率
from 季營收
where 季度 between '2019-2' and '2021-1'
group by 代號) as a
where 近8季平均毛利率>50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近12季毛利率>50% ',1,1,3  from(
select 代號,近12季平均毛利率
from(
select 代號,avg(毛利率) as 近12季平均毛利率
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a
where 近12季平均毛利率>50)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近3年毛利率在同業前20%',1,1,3  from(
select 代號,產業類別 from
(
select T1.*
from
(
select a.代號,avg,b.產業類別,if(b.cnt*0.20<1,1,b.cnt*0.20) as take_rank
from 上市公司列表 c,(
select avg(毛利率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別)as T1
LEFT JOIN
(
select distinct avg,b.產業類別,if(b.cnt*0.20<1,1,b.cnt*0.2) as take_rank
from 上市公司列表 c,(
select avg(毛利率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別) T2
ON T1.產業類別=T2.產業類別
AND T1.avg<T2.avg
GROUP BY 代號,avg,產業類別
HAVING count(1)<=T1.take_rank
ORDER BY T1.代號,產業類別) a)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近4季營業利益率>20%',1,1,3  from(
select 代號,近4季平均營業利益率
from(
select 代號,avg(營業利益率) as 近4季平均營業利益率
from 季營收
where 季度 between '2020-2' and '2021-1'
group by 代號) as a
where 近4季平均營業利益率>20)as a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近8季平均營業利益率>20%',1,1,3  from(
select 代號,近8季平均營業利益率
from(
select 代號,avg(營業利益率) as 近8季平均營業利益率
from  季營收
where 季度 between '2019-2' and '2021-1'
group by 代號) as a
where 近8季平均營業利益率>20)as a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近12季營業利益率>20%',1,1,3  from(
select 代號,近12季平均營業利益率
from(
select 代號,avg(營業利益率) as 近12季平均營業利益率
from  季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a
where 近12季平均營業利益率>20)as a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近3年營業利益率在同業前10%',1,1,3  from(
select 代號,產業類別 from
(
select T1.*
from
(
select a.代號,avg,b.產業類別,if(b.cnt*0.1<1,1,b.cnt*0.1) as take_rank
from 上市公司列表 c,(
select avg(營業利益率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別)as T1
LEFT JOIN
(
select a.代號,avg,b.產業類別,if(b.cnt*0.1<1,1,b.cnt*0.1) as take_rank
from 上市公司列表 c,(
select avg(營業利益率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別) as T2
ON T1.產業類別=T2.產業類別
AND T1.avg<T2.avg
GROUP BY 代號,avg,產業類別
HAVING count(1)<=T1.take_rank
ORDER BY T1.代號,產業類別)as a) a ;

insert into tag(target,tag,time,good,face)
select 代號 ,'近3年營業利益率在同業前5%',1,1,3  from(
select 代號,產業類別 from
(
select T1.*
from
(
select a.代號,avg,b.產業類別,if(b.cnt*0.05<1,1,b.cnt*0.05) as take_rank
from 上市公司列表 c,(
select avg(營業利益率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別)as T1
LEFT JOIN
(
select distinct avg,b.產業類別,if(b.cnt*0.05<1,1,b.cnt*0.05) as take_rank
from 上市公司列表 c,(
select avg(營業利益率) avg ,代號
from 季營收
where 季度 between '2018-2' and '2021-1'
group by 代號) as a,
(select 產業類別, count(*) as cnt from 上市公司列表 group by 產業類別) b
where a.代號=c.代號 and b.產業類別=c.產業類別) T2
ON T1.產業類別=T2.產業類別
AND T1.avg<T2.avg
GROUP BY 代號,avg,產業類別
HAVING count(1)<=T1.take_rank
ORDER BY T1.代號,產業類別) a)a;

insert into tag(target,tag,time,good,face)
select target,'月營收月成長率(MoM)>20%',1,1,3  from(
select a.* from
月營收 a,
(
select max(month) as month ,target
from 月營收
group by target) as date
where a.month=date.month and a.target=date.target and a.MoM>20)a;

insert into tag(target,tag,time,good,face)
select target ,'月營收年成長率(YoY)>20%',1,1,3  from(
select a.* from
月營收 a,
(
select max(month) as month ,target
from 月營收
group by target) as date
where a.month=date.month and a.target=date.target and a.YoY>20)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'過去三年平均股利',1,1,3  from(
SELECT 代號,3年平均股利
FROM 價值
WHERE 3年平均股利>3)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'過去三年平均股利',1,1,3  from(
SELECT 代號,6年平均股利
FROM 價值
WHERE 6年平均股利>6)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'過去三年平均股利',1,1,3  from(
SELECT 代號,10年平均股利
FROM 價值
WHERE 10年平均股利>10)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'現金殖利率>5%',1,1,3  from(
SELECT 代號,現金殖利率
FROM 價值
WHERE 現金殖利率>5)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'近十年現金股利發放率>80%',1,1,3  from(
SELECT 代號,10年股利次數/10
FROM 價值
WHERE 10年股利次數>8)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'低股價淨值比',1,1,3  from(
SELECT 代號,股價淨值比 FROM finalproject.價值
where 股價淨值比<1.2)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'高股價淨值比',1,0,3  from(
SELECT 代號,股價淨值比 FROM finalproject.價值
where 股價淨值比>2)a;

insert into tag(target,tag,time,good,face)
select 代號 ,'低本益比',1,1,3  from(
SELECT 代號,本益比
FROM 價值
WHERE 本益比<15 and 本益比>0)a ;