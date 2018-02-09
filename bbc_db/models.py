# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Attendance(models.Model):
    class_field = models.ForeignKey('Class', models.DO_NOTHING, db_column='CLASS_ID')  # Field name made lowercase. Field renamed because it was a Python reserved word.
    std = models.ForeignKey('Student', models.DO_NOTHING, db_column='STD_ID')  # Field name made lowercase.
    att_date = models.DateField(db_column='ATT_DATE')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'attendance'
        unique_together = (('class_field', 'std'),)


class Class(models.Model):
    class_id = models.AutoField(db_column='CLASS_ID', primary_key=True)  # Field name made lowercase.
    inst = models.ForeignKey('Instructor', models.DO_NOTHING, db_column='INST_ID')  # Field name made lowercase.
    class_time = models.CharField(db_column='CLASS_TIME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    class_level = models.CharField(db_column='CLASS_LEVEL', max_length=45, blank=True, null=True)  # Field name made lowercase.
    class_day = models.CharField(db_column='CLASS_DAY', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'class'


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class Fees(models.Model):
    fees_id = models.AutoField(db_column='FEES_ID', primary_key=True)  # Field name made lowercase.
    std = models.ForeignKey('Student', models.DO_NOTHING, db_column='STD_ID')  # Field name made lowercase.
    fees_type = models.CharField(db_column='FEES_TYPE', max_length=45)  # Field name made lowercase.
    fees_date = models.DateField(db_column='FEES_DATE')  # Field name made lowercase.
    fees_amount = models.IntegerField(db_column='FEES_AMOUNT')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'fees'


class Instructor(models.Model):
    inst_id = models.AutoField(db_column='INST_ID', primary_key=True)  # Field name made lowercase.
    inst_lname = models.CharField(db_column='INST_LNAME', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'instructor'


class Parent(models.Model):
    par_id = models.AutoField(db_column='PAR_ID', primary_key=True)  # Field name made lowercase.
    par_name = models.CharField(db_column='PAR_NAME', max_length=45)  # Field name made lowercase.
    par_mobilenumber = models.CharField(db_column='PAR_MOBILENUMBER', max_length=45)  # Field name made lowercase.
    par_email = models.CharField(db_column='PAR_EMAIL', max_length=45)  # Field name made lowercase.
    par_stu = models.ForeignKey('Student', models.DO_NOTHING, db_column='PAR_STU_ID', unique=True, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'parent'


class Rank(models.Model):
    rank_id = models.AutoField(db_column='RANK_ID', primary_key=True)  # Field name made lowercase.
    std = models.ForeignKey('Student', models.DO_NOTHING, db_column='STD_ID')  # Field name made lowercase.
    rank_color = models.CharField(db_column='RANK_COLOR', max_length=45)  # Field name made lowercase.
    rank_date = models.DateField(db_column='RANK_DATE')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'rank'


class Student(models.Model):
    std_id = models.AutoField(db_column='STD_ID', primary_key=True)  # Field name made lowercase.
    par = models.ForeignKey(Parent, models.DO_NOTHING, db_column='PAR_ID', blank=True, null=True)  # Field name made lowercase.
    std_name = models.CharField(db_column='STD_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    std_dob = models.CharField(db_column='STD_DOB', max_length=45, blank=True, null=True)  # Field name made lowercase.
    std_dojoin = models.CharField(db_column='STD_DOJOIN', max_length=45, blank=True, null=True)  # Field name made lowercase.
    std_mobilenumber = models.CharField(db_column='STD_MOBILENUMBER', max_length=45, blank=True, null=True)  # Field name made lowercase.
    std_email = models.CharField(db_column='STD_EMAIL', max_length=45, blank=True, null=True)  # Field name made lowercase.
    std_add = models.CharField(db_column='STD_ADD', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'student'

