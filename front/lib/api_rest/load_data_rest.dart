import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:front/constants.dart';

class LoadDataSiteRequest {
  static Future<bool> LoadCompetences() async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'Competences/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      data_json.forEach((element) {
        Liste_competentces.add(
          Competence(id: element["id"], name: element["competence"]),
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
