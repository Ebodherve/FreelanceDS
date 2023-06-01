# eboutique/serializers.py

from rest_framework.serializers import ModelSerializer

from api.models import Domaine, Competence, Profile, UniteDevise, Project, Postulat, Commentaire, ProfileEntreprise

from django.contrib.auth import get_user_model

User = get_user_model()


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "username", "password", "email")


class UserLoginSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "username", "password")



class DomaineSerializer(ModelSerializer):
    class Meta:
        model = Domaine
        fields = ('id', 'nom')


class CompetenceSerializer(ModelSerializer):
    class Meta:
        model = Competence
        fields = ('id', 'nom', 'domaine')



class ProfileSerializer(ModelSerializer):
    class Meta:
        model = Profile
        
        fields = ("id", "image", "titre", "description", "nb_etoiles", "prix_par_heure", "competences", "user")


class ProfileEntrepriseSerializer(ModelSerializer):
    class Meta:
        model = ProfileEntreprise
        
        fields = ("id", "image", "nom", "description", "user")


class UniteDeviseSerializer(ModelSerializer):
    class Meta:
        model = UniteDevise
        fields = ('id', 'nom')


class ProjectSerializer(ModelSerializer):
    class Meta:
        model = Project
        fields = ('id', 'titre', 'description', 'min_prix', 'max_prix', 'devise', 'createur', 'travailleurs', 'fini')
    

class PostulatSerializer(ModelSerializer):
    class Meta:
        model = Postulat
        fields = ('id', 'text', 'somme_demande', 'project', 'user')


class CommentaireSerializer(ModelSerializer):
    class Meta:
        model = Commentaire
        fields = ('id', 'text', 'emetteur', 'destinataire',)

