import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:http/http.dart' as http;

import 'package:front/widgets/card_widgets.dart';

class PostulatRequest {
  static Future GetOnePostulatProject({project, user}) async {
    String url_postulat = const_base_url + 'postuleprojet/${project}/${user}/';

    http.Response response_project = await http.get(
      Uri.parse(url_postulat),
    );

    if (response_project.statusCode == 200) {
      return AdCardDataPostulat.fromJson(jsonDecode(response_project.body));
    } else {
      return false;
    }
  }

  static Future GetPostulatsProject({project}) async {
    String url_postulat = const_base_url + 'postuleprojet/${project}/';

    http.Response response_project = await http.get(
      Uri.parse(url_postulat),
    );

    if (response_project.statusCode == 200) {
      List datapostule = [];
      List datareceive = jsonDecode(response_project.body);
      datareceive.forEach((element) {
        datapostule.add(AdCardDataPostulat.fromJson(element));
      });
      return datapostule;
    } else {
      return false;
    }
  }

  static Future PostuleProject(AdCardDataPostulat postule) async {
    String url = const_base_url + 'postulat/';

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
      //var project = jsonDecode(response.body);
      return AdCardDataPostulat.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future UpdatePostuleProject({postulat, id_postulat}) async {
    String url = const_base_url + 'postulat/$id_postulat/';

    http.Response response = await http.put(
      Uri.parse(Uri.encodeFull(url)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "text": postulat.text,
        "somme_demande": postulat.somme_demande,
        "project": postulat.project,
        "user": postulat.user,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var project = jsonDecode(response.body);
      return AdCardDataPostulat.fromJson(project);
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
