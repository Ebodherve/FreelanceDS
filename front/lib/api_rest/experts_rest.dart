import 'dart:convert';

import 'package:front/constants.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ExpertsRequest {
  static Future GetAllExperts() async {
    String base_url = const_base_url;
    String url = base_url + 'profile/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      List<AdCardDataExpert> data = [];
      data_json.forEach((element) {
        data.add(AdCardDataExpert.fromJson(element));
      });

      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetOneExpert(id) async {
    String base_url = "http://127.0.0.1:8000/api/";
    String url = base_url + 'Expert/' + '$id/';

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
}
