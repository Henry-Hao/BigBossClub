from django.test import TestCase

import datetime
from bbc_db.models import Attendance
from django.db import connection

with connection.cursor() as cursor:
    cursor.execute("SELECT FORMAT(AVG(STUDENT_SUM),2) AS avg_count, ATT_CLASS as class_id FROM (SELECT COUNT(A.ATT_STD) AS STUDENT_SUM, A.ATT_CLASS FROM bbc.attendance A group by ATT_DATE) B GROUP BY B.ATT_CLASS")
    row = cursor.fetchall()
    print(row)