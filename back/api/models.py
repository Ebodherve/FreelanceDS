from django.db import models

# Create your models here.
from django.db import models


class Utilisateur(models.Model):
    password = models.CharField(max_length=200, primary_key=True)
    Nom = models.CharField(max_length=200)
    Email = models.EmailField(max_length=200)
    Login = models.CharField(max_length=100, default="blanche")
   
    class Meta:
        db_table='"Utilisateur"'
        verbose_name = ("Utilisateur")
        verbose_name_plural = ("Utilisateurs")
        #unique_together = ("niveau", "filiere")


    def __str__(self):
         return f"{self.Nom}"


class Competences(models.Model):
    competence = models.CharField(max_length=200)

    class Meta:
        db_table='"Competence"'
        verbose_name = ("Competence")
        verbose_name_plural = ("Competences")

    def __str__(self):
         return f"{self.competence}"
   

class Expert(models.Model):
    CNI = models.CharField(max_length=200, primary_key=True)
    Nom = models.CharField(max_length=200)
    Prenom = models.CharField(max_length=200)
    Description = models.TextField(max_length=200)
    Photo_profil = models.ImageField
    CV = models.ImageField
    Telephone = models.CharField(max_length=200)
    date_naissance = models.DateField
    competence = models.ManyToManyField("Competences",related_name='skils')
    password = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)

class Entreprise(models.Model):
    CNI_resp = models.CharField(max_length=200, primary_key=True)
    Nom = models.CharField(max_length=200)
    Description = models.TextField(max_length=200)
    Photo_profil = models.ImageField
    Telephone = models.CharField(max_length=200)
    password = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)

    def __str__(self):
         return f"{self.Nom}"

class Projet(models.Model):
    Nom = models.CharField(max_length=200)
    Description = models.TextField(max_length=200)
    CNI_resp = models.ForeignKey(Entreprise, on_delete=models.CASCADE)

    def __str__(self):
         return f"{self.Nom}"


class Postuler(models.Model):
    Num = models.ForeignKey(Projet, on_delete=models.CASCADE)
    CNI = models.ForeignKey(Expert, on_delete=models.CASCADE)