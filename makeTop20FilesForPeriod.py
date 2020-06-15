# myscript.py

# SJSU James Anderson 
# Create list of Top 20 classes by student enrollment count

from __future__ import print_function
from db_conns import *
from datetime import datetime, timedelta

import cx_Oracle
import csv

def dow(date):
    days=["mon","tues","wed","thurs","fri","sat","sun"]
    dayNumber=date.weekday()
    return days[dayNumber]

def dateString(date):
    return date.strftime("%Y%m%d")

conn = cx_Oracle.connect(user=connUsername, password=connPassword, dsn='csjprd') # if needed, place an 'r' before any parameter in order to address special characters such as '\'. For example, if your user name contains '\', you'll need to place 'r' before the user name: user=r'User Name'
cursor = conn.cursor()


# Loop through days
for dayInc in range(0, 120):
    # startDate = datetime.fromisoformat('2020-06-01')
    startDate = datetime.date(datetime.now())       # today's date
    loopDate = startDate + timedelta(days=dayInc)
    beginDate = (loopDate - timedelta(days=1)).strftime("%m/%d/%Y")
    endDate = (loopDate + timedelta(days=1)).strftime("%m/%d/%Y")
    # print('beginDate: ' + beginDate)
    # print('endDate: ' + beginDate)
    loopDate_dow = dow(loopDate)
    loopDate_string = dateString(loopDate)
    # print(loopDate)
    # print(loopDate_dow)
    # print(loopDate_string)

    # Loop through hours 0-23
    for hour in range(0, 24):
        hour_string = str(hour)
        zero_filled_hour = hour_string.zfill(2)
        # print(zero_filled_hour)
        filename = 'data/top20_' + loopDate_string + '_' + zero_filled_hour + '00.csv'
        value=''

        sql = """
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
            and i.emplid = ue.emplid
            and c.class_stat = 'A'
            and m.end_dt > to_date('03/12/2020','MM/DD/YYYY')
            and m.start_dt < to_date('03/28/2020','MM/DD/YYYY')
            and c.strm = '2202'
            and m.{strDayOfWeek} = 'Y'
            and m.meeting_time_end >= to_timestamp('1900-1-1 {strHour}:00:00','yyyy-mm-dd hh24:mi:ss')
            and m.meeting_time_start <= to_timestamp('1900-1-1 {strHour}:59:59','yyyy-mm-dd hh24:mi:ss')
            order by c.enrl_tot desc
            ) where rownum <= 20
            """.format(strHour=zero_filled_hour, strDayOfWeek=loopDate_dow)

        print('\n')
        print('loopDate_string: ' + loopDate_string)
        print('zero_filled_hour: ' + zero_filled_hour)
        print('loopDate_dow: ' + loopDate_dow)
        print('beginDate: ' + beginDate)
        print('endDate: ' + endDate)

        cursor.execute(sql)
        data = cursor.fetchall()

        with open(filename,'a+', newline='') as out:
            csv_out = csv.writer(out, delimiter=',')
            for row in data:
                csv_out.writerow(row)

