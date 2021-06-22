# users/views.py

from django.contrib.auth import login
from django.core.files.base import ContentFile
from django.shortcuts import redirect, render
from django.urls import reverse
from django.urls.base import reverse_lazy
from django.views import generic
from users.forms import CustomUserCreationForm
from django.contrib.auth.decorators import login_required
from users.models import AuthUser, Task, Comment

from datetime import datetime

from .forms import EditCommentForm, EditTaskForm

# --------------------- Form Functions ---------------------

def createTask(request):
    form = EditTaskForm()

    if request.method == 'POST':
        is_complete = True
        if 'is_complete' not in str(request.POST):
            is_complete = False

        Task.objects.create(
            task_title = request.POST['task_title'],
            priority = request.POST['priority'],
            due_date = request.POST['due_date'],
            description = request.POST['description'],
            assigned_user_email = request.POST['assigned_user_email'],
            is_complete = is_complete,
            is_deleted = False,
            created_by = AuthUser.objects.filter(email=request.user.email).first(),
            last_modified_by_email = request.user.email,
            created_date = datetime.now(),
            last_modified_date = datetime.now())
            
        return redirect(reverse("dashboard"))
        
    context = { 'form': form, 'ddl_users': AuthUser.objects.all() }
    return render(request, 'tasks/create_task.html', context)

def editTask(request, pk):
    task = Task.objects.filter(id=pk).first()
    task_form = EditTaskForm(instance=task)
    context = { 'form': task_form, 'comment_form': EditCommentForm(), 'comments': Comment.objects.filter(task=task, is_deleted=False), 'ddl_users': AuthUser.objects.all(), 'task_id': pk }


    if request.method == 'POST':
        if request.POST['action'] == "Task":
    
            task.last_modified_by_email = request.user.email,
            task.last_modified_date = datetime.now()
            task_form = EditTaskForm(request.POST, instance=task)
            if task_form.is_valid():
                task_form.save()
                return redirect(reverse("dashboard"))

        elif request.POST['action'] == "Comment":
            Comment.objects.create(
                task = task,
                assigned_user_email = task.assigned_user_email,
                message = request.POST['message'],
                is_deleted = False,
                created_by = AuthUser.objects.filter(email=request.user.email).first(),
                last_modified_by_email = request.user.email,
                created_date = datetime.now(),
                last_modified_date = datetime.now())
            return render(request, 'tasks/edit_task.html', context)
        
        elif request.POST['action'] == "Delete":
            deleteComment(request, request.POST.get('comment_pk'))
                
    return render(request, 'tasks/edit_task.html', context)

def deleteTask(request, pk):
    task = Task.objects.filter(id=pk).first()

    if request.method == 'POST':
        task = Task.objects.filter(id=pk).first()
        task.is_deleted = True
        task.last_modified_by_email = request.user.email
        task.last_modified_date = datetime.now()

        task.save()

        return redirect(reverse("dashboard"))
    
    return render(request, 'tasks/delete_task.html', { 'item': task })

def deleteComment(request, pk):
    comment = Comment.objects.filter(id=pk).first()
    task = Task.objects.filter(id=comment.task.id).first()
    context = { 'form': EditTaskForm(instance=task), 'comment_form': EditCommentForm(), 'comments': Comment.objects.filter(task=task), 'ddl_users': AuthUser.objects.all(), 'task_id': task.id }

    comment.is_deleted = True
    comment.last_modified_by_email = request.user.email #models.CharField(max_length=254)
    comment.last_modified_date = datetime.now() # models.DateTimeField()

    comment.save()

# --------------------- Page Functions ---------------------

@login_required
def dashboard(request):
    return render(request, "users/dashboard.html", task_data(request))

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
        return { 'users': AuthUser.objects.filter(email=email)}

# ----- Task Helpers
def task_data(request):
    combined_queryset = Task.objects.filter(created_by_id=request.user.id, is_deleted=False) | Task.objects.filter(assigned_user_email=request.user.email, is_deleted=False)
    return { 'tasks': combined_queryset }
    
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
        created_date = datetime.now(),
        last_modified_date = datetime.now())
    
    return comment.id