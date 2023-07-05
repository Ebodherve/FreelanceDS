from django.contrib.auth import get_user_model
from django.http import JsonResponse

from rest_framework.viewsets import GenericViewSet
from rest_framework.mixins import (CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                                   UpdateModelMixin, RetrieveModelMixin)
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response

from api.serializers import (DomaineSerializer, CompetenceSerializer, ProfileSerializer, UniteDeviseSerializer, ProfileEntrepriseSerializer,
                             ProjectSerializer, PostulatSerializer, CommentaireSerializer, UserSerializer, UserLoginSerializer, MessageSerializer)
from api.models import Domaine, Competence, Profile, UniteDevise, Project, Postulat, Commentaire, ProfileEntreprise, Message

from api.model_MLFBin import getModel


User = get_user_model()
modelML = getModel()

class UserViewSet(CreateModelMixin, GenericViewSet):
    serializer_class = UserSerializer
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return User.objects.all()
    
    def create(self, request, *args, **kwargs):
        
        req =  super().create(request, *args, **kwargs)
        return req

    
class UserLoginViewSet(CreateModelMixin, GenericViewSet):
    serializer_class = UserLoginSerializer
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return User.objects.all()
    
    def create(self, request, *args, **kwargs):
        
        jdata = request.data
        if not (jdata.get("username") or jdata.get("password")):
            print('Les champs ne sont pas correctement remplis')
            rep = Response(data='Les champs ne sont pas correctement remplis', status=400)
            return rep
        user = User.objects.filter(username=jdata['username'], password=jdata['password'])
        if user.exists():
            print("Cette utilisateur est bien existant")
            userdata = self.serializer_class(user.first()).data
            return JsonResponse(userdata, safe=False, status=200)
        else:
            print("Cette utilisateur est inexistant")
            rep = Response(data="Cette utilisateur est inexistant", status=404)
            return rep


class DomaineViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = DomaineSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return Domaine.objects.all()


class CompetenceViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = CompetenceSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return Competence.objects.all()


class ProfileViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return Profile.objects.all()


class AccepteTravailleurViewSet(CreateModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self,):
        #return Profile.objects.all()
        return Profile.objects.all()
    
    def create(self, request, *args, **kwargs):
        project = Project.objects.filter(id = kwargs["project"])
        profileT = Profile.objects.filter(id = kwargs["project"])
        if project.exists():
            project = project.first()
            project.travailleurs.add(kwargs['travailleur'])
            prof_user = self.serializer_class(profileT.first()).data
            rep = JsonResponse(prof_user, safe=False, status=201)
            return rep
        return JsonResponse(data="Projet inexistant", status=404)
        

class ProfileUserViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self,):
        #return Profile.objects.all()
        return Profile.objects.all()
    
    def list(self, request, *args, **kwargs):
        # print(kwargs)
        profileuser = Profile.objects.filter(user=kwargs["user"])
        # print(profileuser)
        prof_user = self.serializer_class(profileuser.first()).data
        rep = JsonResponse(prof_user, safe=False, status=200)

        return rep


class TravailleursProjectViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self,):
        return Profile.objects.all()
    
    def list(self, request, *args, **kwargs):
        project = Project.objects.filter(id=kwargs["project"])
        print(project)
        if project.exists():
            project = project.first()
            print("------------- project.travailleurs.all()")
            print("------------- project.travailleurs.all()")
            print(project.travailleurs.all())
            print("------------- project.travailleurs.all()")
            print("------------- project.travailleurs.all()")
            project_user = self.serializer_class(Profile.objects.filter(user__in = project.travailleurs.all()), many=True).data
            print(project_user)
            rep = JsonResponse(project_user, safe=False, status=200)
            return rep

        return JsonResponse(data="Projet inexistant", status=404)


class ProfileEntrepriseUserViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = ProfileEntrepriseSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self):
        return ProfileEntreprise.objects.all()
    
    def list(self, *args, **kwargs):
        # print(kwargs)
        profileuser = ProfileEntreprise.objects.filter(user=kwargs["user"])
        # print(profileuser)
        prof_user = self.serializer_class(profileuser.first()).data
        print(prof_user)
        rep = JsonResponse(prof_user, safe=False, status=200)

        return rep


class PostuleProjetViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = PostulatSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self,):
        
        return Postulat.objects.all()
    
    def list(self, request, *args, **kwargs):
        print(kwargs)
        postuleuser = Postulat.objects.filter(project=kwargs["project"], user=kwargs["user"])
        print(postuleuser)
        if postuleuser.exists():
            postule_user = self.serializer_class(postuleuser.first()).data
            rep = JsonResponse(postule_user, safe=False, status=200)
        else:
            rep = JsonResponse("postulat inexistant", safe=False, status=404)

        return rep


class PostulatsProjetViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = PostulatSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self,):
        
        return Postulat.objects.all()
    
    def list(self, request, *args, **kwargs):
        postuleuserQS = Postulat.objects.filter(project=kwargs["project"])
        postule_user = self.serializer_class(postuleuserQS, many=True).data
        rep = JsonResponse(postule_user, safe=False, status=200)
        
        return rep


def model_distance(liste_projets, projetP, seuil=0.20):
    p = projetP
    pSelectsid = []
    print("Error ------------------ 1")
    print("Error ------------------ 2")
    
    for projet in liste_projets:
        print(projet.description)
        print(p.description)
        if len(projet.description)>0 and len(p.description)>0 and modelML(projet.description, p.description) >= seuil:
            print("Error ------------------ 3")
            pSelectsid.append(projet.id)
            print("Error ------------------ 4")
    
    return Project.objects.filter(pk__in = pSelectsid)


