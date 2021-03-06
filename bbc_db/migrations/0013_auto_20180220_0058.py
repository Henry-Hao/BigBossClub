# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-02-20 00:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('bbc_db', '0012_auto_20180220_0031'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='class_field',
            field=models.ForeignKey(db_column='CLASS_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Class'),
        ),
        migrations.AlterField(
            model_name='attendance',
            name='std',
            field=models.ForeignKey(db_column='STD_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Student'),
        ),
    ]
