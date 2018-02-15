from django.conf.urls import url

from . import views

app_name = "bbc_db"
urlpatterns = [
    url(r'^addStudent$',views.addStudent, name='addStudent'),
    url(r'^modifyStudent$',views.modifyStudent, name='modifyStudent'),
    url(r'^deleteStudent$',views.deleteStudent, name='deleteStudent'),
]