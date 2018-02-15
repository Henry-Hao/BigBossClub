from django.shortcuts import render, HttpResponse
import logging
from .models import Student
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
    logging.debug(student)
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
    logging.debug(r)
    return HttpResponse(json.dumps({"r":"success"}),content_type="application/json")