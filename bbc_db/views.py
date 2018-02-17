from django.shortcuts import render, HttpResponse, redirect
import logging
from .models import Student, Class
import json

# Create your views here.
def addStudent(request):
    name = request.POST['name']
    email = request.POST['email']
    mobilenumber = request.POST['mobilenumber']
    dob = request.POST['dob']
    doj = request.POST['doj']
    student = Student(
        std_name=name,
        std_email=email,
        std_mobilenumber=mobilenumber,
        std_dob=dob,
        std_dojoin=doj)
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
    return render(request,'bbc_dashboard/class.html') 

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
    logging.debug(request.POST)
    obj = Class.objects.get(class_id=request.POST['removeId'])
    obj.delete()
    return HttpResponse(json.dumps({"r":"success"}),content_type="application/json")
