from django.urls import path, include

from rest_framework.routers import DefaultRouter
from api.views import (UtilisateurViewSet, CompetencesViewSet,ExpertViewSet, 
                                 EntrepriseViewSet, ProjetViewSet, PostulerViewSet)

router = DefaultRouter()
router.register('Utilisateur', UtilisateurViewSet, basename='Utilisateur')
router.register('Competences', CompetencesViewSet, basename='Competences')
router.register('Expert', ExpertViewSet, basename='Expert')
router.register('Entreprise', EntrepriseViewSet, basename='Entreprise')
router.register('Projet', ProjetViewSet, basename='Projet')
router.register('Postuler', PostulerViewSet, basename='Postuler')


urlpatterns = []

urlpatterns += router.urls
