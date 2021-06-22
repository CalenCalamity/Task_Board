from django.contrib.auth.forms import UserCreationForm
from django import forms
from users.models import AuthUser, Comment,Task

from django import forms

class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = UserCreationForm.Meta.fields + ("email",)

class EditTaskForm(forms.ModelForm):
    class Meta:
        model = Task
        fields = ['task_title', 'priority', 'due_date', 'description', 'assigned_user_email', 'is_complete']
        widgets = { 'task_title': forms.TextInput(attrs={'class': 'form-control', 'id': 'inputTitle'}),
                    'priority': forms.Select(attrs={'class':'form-select', 'id': 'inputPriority'}),
                    'due_date': forms.DateInput(attrs={'class': 'form-control', 'type': 'date', 'id': 'inputDueDate'}),
                    'description': forms.Textarea(attrs={'class': 'form-control', 'type': 'text', 'rows': '4', 'cols': '50', 'id': 'inputDescription'}),
                    'assigned_user_email': forms.Select(attrs={'class': 'form-select', 'id': 'inputAssigned'}, choices=AuthUser.objects.all().values_list('email', 'username')),
                    'is_complete': forms.CheckboxInput(attrs={'class': 'form-check-input', 'type': 'checkbox', 'id': 'isComplete'}) }

class EditCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = [ 'message' ]
        widgets = { 'message': forms.TextInput(attrs={'class': 'textarea comment', 'id':'inputComment'}) }