from django.contrib import admin
# => from django.contrib.auth import models


# Register your models here.
from .models import Utilisateur
from .models import Expert
from .models import Entreprise
from .models import Postuler
from .models import Projet
from .models import Competences


admin.site.register(Utilisateur)
admin.site.register(Expert)
admin.site.register(Entreprise)
admin.site.register(Postuler)
admin.site.register(Projet)
admin.site.register(Competences)
# => admin.site.register(models.User)
