import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:http/http.dart' as http;

import 'package:front/widgets/card_widgets.dart';

class PostulatRequest {
  static Future GetAllProjects() async {
    String base_url = const_base_url;
    String url = base_url + 'projetsearch/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    // if (response.statusCode == 201) {
    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      List<dynamic> data = [];
      data_json.forEach((element) {
        data.add(AdCardDataProject.fromJson(element));
      });
      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetPostulatProject({project, user}) async {
    String url_postulat = const_base_url + 'postuleprojet/${project}/${user}/';

    http.Response response_project = await http.get(
      Uri.parse(const_base_url),
    );

    if (response_project.statusCode == 200) {
      return jsonDecode(response_project.body);
    } else {
      return false;
    }
  }

  static Future PostuleProject(AdCardDataPostulat postule) async {
    String base_url = "http://127.0.0.1:8000/";
    String url = base_url + 'postulat/';

    http.Response response = await http.post(
      Uri.parse(Uri.encodeFull(url)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "text": postule.text,
        "somme_demande": postule.somme_demande,
        "project": postule.project,
        "user": postule.user,
      }),
    );

    if (response.statusCode == 201) {
      var project = jsonDecode(response.body);
      return project;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static convert_to_card(Jdata) {
    List<dynamic> Liste_data = [];
    List<dynamic> data = jsonDecode(Jdata);

    data.forEach((element) {
      Liste_data.add(AdCardDataProject(
          id: element["id"], description: element["description"]));
    });

    return Liste_data;
  }
}
