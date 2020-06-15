# myscript.py
# James Anderson 5/13/2020 - K5D8233365
# Provide weekly distribution of classes for IT Help Desk for support planning.
# Data should include overlapping terms, total active courses by hour, and include weekend courses.

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

startingPoint = '2020-06-01'
weekNumber = 19
filename = 'data/WeeklyClassCounts.csv'

# Write file header
with open(filename,'w', newline='') as out:
            # csv_out = csv.writer(out, delimiter=',')
            csv_out = csv.writer(out)
            csv_out.writerow(["WEEK","DAY_TIME","DAY","DAY_OF_WEEK","TIME","DOW_TIME","COUNT"])


# Loop through days
for dayInc in range(0, 120, 1):
    startDate = datetime.fromisoformat(startingPoint)
    loopDate = startDate + timedelta(days=dayInc)
    if (dayInc % 7 == 0 ):
        weekNumber = weekNumber + 1
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
            '{weekNbr}' "WEEK",
            '{strDate}_{strHour}00' "DAY_TIME",
            '{strDate}' "DAY",
            '{strDayOfWeek}' "DAY_OF_WEEK",
            '{strHour}00' "TIME",
            '{strDayOfWeek}_{strHour}00' "DOW_TIME",
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
            and c.strm between '2202' and '2204'
            and stnd_mtg_pat <> 'TBA'
        """.format(strDate=loopDate_string, strHour=zero_filled_hour, strDayOfWeek=loopDate_dow, strBeginDate=beginDate, strEndDate=endDate, weekNbr=weekNumber)

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




# filename = 'data/WeeklyClassDetails.csv'

# # Loop through days
# for dayInc in range(0, 120, 1):
#     startDate = datetime.fromisoformat(startingPoint)
#     loopDate = startDate + timedelta(days=dayInc)
#     beginDate = (loopDate - timedelta(days=1)).strftime("%m/%d/%Y")
#     endDate = (loopDate + timedelta(days=1)).strftime("%m/%d/%Y")
#     # print('beginDate: ' + beginDate)
#     # print('endDate: ' + beginDate)
#     loopDate_dow = dow(loopDate)
#     loopDate_string = dateString(loopDate)
#     # print(loopDate)
#     # print(loopDate_dow)
#     # print(loopDate_string)

#     # Loop through hours 0-23
#     for hour in range(0, 24):
#         hour_string = str(hour)
#         zero_filled_hour = hour_string.zfill(2)
#         # print(zero_filled_hour)
#         value=''

#         sql = """
#             select
#             '{strDate}_{strHour}00' "DAY/TIME",
#             c.strm "TERM",
#             c.subject "SUBJECT",
#             c.catalog_nbr "CATALOG NUMBER",
#             c.class_section "SECTION",
#             c.enrl_tot "ENROLLMENT COUNT",
#             m.start_dt "START DATE",
#             m.end_dt "END DATE",
#             m.stnd_mtg_pat "MEETING PATTERN",
#             m.meeting_time_start "START TIME",
#             m.meeting_time_end "END TIME"
#             from ps_class_tbl c,
#             ps_class_mtg_pat m
#             where c.crse_id = m.crse_id
#             and m.{strDayOfWeek} = 'Y'
#             and m.meeting_time_end >= to_timestamp('1900-1-1 {strHour}:00:00','yyyy-mm-dd hh24:mi:ss')
#             and m.meeting_time_start <= to_timestamp('1900-1-1 {strHour}:59:59','yyyy-mm-dd hh24:mi:ss')
#             and c.crse_offer_nbr = m.crse_offer_nbr
#             and c.strm = m.strm
#             and c.session_code = m.session_code 
#             and c.class_section = m.class_section
#             and c.class_stat = 'A'
#             and m.end_dt > to_date('{strBeginDate}','MM/DD/YYYY')
#             and m.start_dt < to_date('{strEndDate}','MM/DD/YYYY')
#             and c.strm between '2202' and '2204'
#             and stnd_mtg_pat <> 'TBA'
#         """.format(strDate=loopDate_string, strHour=zero_filled_hour, strDayOfWeek=loopDate_dow, strBeginDate=beginDate, strEndDate=endDate)

#         print('\n')
#         print('loopDate_string: ' + loopDate_string)
#         print('zero_filled_hour: ' + zero_filled_hour)
#         print('loopDate_dow: ' + loopDate_dow)
#         print('beginDate: ' + beginDate)
#         print('endDate: ' + endDate)

#         cursor.execute(sql)
#         data = cursor.fetchall()

#         with open(filename,'a+', newline='') as out:
#             csv_out = csv.writer(out, delimiter=',')
#             for row in data:
#                 csv_out.writerow(row)
