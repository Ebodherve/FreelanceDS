from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import User


class Domaine(models.Model):
    
    nom = models.CharField(max_length=255)
    
    def __str__(self):
        return str(self.id) + self.nom
    

class Competence(models.Model):
    
    nom = models.CharField(max_length=255)
    domaine = models.ForeignKey(Domaine, on_delete=models.CASCADE, related_name="domaine")
    
    def __str__(self):
        return str(self.id) + self.nom


class Profile(models.Model):
    
    #image = models.ImageField(upload_to="/photos_profiles/", null=True)
    image = models.ImageField(upload_to="photos_profiles/", null=True, default="")
    titre = models.CharField(max_length=255, blank=True)
    description = models.CharField(max_length=3000, blank=True)
    nb_etoiles = models.IntegerField()
    prix_par_heure = models.IntegerField()
    competences = models.ManyToManyField(Competence, related_name="competences", blank=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    
    def __str__(self):
        return str(self.id) + self.titre


class ProfileEntreprise(models.Model):
    
    #image = models.ImageField(upload_to="/photos_profiles/")
    image = models.ImageField(upload_to="photos_profiles/", default="", null=True)
    nom = models.CharField(max_length=255, blank=True)
    description = models.CharField(max_length=1000, blank=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, blank=True)
    
    def __str__(self):
        return str(self.id) + self.nom
    

class UniteDevise(models.Model):
    nom = models.CharField(max_length=50)
    
    def __str__(self):
        return str(self.id) + self.nom


class Project(models.Model):
    titre = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    min_prix = models.IntegerField()
    max_prix = models.IntegerField()
    devise = models.ForeignKey(UniteDevise, on_delete=models.CASCADE, default=True, related_name="devise")
    createur = models.ForeignKey(User, on_delete=models.CASCADE, related_name="createur")
    travailleurs = models.ManyToManyField(User, related_name="travailleurs", default=True, blank=True)
    fini = models.CharField(max_length=255, choices=[("fini","fini"), ("non fini", "non fini")], default=True)
    
    def __str__(self):
        return str(self.id) + self.titre


class Postulat(models.Model):
    text = models.CharField(max_length=2000)
    somme_demande = models.IntegerField()
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    
    def __str__(self):
        return str(self.id) + self.text


class Commentaire(models.Model):
    text = models.CharField(max_length=2000)
    emetteur = models.ForeignKey(User, on_delete=models.CASCADE, related_name="emetteur")
    destinataire = models.ForeignKey(User, on_delete=models.CASCADE, related_name="destinataire")
    
    def __str__(self):
        return str(self.id) + self.text


