import 'dart:convert';

import 'package:flutter/material.dart';

class AdCardDataExpert {
  final int id;
  final String description;
  final String nom;
  final String email;
  final String titre;
  final String? image;
  final String? login;
  final String? password;
  final String price_per_hour;
  final int nb_etoile;
  final int nb_skills;
  final List<String> skills;

  AdCardDataExpert({
    required this.id,
    required this.description,
    this.nom = '',
    this.email = '',
    this.titre = '',
    this.image = '',
    this.login = '',
    this.password = '',
    this.price_per_hour = '',
    this.nb_etoile = 6,
    this.nb_skills = 0,
    this.skills = const [],
  });

  factory AdCardDataExpert.fromJson(Map<String, dynamic> json) {
    //final formatCurrency = NumberFormat.simpleCurrency(locale: 'fr_FR');

    /*var skill_liste = jsonDecode(json['competence'] ?? '[]');

    skill_liste = skill_liste.map<String>((image) {
      return image.toString();
    }).toList();*/

    return AdCardDataExpert(
      id: int.parse(json['CNI']),
      //id: json['CNI'],
      //id: 1,
      description: json['Description'] ?? '',
      titre: json['titre'] ?? '',
      nom: json['Nom'] ?? '',
      price_per_hour: json['PRICE_PER_HOUR'] ?? '',
      image: json['IMAGE'],
      /*nb_skills: json['NB_SKILLS'] ? int.parse(json['NB_SKILLS']) : 0,
        nb_etoile: json['NB_ETOILE'] ? int.parse(json['NB_ETOILE']) : 0,
        nb_skills: int.parse(json['NB_SKILLS']) ?? 0,
        nb_etoile: int.parse(json['NB_ETOILE']) ?? 0,
        skills: skill_liste.isEmpty ? [json['competence'] ?? ''] : skill_liste,*/
    );
  }

  @override
  String toString() {
    return "{id: $id \n"
        "description: $description \n"
        "nom: $nom \n"
        "titre: $titre \n"
        "image: $image \n"
        "price_per_hour: $price_per_hour \n";
  }
}

class ExpertsCardWidget extends StatefulWidget {
  ExpertsCardWidget({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false
  }) : super(key: key);

  AdCardDataExpert dataObject;
  // Search? searchObject;
  // bool viewed;

  @override
  _ExpertsCardWidget createState() => _ExpertsCardWidget();
}

class _ExpertsCardWidget extends State<ExpertsCardWidget> {
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
                          widget.dataObject.nom + widget.dataObject.titre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 15.0,
                              color: index == widget.dataObject.nb_etoile
                                  ? Colors.grey
                                  : Colors.orange,
                            ),
                          ).toList().cast<Widget>(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.dataObject.description),
                        Row(
                          children: List.generate(
                            widget.dataObject.nb_skills,
                            (index) => ListTile(
                              title: Text(widget.dataObject.skills[index]),
                            ),
                          ).toList().cast<Widget>(),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        print("Expert");
      },
    );
  }
}

class ExpertsCardWidgetSimple extends StatefulWidget {
  ExpertsCardWidgetSimple({
    Key? key,
  }) : super(key: key);

  @override
  _ExpertsCardWidgetSimple createState() => _ExpertsCardWidgetSimple();
}

class _ExpertsCardWidgetSimple extends State<ExpertsCardWidgetSimple> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/images/im1.png"),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Titre",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 15.0,
                              color: index == 4 ? Colors.grey : Colors.orange,
                            ),
                          ).toList().cast<Widget>(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("description"),
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

class AdCardDataEnterprise {
  final int id;
  final String description;
  final String nom;

  AdCardDataEnterprise({
    required this.id,
    required this.description,
    this.nom = '',
  });

  factory AdCardDataEnterprise.fromJson(Map<String, dynamic> json, stype) {
    return AdCardDataEnterprise(
        id: int.parse(json['ID']),
        description: json['DESCRIPTION'] ?? '',
        nom: json['NOM'] ?? '');
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
  final String description;
  final String titre;
  final String price_min;
  final String price_max;

  AdCardDataProject({
    required this.id,
    required this.description,
    this.titre = '',
    this.price_min = '',
    this.price_max = '',
  });

  factory AdCardDataProject.fromJson(Map<String, dynamic> json) {
    return AdCardDataProject(
      id: json['id'],
      //id: int.parse(json['id']),
      description: json['Description'] ?? '',
      titre: json['Nom'] ?? '',
      price_min: json['PRICE_MIN'] ?? '',
      price_max: json['PRICE_MAX'] ?? '',
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
                          padding: EdgeInsets.all(10),
                          child: Text(widget.dataObject.description),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("prix-min : " +
                              widget.dataObject.price_min +
                              "prix-max : " +
                              widget.dataObject.price_max),
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

class ProjectsCardWidgetSimple extends StatefulWidget {
  ProjectsCardWidgetSimple({
    Key? key,
  }) : super(key: key);

  @override
  _ProjectsCardWidgetSimple createState() => _ProjectsCardWidgetSimple();
}

class _ProjectsCardWidgetSimple extends State<ProjectsCardWidgetSimple> {
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
                          "Titre",
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
                          padding: EdgeInsets.all(10),
                          child: Text("Description"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("prix-min : " +
                              "100" +
                              "  " +
                              "prix-max : " +
                              "200"),
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
