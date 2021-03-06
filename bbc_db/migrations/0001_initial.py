# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2018-02-14 13:45
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DjangoMigrations',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('app', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=255)),
                ('applied', models.DateTimeField()),
            ],
            options={
                'db_table': 'django_migrations',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Attendance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('att_date', models.DateField(db_column='ATT_DATE')),
            ],
            options={
                'db_table': 'attendance',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Class',
            fields=[
                ('class_id', models.AutoField(db_column='CLASS_ID', primary_key=True, serialize=False)),
                ('class_time', models.CharField(blank=True, db_column='CLASS_TIME', max_length=45, null=True)),
                ('class_level', models.CharField(blank=True, db_column='CLASS_LEVEL', max_length=45, null=True)),
                ('class_day', models.CharField(blank=True, db_column='CLASS_DAY', max_length=45, null=True)),
            ],
            options={
                'db_table': 'class',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Fees',
            fields=[
                ('fees_id', models.AutoField(db_column='FEES_ID', primary_key=True, serialize=False)),
                ('fees_type', models.CharField(db_column='FEES_TYPE', max_length=45)),
                ('fees_date', models.DateField(db_column='FEES_DATE')),
                ('fees_amount', models.IntegerField(db_column='FEES_AMOUNT')),
            ],
            options={
                'db_table': 'fees',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Instructor',
            fields=[
                ('inst_id', models.AutoField(db_column='INST_ID', primary_key=True, serialize=False)),
                ('inst_lname', models.CharField(blank=True, db_column='INST_LNAME', max_length=45, null=True)),
            ],
            options={
                'db_table': 'instructor',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Parent',
            fields=[
                ('par_id', models.AutoField(db_column='PAR_ID', primary_key=True, serialize=False)),
                ('par_name', models.CharField(db_column='PAR_NAME', max_length=45)),
                ('par_mobilenumber', models.CharField(db_column='PAR_MOBILENUMBER', max_length=45)),
                ('par_email', models.CharField(db_column='PAR_EMAIL', max_length=45)),
            ],
            options={
                'db_table': 'parent',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Rank',
            fields=[
                ('rank_id', models.AutoField(db_column='RANK_ID', primary_key=True, serialize=False)),
                ('rank_color', models.CharField(db_column='RANK_COLOR', max_length=45)),
                ('rank_date', models.DateField(db_column='RANK_DATE')),
            ],
            options={
                'db_table': 'rank',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('std_id', models.AutoField(db_column='STD_ID', primary_key=True, serialize=False)),
                ('std_name', models.CharField(blank=True, db_column='STD_NAME', max_length=45, null=True)),
                ('std_dob', models.CharField(blank=True, db_column='STD_DOB', max_length=45, null=True)),
                ('std_dojoin', models.CharField(blank=True, db_column='STD_DOJOIN', max_length=45, null=True)),
                ('std_mobilenumber', models.CharField(blank=True, db_column='STD_MOBILENUMBER', max_length=45, null=True)),
                ('std_email', models.CharField(blank=True, db_column='STD_EMAIL', max_length=45, null=True)),
                ('std_add', models.CharField(blank=True, db_column='STD_ADD', max_length=45, null=True)),
                ('par', models.ForeignKey(blank=True, db_column='PAR_ID', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Parent')),
            ],
            options={
                'db_table': 'student',
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='rank',
            name='std',
            field=models.ForeignKey(db_column='STD_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Student'),
        ),
        migrations.AddField(
            model_name='parent',
            name='par_stu',
            field=models.ForeignKey(blank=True, db_column='PAR_STU_ID', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Student', unique=True),
        ),
        migrations.AddField(
            model_name='fees',
            name='std',
            field=models.ForeignKey(db_column='STD_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Student'),
        ),
        migrations.AddField(
            model_name='class',
            name='inst',
            field=models.ForeignKey(db_column='INST_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Instructor'),
        ),
        migrations.AddField(
            model_name='attendance',
            name='class_field',
            field=models.ForeignKey(db_column='CLASS_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Class'),
        ),
        migrations.AddField(
            model_name='attendance',
            name='std',
            field=models.ForeignKey(db_column='STD_ID', on_delete=django.db.models.deletion.DO_NOTHING, to='bbc_db.Student'),
        ),
        migrations.AlterUniqueTogether(
            name='attendance',
            unique_together=set([('class_field', 'std')]),
        ),
    ]
