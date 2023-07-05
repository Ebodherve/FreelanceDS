import 'dart:convert';

import 'package:front/constants.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';

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
        data.add(AdCardDataExpert.fromJson(json: element));
      });

      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future SendComment({AdCardDataComment? CommentInfo}) async {
    if (CommentInfo != null) {
      String url = const_base_url + "commentairesSend/";

      http.Response response = await http.post(
        Uri.parse(Uri.encodeFull(url)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "destinataire": CommentInfo.destinataire,
          "emetteur": CommentInfo.emetteur,
          "text": CommentInfo.text,
        }),
      );

      if (response.statusCode == 201) {
        return AdCardDataComment.fromJson(
          json: jsonEncode(response.body),
        );
      } else {
        throw Exception('Failed to create album.');
      }
    } else {
      return false;
    }
  }

  static Future GetComment({destinataire}) async {
    if (destinataire != null) {
      String url = const_base_url + "commentairesGet/${destinataire}/";

      http.Response response = await http.get(
        Uri.parse(Uri.encodeFull(url)),
      );

      if (response.statusCode == 200) {
        List comments = [];

        jsonDecode(response.body).then((element) {
          comments.add(
            AdCardDataComment.fromJson(json: element),
          );
        });
        return comments;
      } else {
        throw Exception('Failed to create album.');
      }
    } else {
      return false;
    }
  }

  static Future GetTravailleursProject({project}) async {
    String base_url = const_base_url;
    String url = base_url + 'projettravailleur/$project/';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      List data_json = jsonDecode(response.body);
      List<AdCardDataExpert> data = [];
      data_json.forEach((element) {
        data.add(AdCardDataExpert.fromJson(json: element));
      });

      return data;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetOneExpert(id) async {
    String base_url = const_base_url;
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
