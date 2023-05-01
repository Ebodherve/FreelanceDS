# eboutique/serializers.py

from rest_framework.serializers import ModelSerializer
from api.models import Utilisateur, Competences, Expert, Entreprise, Projet, Postuler


class UtilisateurSerializer(ModelSerializer):
    class Meta:
        model = Utilisateur
        fields = ('password', 'Nom', 'Email', 'Login')


class CompetencesSerializer(ModelSerializer):
    class Meta:
        model = Competences
        fields = ('competence',)


class ExpertSerializer(ModelSerializer):
    class Meta:
        model = Expert
        fields = ('CNI','Nom','Prenom','Description','Photo_profil','CV','Telephone','date_naissance','competence','password')


class EntrepriseSerializer(ModelSerializer):
    class Meta:
        model = Entreprise
        fields = ('CNI_resp','Nom','Description','Photo_profil','Telephone','password')


class ProjetSerializer(ModelSerializer):
    class Meta:
        model = Projet
        fields = ('Nom','CNI_resp','Description')


class PostulerSerializer(ModelSerializer):
    class Meta:
        model = Postuler
        fields = ('Num','CNI')

