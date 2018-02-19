from django.conf.urls import url

from . import views

app_name = "bbc_dashboard"
urlpatterns = [
    url(r'^$',views.index, name='index'),
    url(r'^login$',views.login,name='login'),
    url(r'^register$',views.register,name='register'),
    url(r'^student$',views.student, name='student'),
    url(r'^student/data$',views.studentdata, name='student.data'),
    url(r'^class$',views.showclass,name='class'),
    url(r'^class/data$',views.classdata,name='class.data'),
    url(r'^parent$',views.parent,name="parent"),
    url(r'^parent/data$', views.parentdata, name="parent.data")
]