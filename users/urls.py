# users/urls.py

from django.conf.urls import include
from users import views

from django.urls import path

urlpatterns = [
    path("accounts/", include("django.contrib.auth.urls")),
    path("oauth/", include("social_django.urls")),
    path("dashboard/", views.dashboard, name="dashboard"),
    path("register/", views.register, name="register"),
    path("create_task/", views.createTask, name="create_task"),
    path("edit_task/<str:pk>/", views.editTask, name="edit_task"),
    path("delete_task/<str:pk>/", views.deleteTask, name="delete_task")
]