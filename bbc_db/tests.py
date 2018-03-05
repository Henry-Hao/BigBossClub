from django.test import TestCase
from django.db import connection
# Create your tests here.
from models import Attendance
from django.core.management import  setup_environ
from bbc import settings

import os
os.environ.update({"DJANGO_SETTINGS_MODULE": "config.settings"})

