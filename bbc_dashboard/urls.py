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
    url(r'^class/data/date=(?P<date>.*)$',views.classdatabydate,name='class.data.bydate'),
    url(r'^class/data/class=(?P<class_id>.*)&date=(?P<date>.*)$',views.classdatadetail,name='class.data.detail'),
    url(r'^parent$',views.parent,name="parent"),
    url(r'^parent/data$', views.parentdata, name="parent.data"),
    url(r'^instructor$',views.instructor,name='instructor'),
    url(r'^instructor/data$',views.instructordata,name='instructor.data'),
    url(r'^fees$',views.fees,name='fees'),
    url(r'^fees/data$',views.feesdata,name='fees.data'),
    url(r'^rank$',views.rank,name='rank'),
    url(r'^rank/data$',views.rankdata,name='rank.data'),
    url(r'^attendance$',views.attendance,name='attendance'),
    url(r'^attendancedata$',views.attendancedata,name='attendance.data'),
    url(r'^stat$',views.stat,name="stat"),
    url(r'^studentStatUrl$',views.studentStat,name='stat.student'),
    url(r'^rankStatUrl$',views.rankStat,name='stat.rank'),
    url(r'^attendanceStatUrl$',views.attendanceStat,name="stat.att")
]