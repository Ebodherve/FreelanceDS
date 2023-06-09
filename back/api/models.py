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
    image = models.ImageField(upload_to="photos_profiles/", null=True, default="", blank=True)
    titre = models.CharField(max_length=255, blank=True)
    description = models.CharField(max_length=3000, blank=True)
    nb_etoiles = models.IntegerField(blank=True)
    prix_par_heure = models.IntegerField(blank=True)
    competences = models.ManyToManyField(Competence, related_name="competences", blank=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, blank=True)
    
    def __str__(self):
        return str(self.id) + self.titre


class ProfileEntreprise(models.Model):
    
    #image = models.ImageField(upload_to="/photos_profiles/")
    image = models.ImageField(upload_to="photos_profiles/", default="", null=True, blank=True)
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
    titre = models.CharField(max_length=255, blank=True)
    description = models.CharField(max_length=1000, blank=True)
    min_prix = models.IntegerField(blank=True)
    max_prix = models.IntegerField(blank=True)
    devise = models.ForeignKey(UniteDevise, on_delete=models.CASCADE, default=True, related_name="devise", blank=True)
    createur = models.ForeignKey(User, on_delete=models.CASCADE, related_name="createur", blank=True)
    travailleurs = models.ManyToManyField(User, related_name="travailleurs", default=True, blank=True)
    fini = models.CharField(max_length=255, choices=[("fini","fini"), ("non fini", "non fini")], default=True, blank=True)
    
    def __str__(self):
        return str(self.id) + self.titre


class Postulat(models.Model):
    text = models.CharField(max_length=2000, blank=True)
    somme_demande = models.IntegerField(blank=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True)
    
    def __str__(self):
        return str(self.id) + self.text


class Commentaire(models.Model):
    text = models.CharField(max_length=2000)
    emetteur = models.ForeignKey(User, on_delete=models.CASCADE, related_name="emetteur")
    destinataire = models.ForeignKey(User, on_delete=models.CASCADE, related_name="destinataire")
    
    def __str__(self):
        return str(self.id) + self.text


class Message(models.Model):
    text = models.CharField(max_length=255)
    emetteur = models.ForeignKey(User, on_delete=models.CASCADE, related_name="emetteurM")
    destinataire = models.ForeignKey(User, on_delete=models.CASCADE, related_name="destinataireM")
    
    def __str__(self):
        return str(self.id) + self.text


