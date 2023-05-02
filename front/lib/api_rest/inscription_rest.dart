import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
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
        nom: json['NOM'] ?? '',
        email: json['EMAIL'] ?? '',
        login: json['LOGIN'] ?? '',
        password: json['PASSWORD'] ?? '');
  }

  @override
  String toString() {
    return "{nom: $nom \n";
  }
}

class InscriptionUser {
  static Future<bool> SendExpertRest(AdCardExpertInscription data) async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'Utilisateur/';
    Map b = {"nom": data.nom, "email": data.email};
    //http.Response response = await http.get(Uri.encodeFull(url));
    //http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)));

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": data.password,
        "Nom": data.nom,
        "Login": data.login,
        "Email": data.email,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
