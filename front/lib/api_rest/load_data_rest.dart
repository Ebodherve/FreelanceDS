import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:front/constants.dart';

class LoadDataSiteRequest {
  static Future<bool> LoadCompetences() async {
    String base_url = const_base_url;
    String url = base_url + 'competence/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      Liste_competentces.clear();
      competentces_id.clear();
      data_json.forEach((element) {
        CompetentcesMAP[element["id"]] = element["nom"];
        competentces_id.add(element["id"]);
        print("${element['id']} - ${element['nom']}");

        /*Liste_competentces.add(
          Competence(id: element["id"], name: element["nom"]),
        );*/
      });

      return true;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future<bool> LoadDevises() async {
    String base_url = const_base_url;
    String url = base_url + 'devise/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      Liste_devises.clear();
      data_json.forEach((element) {
        Liste_devises.add(
          Devise(id: element["id"], nom: element["nom"]),
        );
      });

      return true;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future<bool> Load() async {
    return true;
  }
}
