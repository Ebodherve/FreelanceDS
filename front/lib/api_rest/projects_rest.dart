import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:front/widgets/card_widgets.dart';

class ProjectsRequest {
  static Future GetAllProjects() async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'Projet/';

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

  static Future GetOneProject(id) async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'Projet/' + '$id/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 201) {
      var project = jsonDecode(response.body);

      return AdCardDataProject.fromJson(project);
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
