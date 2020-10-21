from django.urls import path
from .views import UserView
from rest_framework_jwt.views import obtain_jwt_token, obtain_jwt_token

urlpatterns = [
    path('token/refresh', obtain_jwt_token),
    path('register', UserView.as_view()),
    path('login', obtain_jwt_token)
]