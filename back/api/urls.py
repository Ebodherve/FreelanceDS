from django.urls import path, include, re_path
from dj_rest_auth.registration.views import VerifyEmailView, LoginView, RegisterView

from rest_framework.routers import DefaultRouter
#from api.views import (DomaineViewSet, CompetenceViewSet, ProfileViewSet, 
from api.views import (DomaineViewSet, CompetenceViewSet, UniteDeviseViewSet, ProjectViewSet, ProjectSearchViewSet,
                       PostulatViewSet, CommentaireViewSet, UserViewSet, UserLoginViewSet, ProfileViewSet, ProfileUserViewSet,
                       PostuleProjetViewSet, ProfileEntrepriseViewSet, ProfileEntrepriseUserViewSet, RecommandeFreelancersViewSet,
                       ProjectCreateurViewSet, PostulatsProjetViewSet, MessageViewSet)

router = DefaultRouter()
router.register('domaine', DomaineViewSet, basename='domaine')
"""router.register('domaine', DomaineViewSet, basename='domaine')
router.register('profile', ProfileViewSet, basename='profile')"""
router.register('competence', CompetenceViewSet, basename='competence')
router.register('devise', UniteDeviseViewSet, basename='devise')
router.register('projet', ProjectViewSet, basename='projet')
router.register('profilentreprise', ProfileEntrepriseViewSet, basename='profilentreprise')
router.register('profile', ProfileViewSet, basename='profile')
#router.register('profileuser/<user>', ProfileUserViewSet, basename='profileuser')
router.register('postulat', PostulatViewSet, basename='postulat')
router.register('commentaire', CommentaireViewSet, basename='commentaire')
router.register('message', MessageViewSet, basename='message')
router.register('register', UserViewSet, basename='register')
router.register('login', UserLoginViewSet, basename='login')
router.register('projetsearch', ProjectSearchViewSet, basename='projetsearch')


urlpatterns = [
    path("profileuser/<user>/", ProfileUserViewSet.as_view({'get': 'list'}), name="profileuser"),
    path("profilentrepriseuser/<user>/", ProfileEntrepriseUserViewSet.as_view({'get': 'list'}), name="profilentrepriseuser"),
    path("postuleprojet/<project>/<user>/", PostuleProjetViewSet.as_view({'get': 'list'}), name="postuleprojetuser"),
    path("ajoutTprojet/<project>/<user>/", PostuleProjetViewSet.as_view({'get': 'list'}), name="postuleprojetuser"),
    path("postuleprojet/<project>/", PostulatsProjetViewSet.as_view({'get': 'list'}), name="postuleprojet"),
    path("recommandeFreel/<id_project>/", RecommandeFreelancersViewSet.as_view({'get': 'list'}), name="recommandeFreel"),
    path("projetcreateur/<createur>/", ProjectCreateurViewSet.as_view({'get': 'list'}), name="projetcreateur"),
    #path("profileuser/<user>", ProfileUserViewSet.as_view({'get': 'list'}), name="profileuser"),
]

urlpatterns += router.urls

