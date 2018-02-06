from django.contrib import admin
from .models import Attendance, Class, Parent, Student, Instructor, Rank, Fees
# Register your models here.

class inst_admin(admin.ModelAdmin):
    list_display = ['inst_id','inst_lname']

admin.site.register(Attendance)
admin.site.register(Class)
admin.site.register(Parent)
admin.site.register(Student)
admin.site.register(Instructor,inst_admin)
admin.site.register(Rank)
admin.site.register(Fees)
