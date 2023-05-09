import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:http/http.dart' as http;

class ConnexionUser {
  static Future<bool> ConnectExpertRest({username, email, password}) async {
    String base_url = "http://127.0.0.1:8000/api/";
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
      Map data = jsonDecode(response.body);
      thoken_authentification = data["key"];

      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create account.');
    }
  }
}
