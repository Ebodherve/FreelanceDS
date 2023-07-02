import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:http/http.dart' as http;

import 'package:front/widgets/card_widgets.dart';

class AdCardExpertInscription {
  final String? nom;
  final String? email;
  final String? login;
  final String? password;

  AdCardExpertInscription({
    this.nom = '',
    this.email = '',
    this.login = '',
    this.password = '',
  });

  factory AdCardExpertInscription.fromJson(Map<String, dynamic> json, stype) {
    return AdCardExpertInscription(
        nom: json['username'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '');
  }

  @override
  String toString() {
    return "{nom: $nom \n";
  }
}

class InscriptionUser {
  static Future<bool> SendExpertRest(AdCardExpertInscription data) async {
    String base_url = const_base_url;
    String url = base_url + 'register/';
    //http.MultipartFile();

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": data.password,
        "username": data.nom,
        "email": data.email,
      }),
    );

    int statuscode = response.statusCode;
    var responseJson = jsonDecode(response.body);

    print(response.body);

    if (statuscode == 201) {
      // Si le serveur retourne 201, l'inscription s'est bien passée
      // Creation d'un profile vide
      int userid = responseJson["id"];
      /*String titre = " ";
      String description = " ";
      int nb_etoiles = 0;
      int prix_par_heure = 0;
      List competences = [];
      int user = userid;
      String url_profile = base_url + 'profile/';

      final response_profile = await http.post(
        Uri.parse(url_profile),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "titre": titre,
          "description": description,
          "nb_etoiles": nb_etoiles,
          "competences": competences,
          "prix_par_heure": prix_par_heure,
          "user": user,
        }),
      );*/
      USER_ID = userid;
      ProfilRequest.CreateSimpleExpertProfil().then((value) {
        if (value) {
          ProfilRequest.CreateSimpleEntrepriseProfil().then((value) {
            if (value) return true;
          });
        }
      });

      return true;
      //return response_profile;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create account.');
    }
  }
}
