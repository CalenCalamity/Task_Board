# users/views.py

from django.contrib.auth import login
from django.shortcuts import redirect, render
from django.urls import reverse
from users.forms import CustomUserCreationForm
from django.contrib.auth.decorators import login_required
from users.models import AuthUser, Task, Comment

from django.http import HttpResponse, HttpResponseRedirect, JsonResponse 
from datetime import date

from .forms import EditTaskForm, UserForm


def index(request):
    submitbutton= request.POST.get("submit")

    firstname=''
    lastname=''
    emailvalue=''

    form= UserForm(request.POST or None)
    if form.is_valid():
        firstname= form.cleaned_data.get("first_name")
        lastname= form.cleaned_data.get("last_name")
        emailvalue= form.cleaned_data.get("email")


    context= {'form': form, 'firstname': firstname, 'lastname':lastname,
              'submitbutton': submitbutton, 'emailvalue':emailvalue}
        
    return render(request, 'users/register.html', context)


# --------------------- Form Funct11ions ---------------------

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
            context = { "data": request.POST['Assign'] }
            return render(request, "tasks/edit_task.html", context)
            # task_id = request.POST['Assign']
            # context = '{ "data": ' + request.POST['Assign'] + '}'
            # user_email = 'testdata'

            # task_assign_user(task_id, user_email, request.user);
            
            # return HttpResponse(context, content_type="application/json")

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


# @login_required
# def edit_task(request):
#     if request.method == "GET":
#         # task_data(request.)
#         return render(request, "tasks/edit_task.html")
#     # elif request.method == "POST":
        

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

def task_new(task_title, priority, due_date, description, assigned_email, is_complete, logged_in_user):
    task = Task.objects.create(
        task_title = task_title,
        priority = priority,
        due_date = due_date,
        description = description,
        assigned_user_email = assigned_email,
        is_complete = is_complete,
        is_deleted = False,
        created_by = logged_in_user,
        last_modified_by_email = logged_in_user.email,
        created_date = date.today(),
        last_modified_date = date.today())
    
    # If successful, record reference has id 
    return task.id
    
# ----- Comments Helpers
def comment_data(task):
    return { 'comments': Comment.objects.filter(task=task) }

def comment_edit(task, user, new_text):
    comment = Comment.objects.filter(task=task)

    comment.message = new_text
    comment.last_modified_by_email = user.email
    comment.last_modified_date = date.today()

    comment.save()

def comment_delete(task, user):
    comment = Comment.objects.filter(task=task)

    comment.is_deleted = True
    comment.last_modified_by_email = user.email
    comment.last_modified_date = date.today()

    comment.save()

def comment_new(task, assigned_user_email, message, logged_in_user):
    comment = Comment.objects.create(task = task,
        assigned_user_email = assigned_user_email,
        message = message,
        is_deleted = False,
        created_by_email = logged_in_user,
        last_modified_by_email = logged_in_user,
        created_date = date.today(),
        last_modified_date = date.today())
    
    return comment.id