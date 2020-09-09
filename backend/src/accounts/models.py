from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from events.models import Event
class UserAccountManager(BaseUserManager):
    def create_user(self, email, name, password=None):
        if not email:
            raise ValueError('Users must have an email address')
        
        email = self.normalize_email(email)
        user = self.model(email=email, name=name)

        user.set_password(password)
        user.save()

        return user

    def create_superuser(self, name, email, password=None):
        if password is None:
            raise TypeError('Password should not be none')

        user = self.create_user(email,name, password)
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user

class UserAccount(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    
    objects = UserAccountManager()

    eventos= models.ManyToManyField(Event,through="UserAccountEvent")# para la llave foránea

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']

    def get_full_name(self):
        return self.name
    
    def get_short_name(self):
        return self.name
    
    def __str__(self):
        return self.email

class UserAccountEvent(models.Model):
    User_id = models.ForeignKey(
        UserAccount, 
        on_delete=models.CASCADE,
        blank=True, null=True
    )
    event_id = models.ForeignKey(
        Event, 
        on_delete=models.CASCADE,
        blank=True, null=True
    )