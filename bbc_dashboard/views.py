from django.shortcuts import render,HttpResponse
from django.contrib.auth import authenticate,login as ll
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.core.exceptions import MultipleObjectsReturned

# Create your views here.

def home(request):
    return render(request,'home.html')


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
            return render(request,'home.html',context={
                "flag":"WrongPassword"
            })
    else:
        return render(request,'home.html',context={
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
            return render(request,'home.html',context={
                "flag":"Existed"
            })

        return render(request,'home.html',context={
                "flag":"Existed"
            })

