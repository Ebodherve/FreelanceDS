import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:http/http.dart' as http;
import 'package:front/widgets/card_widgets.dart';

class ConnexionUser {
  static Future<bool> ConnectExpertRestV0({username, email, password}) async {
    String base_url = const_base_url;
    String url = base_url + 'freelance_auth/login/';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "username": username,
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //thoken_authentification = data["key"];
      int id_user = data["id"];
      USER_ID = id_user;

      ProfilRequest.GetExpertProfil(userid: id_user).then((value) {
        USER_PROFILE_ID = value.id;
      });

      return true;
    } else {
      throw Exception('Failed to create account.');
    }
  }

  static Future<bool> ConnectExpertRest({username, password}) async {
    String base_url = const_base_url;
    String url = base_url + 'login/';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "username": username,
      }),
    );

    if (response.statusCode == 200) {
      int id_user = jsonDecode(response.body)["id"];
      USER_ID = id_user;
      ProfilRequest.GetExpertProfil(userid: USER_ID).then((value) {
        if (value != false) {
          ProfilRequest.GetEntrepriseProfil(userid: USER_ID).then((value) {
            if (value != false) {
              return true;
            }
          });
        }
      });

      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create account.');
    }
  }
}

//10.55.10.187
