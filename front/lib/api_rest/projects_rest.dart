import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:http/http.dart' as http;

import 'package:front/widgets/card_widgets.dart';

class ProjectsRequest {
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

  static Future GetMyProjects({createur}) async {
    String base_url = const_base_url;
    String url = base_url + 'projetcreateur/$createur/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    // if (response.statusCode == 201) {
    if (response.statusCode == 200) {
      //List data_json = jsonDecode(response.body);
      List data_json = jsonDecode(response.body);
      List data = [];
      data_json.forEach((element) {
        data.add(AdCardDataProject.fromJson(element));
      });
      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetProfilesProjectRecomand({id__project}) async {
    String base_url = const_base_url;
    String url = base_url + 'recommandeFreel/$id__project/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      List data = [];
      data_json.forEach((element) {
        data.add(AdCardDataExpert.fromJson(json: element));
      });
      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future CreateOneProject(AdCardDataProject project) async {
    String base_url = const_base_url;
    String url_project = base_url + 'projet/';

    http.Response response_project = await http.post(
      Uri.parse(url_project),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "titre": project.titre,
        "description": project.description,
        'min_prix': project.min_prix,
        'max_prix': project.max_prix,
        'devise': 1,
        //'devise': project.devise,
        'createur': project.createur,
        'travailleurs': project.travailleurs,
        //'fini': false
      }),
    );

    print(response_project.body);
    print(response_project.statusCode);

    if (response_project.statusCode == 201) {
      //return true;

      return AdCardDataProject.fromJson(jsonDecode(response_project.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future UpdateOneProject(
    AdCardDataProject project,
    int id_project,
  ) async {
    String base_url = const_base_url;
    String url_project = base_url + 'projet/$id_project/';

    http.Response response_project = await http.put(
      Uri.parse(url_project),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "titre": project.titre,
        "description": project.description,
        'min_prix': project.min_prix,
        'max_prix': project.max_prix,
        //'devise': project.devise,
        'travailleurs': project.travailleurs,
        'fini': 'non fini',
      }),
    );

    print(response_project.body);

    if (response_project.statusCode == 200) {
      return AdCardDataProject.fromJson(jsonDecode(response_project.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetOneProject(id) async {
    String base_url = const_base_url;
    String url = base_url + 'projet/' + '$id/';

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

  static Future AddTravailleur({projet, travailleur}) async {
    String url = const_base_url + 'acceptetravailleur/$projet/$travailleur/';
    http.Response response = await http.post(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 201) {
      return AdCardDataExpert.fromJson(json: jsonDecode(response.body));
    } else {
      return false;
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
