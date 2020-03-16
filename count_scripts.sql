select
'20200316_0700' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 7:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 7:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_0800' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 8:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 8:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_0900' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 9:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 9:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1000' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 10:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 10:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1100' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 11:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 11:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1200' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 12:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 12:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1300' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 13:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 13:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1400' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 14:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 14:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1500' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 15:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 15:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1600' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 16:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 16:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1700' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 17:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 17:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1800' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 18:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 18:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_1900' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 19:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 19:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_2000' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 20:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 20:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_2100' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 21:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 21:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_2200' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 22:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 22:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
union -------------------------------------------------------------------
select
'20200316_2300' "DAY/TIME",
count(*) "COURSE_COUNT"
from ps_class_tbl c,
ps_class_mtg_pat m
where c.crse_id = m.crse_id
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 23:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 23:59:59','yyyy-mm-dd hh24:mi:ss')
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
--m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun
and c.strm = '2202'
and stnd_mtg_pat <> 'TBA' -- cannot know schedule if not entered
