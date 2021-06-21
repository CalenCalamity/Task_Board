# users/views.py

from django.contrib.auth import login
from django.shortcuts import redirect, render
from django.urls import reverse
from users.forms import CustomUserCreationForm
from django.contrib.auth.decorators import login_required
from users.models import AuthUser, Task, Comment

from django.http import HttpResponse, JsonResponse 
from datetime import date

# --------------------- Page Functions ---------------------

@login_required
def base(request):
    return render(request, "users/dashboard.html", task_data())

@login_required
def dashboard(request):
    if request.method == "GET":
        return render(request, "users/dashboard.html", task_data())
    elif request.method == "POST":
        if request.POST['Assign'] != None:
            task_id = request.POST['Assign']
            context = '{ "data": ' + request.POST['Assign'] + '}'
            user_email = 'testdata'

            task_assign_user(task_id, user_email, request.user);
            
            return HttpResponse(context, content_type="application/json")

        elif request.POST['Update'] != None:
            task_id = request.POST['Update']

            task_edit(task_id,
                      'task_title', 
                      'priority',
                      'due_date',
                      'description',
                      'assigned_user_email',
                      request.user,
                      'last_modified_date')

            return HttpResponse('{"data": "Update"}', content_type="application/json")

        elif request.POST['Delete'] != "None":
            task_id = request.POST["Delete"]

            task_delete(task_id, request.user)

            return HttpResponse('{"data": "Delete"}', content_type="application/json")

def register(request):
    if request.method == "GET":
        return render(
            request, "users/register.html",
            {"form": CustomUserCreationForm}
        )
    elif request.method == "POST":
        form = CustomUserCreationForm(request.POST)
    if form.is_valid():
        user = form.save(commit=False)
        user.backend = "django.contrib.auth.backends.ModelBackend"
        user.save()
        login(request, user)
        return redirect(reverse("dashboard"))

# --------------------- Helper Functions ---------------------

def user_data(email = ""):
    if email == "":
        return { 'users': AuthUser.objects.all() }
    else:
        return { 'users': AuthUser.objects.get(email=email)}

# ----- Task Helpers
def task_data(id = ""):
    if id == "":
        return { 'tasks': Task.objects.all() }
    else:
        return { 'tasks': Task.object.get(pk=id) }

def task_assign_user(task_id, user_email, logged_in_user):
    task = Task.objects.get(id=task_id)
    
    task.assigned_user_email = user_email
    task.last_modified_by_email = logged_in_user
    task.last_modified_date = date.today()

    task.save()

def task_edit(task_id, task_title, priority, due_date, description, assigned_user_email, logged_in_user, last_modified_date):
    task = Task.objects.get(id=task_id)
    
    task.task_title = task_title
    task.priority = priority
    task.due_date = due_date
    task.description = description
    task.assigned_user_email = assigned_user_email
    task.last_modified_by_email = logged_in_user
    task.last_modified_date = date.today()

    task.save()

def task_delete(task_id, logged_in_user):
    task = Task.objects.get(id=task_id)

    task.is_deleted = True
    task.last_modified_by_email = logged_in_user
    task.last_modified_date = date.today()

    task.save()

def task_new(logged_in_user):
    task = Task.objects.create(
        name='Corporate',
        address='624 Broadway',
        city='San Diego',
        state='CA',
        email='corporate@coffeehouse')
    
    # If successful, record reference has id 
    return task.id
    
# ----- Task Helpers
def comment_data(task):
    return { 'comments': Comment.objects.filter(task=task) }

def comment_edit(task, user):

def comment_delete(task, user):

def comment_new(logged_in_user):