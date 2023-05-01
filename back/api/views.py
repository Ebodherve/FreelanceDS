from api.serializers import *
from rest_framework.viewsets import GenericViewSet
from rest_framework.mixins import (CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                                   UpdateModelMixin, RetrieveModelMixin) 
from rest_framework.permissions import AllowAny, IsAuthenticated


class UtilisateurViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = UtilisateurSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return Utilisateur.objects.all()

class CompetencesViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = CompetencesSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return Competences.objects.all()

class ExpertViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ExpertSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return Expert.objects.all()
    
class EntrepriseViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = EntrepriseSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return Entreprise.objects.all()
    
class ProjetViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ProjetSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return Projet.objects.all()
    
class PostulerViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = PostulerSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return Postuler.objects.all()
    
