# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-02-20 15:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bbc_db', '0021_auto_20180220_1540'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='att_date',
            field=models.DateField(db_column='ATT_DATE', primary_key=True),
        ),
    ]
