from django.contrib import admin
# => from django.contrib.auth import models


# Register your models here.
from api.models import (Domaine, Competence, Profile, 
                        UniteDevise, Project, Postulat, Commentaire, ProfileEntreprise)


admin.site.register(Domaine)
admin.site.register(Competence)
admin.site.register(Profile)
admin.site.register(ProfileEntreprise)
admin.site.register(UniteDevise)
admin.site.register(Project)
admin.site.register(Postulat)
admin.site.register(Commentaire)

