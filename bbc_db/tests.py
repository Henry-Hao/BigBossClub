from django.test import TestCase
from django.db import connection
# Create your tests here.

with connection.cursor() as cursor:
    cursor.execute('SELECT * FROM attendance')
    row = cursor.fetchall()
    print(row)