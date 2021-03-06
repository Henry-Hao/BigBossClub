# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-02-20 15:35
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('bbc_db', '0017_auto_20180220_1520'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='att_date',
            field=models.DateField(db_column='ATT_DATE', primary_key=True),
        ),
        migrations.AlterField(
            model_name='attendance',
            name='std',
            field=models.ForeignKey(db_column='ATT_STD', on_delete=django.db.models.deletion.CASCADE, primary_key=True, to='bbc_db.Student'),
        ),
    ]
