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
    this.nb_etoile = 0,
    this.nb_skills = 0,
    this.skills = const [],
  });

  factory AdCardDataExpert.fromJson(Map<String, dynamic> json, stype) {
    //final formatCurrency = NumberFormat.simpleCurrency(locale: 'fr_FR');

    var skill_liste = jsonDecode(json['SKILLS'] ?? '[]');

    skill_liste = skill_liste.map<String>((image) {
      return image.toString();
    }).toList();

    return AdCardDataExpert(
        id: int.parse(json['ID']),
        description: json['DESCRIPTION'] ?? '',
        titre: json['titre'] ?? '',
        nom: json['NOM'] ?? '',
        price_per_hour: json['PRICE_PER_HOUR'] ?? '',
        image: json['IMAGE'],
        nb_skills: int.parse(json['NB_SKILLS']),
        nb_etoile: int.parse(json['NB_ETOILE']),
        skills: skill_liste.isEmpty ? [json['SKILLS'] ?? ''] : skill_liste);
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
                        ListView.builder(
                            itemCount: widget.dataObject.nb_skills,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(widget.dataObject.skills[index]),
                                )),
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
