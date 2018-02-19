from django.shortcuts import render, HttpResponse, redirect
import logging
from .models import *
import json

# Create your views here.
def addStudent(request):
    name = request.POST['name']
    email = request.POST['email']
    mobilenumber = request.POST['mobilenumber']
    dob = request.POST['dob']
    doj = request.POST['doj']
    parid = request.POST['par_id']
    student = Student(
        std_name=name,
        std_email=email,
        std_mobilenumber=mobilenumber,
        std_dob=dob,
        std_dojoin=doj)
    if parid != 'null':
        student.par_id = parid
    student.save()
    return render(request,'bbc_dashboard/student.html')

def modifyStudent(request):
    id = request.POST['std_id']
    student = Student.objects.get(std_id=id)
    student.std_name = request.POST['name']
    student.std_email = request.POST['email']
    student.std_mobilenumber = request.POST['mobilenumber']
    student.std_dob = request.POST['dob']
    student.std_dojoin = request.POST['doj']
    if request.POST['par_id'] != 'null':
        student.par_id = request.POST['par_id']
    else:
        student.par_id = ""
    student.save()
    return render(request,'bbc_dashboard/student.html')

def deleteStudent(request):
    std_id = request.POST['std_id']
    student = Student.objects.get(std_id=std_id)
    r = student.delete()
    return HttpResponse(json.dumps({"r":"success"}),content_type="application/json")


def addClass(request):
    post = request.POST
    class_obj = Class(
        class_name=post['name'],
        class_day=post['day'],
        class_time=post['time'],
        class_level=post['level'],
        inst_id=post['inst']
    )
    # logging.debug(post)
    class_obj.save()
    return redirect('/class')

def modifyClass(request):
    post = request.POST
    obj = Class.objects.get(class_id=post['id'])
    obj.class_name = post['name']
    obj.class_day = post['day']
    obj.class_level = post['level']
    obj.inst_id = post['inst']
    obj.class_time = post['time']
    obj.save()
    return redirect('/class')

def deleteClass(request):
    obj = Class.objects.get(class_id=request.POST['removeId'])
    obj.delete()
    return HttpResponse(json.dumps({"r":"success"}),content_type="application/json")

def addParent(request):
    post = request.POST
    parent_obj = Parent(
        par_name=post['name'],
        par_email=post['email'],
        par_mobilenumber=post['mobilenumber']
    )
    parent_obj.save()
    return redirect('/parent')

def modifyParent(request):
    post = request.POST
    obj = Parent.objects.get(par_id=post['id'])
    obj.par_name = post['name']
    obj.par_email = post['email']
    obj.par_mobilenumber = post['mobilenumber']
    obj.save()
    return redirect('/parent')

def deleteParent(request):
    post = request.POST
    obj = Parent.objects.get(par_id=post['removeId'])
    obj.delete()
    return HttpResponse(json.dumps({'r':"success"}),content_type="application/json")

def addInstructor(request):
    post = request.POST
    instructor = Instructor(inst_lname=post['name'])
    instructor.save()
    return redirect('/instructor')

def modifyInstructor(request):
    post = request.POST
    inst_id = post['id']
    inst_lname = post['name']
    logging.debug(post)
    instructor = Instructor.objects.get(inst_id=inst_id)
    instructor.inst_lname = inst_lname
    instructor.save()
    return redirect('/instructor')

def deleteInstructor(request):
    instructor = Instructor.objects.get(inst_id=request.POST['removeId'])
    instructor.delete()
    return HttpResponse(json.dumps({'r':'success'}),content_type='application/json')