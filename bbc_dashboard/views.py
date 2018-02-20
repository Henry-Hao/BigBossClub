from django.shortcuts import render,HttpResponse
from django.contrib.auth import authenticate,login as ll
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import MultipleObjectsReturned
from bbc_db.models import *
import json, logging

# Create your views here.

def index(request):
    return render(request,'index.html')


def login(request):
    if request.method == 'POST':
        # get parameters from request.POST
        username = request.POST['Username'].strip()
        password = request.POST['Password'].strip()
        user = authenticate(username=username, password=password)
        # authentication success
        if user is not None:
            # update information in user table
            ll(request,user)
            # redirect
            return render(request,'bbc_dashboard/main.html',context={"username":username})
        # authentication fail
        else:
            return render(request,'index.html',context={
                "flag":"WrongPassword"
            })
    else:
        return render(request,'index.html',context={
                "flag":"WrongPassword"
            })
    

def register(request):
    if request.method == 'POST':
        # get parameters from request.POST
        username = request.POST['Username'].strip()
        password = request.POST['Password'].strip()
        email = request.POST['Email'].strip()
        try:
            # check if the username has already been used
            user = User.objects.get(username=username)
        # no record has the same username
        except ObjectDoesNotExist:
            # create the account and redirect
            user = User.objects.create_user(username=username,email=email, password=password)
            ll(request,user)
            user.save()
            # redirect
            return render(request,'bbc_dashboard/main.html',context={"username":username})
        # multiple records with same username are found
        except MultipleObjectsReturned:
            return render(request,'index.html',context={
                "flag":"Existed"
            })

        return render(request,'index.html',context={
                "flag":"Existed"
            })

def student(request):
    return render(request,'bbc_dashboard/student.html')

def studentdata(request):
    objects = Student.objects.all()
    obj = [dict({'id':i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type="applicetion/json")

def showclass(request):
    inst_objs = [x.as_dict() for x in Instructor.objects.all()]
    return render(request,'bbc_dashboard/class.html',context={
        'insts':inst_objs
        })

def classdata(request):
    objects = Class.objects.all()
    obj = [dict({"id":i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type="application/json")

def parent(request):
    return render(request, 'bbc_dashboard/parent.html')

def parentdata(request):
    objects = Parent.objects.all()
    obj = [dict({"id":i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type="application/json")

def instructor(request):
    return render(request, 'bbc_dashboard/instructor.html')

def instructordata(request):
    objects = Instructor.objects.all()
    obj = [dict({"id":i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type='application/json')

def fees(request):
    return render(request,'bbc_dashboard/fees.html')

def feesdata(request):
    objects = Fees.objects.all()
    obj = [dict({"id":i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    for x in obj:
        std_id = x['std_id']
        std = Student.objects.get(std_id=std_id)
        x['std'] = std.std_name
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type='application/json')


def rank(request):
    return render(request,'bbc_dashboard/rank.html')

def rankdata(request):
    objects = Rank.objects.all()
    obj = [dict({"id":i+1},**(objects[i]).as_dict()) for i in range(len(objects))]
    for x in obj:
        std_id = x['std_id']
        std = Student.objects.get(std_id=std_id)
        x['std'] = std.std_name
    obj = json.dumps(obj)
    return HttpResponse(obj,content_type="application/json")