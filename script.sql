-- SJSU James Anderosn 3/13/2020
-- Get class info and instructor info for the next two weeks (3/13/2020 - 3/28/2020)
-- 7,239 term and dates
select c.crse_id, c.crse_offer_nbr, c.strm, c.session_code, c.class_section,
c.subject, c.catalog_nbr, c.class_section, c.descr, c.enrl_tot,
m.class_mtg_nbr, m.facility_id, m.stnd_mtg_pat, m.start_dt, m.end_dt,
m.meeting_time_start, m.meeting_time_end, m.mon, m.tues, m.wed, m.thurs, m.fri, m.sat, m.sun,
i.instr_assign_seq, i.emplid, i.instr_role,
ue.first_name, ue.last_name, ue.email_addr
from ps_class_tbl c,
ps_class_mtg_pat m,
ps_class_instr i,
ps_sj_ucat_empl ue
where c.crse_id = m.crse_id
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and i.crse_id = m.crse_id
and i.crse_offer_nbr = m.crse_offer_nbr
and i.strm = m.strm
and i.session_code = m.session_code 
and i.class_section = m.class_section
and i.class_mtg_nbr = m.class_mtg_nbr
--and i.emplid = '011540555'
and i.emplid = ue.emplid
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
and c.strm = '2202'

-- Top 20 classes this hour
select * from (
select
to_char(m.meeting_time_start,'hh:mi PM') "START", 
to_char(m.meeting_time_end,'hh:mi PM') "END", 
c.enrl_tot "STUDENT COUNT",
ue.first_name || ' ' || ue.last_name || ' - ' || ue.email_addr "INSTRUCTOR",
c.subject || trim(c.catalog_nbr) || ' Sec: ' || trim(c.class_section) || ' - ' || c.descr "CLASS DESCRIPTION"
from ps_class_tbl c,
ps_class_mtg_pat m,
ps_class_instr i,
ps_sj_ucat_empl ue
where c.crse_id = m.crse_id
and c.crse_offer_nbr = m.crse_offer_nbr
and c.strm = m.strm
and c.session_code = m.session_code 
and c.class_section = m.class_section
and i.crse_id = m.crse_id
and i.crse_offer_nbr = m.crse_offer_nbr
and i.strm = m.strm
and i.session_code = m.session_code 
and i.class_section = m.class_section
and i.class_mtg_nbr = m.class_mtg_nbr
--and i.emplid = '011540555'
and i.emplid = ue.emplid
and c.class_stat = 'A'
and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
and c.strm = '2202'
and m.mon = 'Y'
and m.meeting_time_end >= to_timestamp('1900-1-1 21:00:00','yyyy-mm-dd hh24:mi:ss')
and m.meeting_time_start <= to_timestamp('1900-1-1 21:59:59','yyyy-mm-dd hh24:mi:ss')
order by c.enrl_tot desc
) where rownum <= 20
