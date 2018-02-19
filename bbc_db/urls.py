from django.conf.urls import url

from . import views

app_name = "bbc_db"
urlpatterns = [
    url(r'^addStudent$',views.addStudent, name='addStudent'),
    url(r'^modifyStudent$',views.modifyStudent, name='modifyStudent'),
    url(r'^deleteStudent$',views.deleteStudent, name='deleteStudent'),
    url(r'^addClass$',views.addClass, name='addClass'),
    url(r'^modifyClass$',views.modifyClass, name='modifyClass'),
    url(r'^deleteClass$',views.deleteClass,name='deleteClass'),
    url(r'^addParent$',views.addParent, name='addParent'),
    url(r'^modifyParent$',views.modifyParent,name='modifyParent'),
    url(r'^deleteParent$',views.deleteParent,name='deleteParent'),
    url(r'^addInstructor$',views.addInstructor,name='addInstructor'),
    url(r'^modifyInstructor$',views.modifyInstructor,name='modifyInstructor'),
    url(r'^deleteInstructor$',views.deleteInstructor,name='deleteInstructor')
]