class RecommandeFreelancersViewSet(ListModelMixin, RetrieveModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self):
        return Profile.objects.all()
    
    def list(self, request, *args, **kwargs):
        PSelect = Project.objects.filter(id = kwargs["id_project"])
        print("--------------------------- 1")
        PListRecommands = model_distance(Project.objects.all(), PSelect.first())
        print("PListRecommands ----------")
        print(len(PListRecommands))
        if len(PListRecommands)>0 :
            usersSelect = PListRecommands.first().travailleurs.all()
            print("--------------------------- 2")
            for p in PListRecommands[:1]:
                usersSelect.union(p.travailleurs.all())
            user_ids = [u.id for u in usersSelect]
            dataProfiles = Profile.objects.filter(user__in=user_ids)
            data = self.serializer_class(dataProfiles, many=True).data
            resp = JsonResponse(data=data, safe=False, status=200)
            return resp
        
        resp = JsonResponse(data=[], safe=False, status=200)
        return resp


class ProfileEntrepriseViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ProfileEntrepriseSerializer
    permission_classes= (AllowAny,)


    def get_queryset(self):
        return ProfileEntreprise.objects.all()
    
    def update(self, request, *args, **kwargs):
        ret = super().update(request, *args, **kwargs)
        ob = ProfileEntreprise.objects.filter(pk=kwargs["pk"]).first()
        return ret


class UniteDeviseViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = UniteDeviseSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return UniteDevise.objects.all()


class ProjectViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ProjectSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        return Project.objects.all()


class ProjectSearchViewSet( ListModelMixin, GenericViewSet):
    serializer_class = ProjectSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        projets =  Project.objects.filter(fini="non fini")
        return Project.objects.all()


class ProjectCreateurViewSet( ListModelMixin, GenericViewSet):
    serializer_class = ProjectSerializer
    permission_classes= (AllowAny,)

    def get_queryset(self):
        projets =  Project.objects.filter(fini="non fini")
        return Project.objects.all()
    
    def list(self, *args, **kwargs):
        ProjectsC = Project.objects.filter(createur=kwargs["createur"])
        projectsdata = self.serializer_class(ProjectsC, many=True).data
        #print(projectsdata)
        resp = JsonResponse(projectsdata, safe=False, status=200)
        return resp
        

class PostulatViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = PostulatSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self):
        return Postulat.objects.all()


class CommentaireViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = CommentaireSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self):
        return Commentaire.objects.all()


class MessageViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin, 
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = MessageSerializer
    permission_classes= (AllowAny,)
    
    def get_queryset(self):
        return Message.objects.all()


class TravailleursProjetViewSet(CreateModelMixin, DestroyModelMixin, ListModelMixin,
                         UpdateModelMixin, RetrieveModelMixin,GenericViewSet):
    serializer_class = ProfileSerializer
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return Profile.objects.all()
    
    def get(self, request, *args, **kwargs):
        P = Project.objects.filter(id=kwargs["projet"])
        if len(P) > 0:
            P = P.first()
            #users = P.travailleurs.all()
            print(P.travailleurs.all())
            profs = Profile.objects.filter(user__in=P.travailleurs.all())
            data = self.serializer_class(profs, many=True).data
            resp = JsonResponse(data, safe=False, status=200)
            return resp
        
        resp = JsonResponse([], safe=False, status=200)
        return resp


class AddProjectWorkerViewSet(CreateModelMixin, GenericViewSet):
    serializer_class = Project
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return Profile.objects.all()
    
    def get(self, request, *args, **kwargs):
        idproj = kwargs["projet"]
        idwork = kwargs["travailleur"]
        project1 = Project.objects.filter(id=idproj)
        tv = User(id=idwork)
        if project1.exists():
            project1 = project1.first()
            if tv.exists():
                tv = tv.first()
                project1.travailleurs.add(tv)
                projectData = self.serializer_class(project1).data
            return JsonResponse(projectData, safe=False, status=200)
        
        return JsonResponse("Ajout non effectué", safe=False, status=200)


class CommentEnvoieViewSet(CreateModelMixin, GenericViewSet):
    serializer_class = CommentaireSerializer
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return Commentaire.objects.all()
    
    def create(self, request, *args, **kwargs):
        idEmetteur = self.request.data['emetteur']
        idDestinataire = self.request.data['destinataire']
        text = self.request.data["text"]
        user_emetteur = User.objects.filter(id=idEmetteur)
        destinataireS = Profile.objects.filter(id=idDestinataire)
        print(self.request.data)
        if user_emetteur.exists() and destinataireS.exists():
            destinataireS = destinataireS.first()
            print("destinataireS.user ----------")
            print(destinataireS.user)
            print("destinataireS.user ----------")
            user_destinataire = destinataireS.user
            
            cm = Commentaire()
            cm.emetteur = user_destinataire
            cm.destinataire = user_destinataire
            cm.text = text
            cm.save()
            dataRet = self.serializer_class(cm).data
            
            return JsonResponse(dataRet, safe=True, status=201)
            
        return JsonResponse("Erreur lors de la creation", safe=True, status=404)


class CommentGetViewSet(ListModelMixin, GenericViewSet):
    serializer_class = CommentaireSerializer
    permission_classes = (AllowAny,)
    
    def get_queryset(self):
        return Commentaire.objects.all()
    
    def list(self, request, *args, **kwargs):
        idProfile = kwargs['id']
        profiles = Profile.objects.filter(id=idProfile)
        if profiles.exists():
            profiles = profiles.first()
            comments = Commentaire.objects.filter(destinataire=profiles.user.id)
            data_comments = self.serializer_class(comments, many=True).data
            return JsonResponse(data_comments, safe=False, status=200)
        
        return JsonResponse("Erreur lors de la creation", safe=True, status=404)
    
    
    


