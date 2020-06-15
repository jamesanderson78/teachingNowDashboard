# myscript.py

# SJSU James Anderson 
# Create list of scheduled classes offered every hour for 14 days past the start date

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

filename = 'data/ClassCounts.csv'

# Loop through days
for dayInc in range(0, 30):
    startDate = datetime.fromisoformat('2020-06-01')
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
        value=''

        sql = """
            select
            '{strDate}_{strHour}00' "DAY/TIME",
            count(*) "COURSE_COUNT"
            from ps_class_tbl c,
            ps_class_mtg_pat m
            where c.crse_id = m.crse_id
            and m.{strDayOfWeek} = 'Y'
            and m.meeting_time_end >= to_timestamp('1900-1-1 {strHour}:00:00','yyyy-mm-dd hh24:mi:ss')
            and m.meeting_time_start <= to_timestamp('1900-1-1 {strHour}:59:59','yyyy-mm-dd hh24:mi:ss')
            and c.crse_offer_nbr = m.crse_offer_nbr
            and c.strm = m.strm
            and c.session_code = m.session_code 
            and c.class_section = m.class_section
            and c.class_stat = 'A'
            and m.end_dt > to_date('{strBeginDate}','MM/DD/YYYY')
            and m.start_dt < to_date('{strEndDate}','MM/DD/YYYY')
            and c.strm = '2202'
            and stnd_mtg_pat <> 'TBA'
        """.format(strDate=loopDate_string, strHour=zero_filled_hour, strDayOfWeek=loopDate_dow, strBeginDate=beginDate, strEndDate=endDate)

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

