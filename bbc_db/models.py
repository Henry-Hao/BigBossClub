# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models
from django.core.serializers.json import DjangoJSONEncoder
import logging


class Attendance(models.Model):
    class_field = models.ForeignKey('Class', models.DO_NOTHING, db_column='CLASS_ID')  # Field name made lowercase. Field renamed because it was a Python reserved word.
    std = models.ForeignKey('Student', models.DO_NOTHING, db_column='STD_ID')  # Field name made lowercase.
    att_date = models.DateField(db_column='ATT_DATE')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'attendance'
        unique_together = (('class_field', 'std'),)

    def as_dict(self):
        return {
            "class_id":self.class_field_id,
            "std":self.std_id,
            "att_date":self.att_date
        }


class Class(models.Model):
    class_id = models.AutoField(db_column='CLASS_ID', primary_key=True)  # Field name made lowercase.
    inst = models.ForeignKey('Instructor', models.DO_NOTHING, db_column='INST_ID')  # Field name made lowercase.
    class_time = models.CharField(db_column='CLASS_TIME', max_length=45, blank=True, null=True)  # Field name made lowercase.
    class_level = models.CharField(db_column='CLASS_LEVEL', max_length=45, blank=True, null=True)  # Field name made lowercase.
    class_day = models.CharField(db_column='CLASS_DAY', max_length=45, blank=True, null=True)  # Field name made lowercase.
    class_name = models.CharField(db_column='CLASS_NAME', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'class'

    def as_dict(self):
        return {
            "class_id":self.class_id,
            "inst_id":self.inst_id,
            "inst":Instructor.objects.filter(inst_id=self.inst_id)[0].inst_lname,
            "class_name":self.class_name,
            "class_time":self.class_time,
            "class_level":self.class_level,
            "class_day":self.class_day
        }


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

    def as_dict(self):
        return {
            "fees_id":self.fees_id,
            "std_id":self.std_id,
            "fees_type":self.fees_type,
            "fees_date":self.fees_date,
            "fees_amount":self.fees_amount
        }


class Instructor(models.Model):
    inst_id = models.AutoField(db_column='INST_ID', primary_key=True)  # Field name made lowercase.
    inst_lname = models.CharField(db_column='INST_LNAME', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'instructor'

    def as_dict(self):
        return {
            "inst_id":self.inst_id,
            "inst_lname":self.inst_lname
        }


class Parent(models.Model):
    par_id = models.AutoField(db_column='PAR_ID', primary_key=True)  # Field name made lowercase.
    par_name = models.CharField(db_column='PAR_NAME', max_length=45)  # Field name made lowercase.
    par_mobilenumber = models.CharField(db_column='PAR_MOBILENUMBER', max_length=45)  # Field name made lowercase.
    par_email = models.CharField(db_column='PAR_EMAIL', max_length=45)  # Field name made lowercase.
    par_stu = models.ForeignKey('Student', models.DO_NOTHING, db_column='PAR_STU_ID', unique=True, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'parent'

    def as_dict(self):
        return {
            "par_id":self.par_id,
            "par_name":self.par_name,
            "par_mobilenumber":self.par_mobilenumber,
            "par_email":self.par_email,
            "par_stu":self.par_stu_id
        }


class Rank(models.Model):
    rank_id = models.AutoField(db_column='RANK_ID', primary_key=True)  # Field name made lowercase.
    std = models.ForeignKey('Student', models.DO_NOTHING, db_column='STD_ID')  # Field name made lowercase.
    rank_color = models.CharField(db_column='RANK_COLOR', max_length=45)  # Field name made lowercase.
    rank_date = models.DateField(db_column='RANK_DATE')  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'rank'

    def as_dict(self):
        return {
            "rank_id":self.rank_id,
            "std_id":self.std_id,
            "rank_color":self.rank_color,
            "rank_date":self.rank_date
        }


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

    def as_dict(self):
        return {
            "std_id":self.std_id,
            "par_id":self.par_id,
            "std_name":self.std_name,
            "std_dob":self.std_dob,
            "std_dojoin":self.std_dojoin,
            "std_mobilenumber":self.std_mobilenumber,
            "std_email":self.std_email,
            "std_add":self.std_add
        }

