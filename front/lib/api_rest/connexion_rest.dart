import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnexionUser {
  static Future<bool> ConnectExpertRest({username, email, password}) async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'freelance_auth/login/';
    //http.Response response = await http.get(Uri.encodeFull(url));
    //http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)));
    print(url);
    print("---------------------------------------------");

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "username": username,
        // "username": data.nom,
        // "Login": data.login,
        "email": email,
      }),
    );
    print(response.body);
    print("--------------------------------------");
    print(response.statusCode);
    print("--------------------------------------");

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create account.');
    }
  }
}
