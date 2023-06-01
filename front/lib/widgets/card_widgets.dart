import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/utils/utils_fonctions.dart';
import 'package:front/pages/postule_page.dart';
import 'package:front/pages/portfolio.dart';
import 'package:front/api_rest/postulat_rest.dart';

class AdCardDataExpert {
  final int id;
  final description;
  final String titre;
  final String? image;
  final password;
  final prix_par_heure;
  final nb_etoiles;
  final List competences;

  AdCardDataExpert({
    required this.id,
    this.description = '',
    this.titre = '',
    this.image = '',
    this.password = '',
    this.prix_par_heure = 0,
    this.nb_etoiles = 0,
    this.competences = const [],
  });

  /*String getImage() {
    return this.image;
  }*/

  factory AdCardDataExpert.fromJson(Map<String, dynamic> json) {
    List<String> liste_competences = [];
    List data_competences = json['competences'] ?? [];
    data_competences = get_list_competences(list_id: data_competences);
    data_competences.forEach((element) {
      liste_competences.add(element);
    });

    return AdCardDataExpert(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      titre: json['titre'] ?? '',
      description: json['description'] ?? '',
      nb_etoiles: json['nb_etoiles'] ?? '',
      prix_par_heure: json['prix_par_heure'] ?? 0,
      competences: liste_competences,
    );
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $description \n"
        "titre: $titre \n"
        "image: $image \n"
        "price_per_hour: $prix_par_heure \n";
  }
}

class AdCardDataEnterprise {
  final int id;
  final String description;
  final String nom;
  final String image;
  final int user;

  AdCardDataEnterprise({
    required this.id,
    this.description = '',
    this.nom = '',
    this.image = '',
    this.user = 0,
  });

  factory AdCardDataEnterprise.fromJson(Map<String, dynamic> json, stype) {
    return AdCardDataEnterprise(
        id: int.parse(json['id']),
        description: json['description'] ?? '',
        nom: json['nom'] ?? '',
        user: json['user'] ?? 0);
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $description \n"
        "nom: $nom \n";
  }
}

class EnterprisesCardWidget extends StatefulWidget {
  EnterprisesCardWidget({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false
  }) : super(key: key);

  AdCardDataEnterprise dataObject;
  // Search? searchObject;
  // bool viewed;

  @override
  _EnterprisesCardWidget createState() => _EnterprisesCardWidget();
}

class _EnterprisesCardWidget extends State<EnterprisesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataObject.nom,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(widget.dataObject.description),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EnterprisesCardWidgetSimple extends StatefulWidget {
  EnterprisesCardWidgetSimple({
    Key? key,
  }) : super(key: key);

  @override
  _EnterprisesCardWidgetSimple createState() => _EnterprisesCardWidgetSimple();
}

class _EnterprisesCardWidgetSimple extends State<EnterprisesCardWidgetSimple> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NOM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('DESCRIPTION'),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdCardDataProject {
  final int id;
  final String titre;
  final String description;
  final int min_prix;
  final int max_prix;
  final String devise;
  final int createur;
  final List travailleurs;

  AdCardDataProject({
    required this.id,
    required this.description,
    this.titre = '',
    this.devise = '',
    this.min_prix = 0,
    this.max_prix = 0,
    this.createur = 0,
    this.travailleurs = const [],
  });

  factory AdCardDataProject.fromJson(Map<String, dynamic> json) {
    //String monnaie = "\$";
    int d = json['devise'];
    String monnaie = get_devise(id: d);

    return AdCardDataProject(
      id: json['id'],
      description: json['description'] ?? '',
      titre: json['titre'] ?? '',
      devise: monnaie,
      min_prix: json['min_prix'] ?? '',
      max_prix: json['max_prix'] ?? 0,
      createur: json["createur"] ?? 0,
      travailleurs: json["travailleurs"] ?? [],
    );
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $description \n"
        "titre: $titre \n";
  }
}

class ProjectsCardWidget extends StatefulWidget {
  ProjectsCardWidget({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false
  }) : super(key: key);

  AdCardDataProject dataObject;
  // Search? searchObject;
  // bool viewed;

  @override
  _ProjectsCardWidget createState() => _ProjectsCardWidget();
}

class _ProjectsCardWidget extends State<ProjectsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.82,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataObject.titre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(widget.dataObject.description),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "prix-min :  " +
                                "${widget.dataObject.min_prix} " +
                                "${widget.dataObject.devise}" +
                                "  " +
                                "prix-max :  " +
                                "${widget.dataObject.max_prix} " +
                                "${widget.dataObject.devise}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        PostulatRequest.GetPostulatProject(
                project: widget.dataObject.id, user: USER_ID)
            .then((value) {
          if (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostuleProjetPage(
                        projet: widget.dataObject,
                        text: value["text"],
                        somme: value["somme_demande"],
                      )),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostuleProjetPage(
                        projet: widget.dataObject,
                      )),
            );
          }
        });
      },
    );
  }
}

class AdCardDataEntreprise {
  final int id;
  final String nom;
  final String image;
  final String description;
  final int user;

  AdCardDataEntreprise({
    required this.id,
    this.description = "",
    this.nom = '',
    this.image = '',
    this.user = 0,
  });

  factory AdCardDataEntreprise.fromJson(Map<String, dynamic> json) {
    return AdCardDataEntreprise(
      id: json['id'],
      description: json['description'] ?? '',
      nom: json['nom'] ?? '',
      user: json['user'] ?? 0,
    );
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $description \n"
        "titre: $nom \n";
  }
}

class AdCardDataPostulat {
  final id;
  final text;
  final project;
  final somme_demande;
  final user;

  AdCardDataPostulat({
    this.id,
    this.text = '',
    this.project = 0,
    this.somme_demande = 0,
    this.user = 0,
  });

  factory AdCardDataPostulat.fromJson(Map<String, dynamic> json) {
    List<String> liste_competences = [];
    List data_competences = json['competences'] ?? [];
    data_competences = get_list_competences(list_id: data_competences);
    data_competences.forEach((element) {
      liste_competences.add(element);
    });

    return AdCardDataPostulat(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      project: json['project'] ?? 0,
      somme_demande: json['somme_demande'] ?? 0,
      user: json['user'] ?? 0,
    );
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $text \n";
  }
}
