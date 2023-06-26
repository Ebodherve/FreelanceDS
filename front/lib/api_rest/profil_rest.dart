import 'dart:convert';

import 'package:front/constants.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfilRequest {
  static Future GetExpertProfil({userid, Imprecision = false}) async {
    String base_url = const_base_url;
    int id = userid != null ? userid : USER_ID;
    String url = base_url + 'profileuser/' + '$id';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      Map jsonExpert = jsonDecode(response.body);

      if (jsonExpert["id"] == null) {
        ProfilRequest.CreateSimpleExpertProfil();
        return ProfilRequest.GetExpertProfil(userid: USER_ID);
      }

      USER_PROFILE_ID = jsonExpert["id"];
      AdCardDataExpert expert;

      if (Imprecision) {
        expert = AdCardDataExpert.fromJson(
          json: jsonDecode(response.body),
          Imbase: const_base_urlIm,
        );
      } else {
        expert = AdCardDataExpert.fromJson(
          json: jsonDecode(response.body),
        );
      }

      /*AdCardDataExpert expert = AdCardDataExpert(
        id: jsonExpert["id"],
        description: jsonExpert["description"],
        image: jsonExpert["image"],
        titre: jsonExpert["titre"],
        prix_par_heure: jsonExpert["prix_par_heure"],
        competences: jsonExpert["competences"],
      );*/
      return expert;
    }
    //else if (response.statusCode == 500) {}
    else {
      throw Exception('Failed to create album.');
    }
  }

  static Future GetEntrepriseProfil({userid}) async {
    String base_url = const_base_url;
    int id = userid != null ? userid : USER_ID;
    String url = base_url + 'profilentrepriseuser/' + '$id';

    http.Response response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );

    if (response.statusCode == 200) {
      var jsonExpert = jsonDecode(response.body);

      if (jsonExpert["id"] == null) {
        ProfilRequest.CreateSimpleEntrepriseProfil();
        return ProfilRequest.GetEntrepriseProfil(userid: USER_ID);
      }

      USER_PROFILE_ENTREPRISE_ID = jsonExpert["id"];

      AdCardDataEnterprise entreprise = AdCardDataEnterprise(
        id: jsonExpert["id"],
        description: jsonExpert["description"],
        nom: jsonExpert["nom"],
        image: jsonExpert["image"] != null ? jsonExpert["image"] : "",
      );
      //AdCardDataEnterprise expert = AdCardDataEnterprise.fromJson(jsonExpert);
      AdCardDataEnterprise enterprise =
          AdCardDataEnterprise.fromJson(jsonExpert);

      return entreprise;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future UpdateEntrepriseProfil({entreprise, profileid}) async {
    String base_url = const_base_url;
    String url = base_url + 'profilentreprise/' + '$profileid/';

    http.Response response = await http.put(
      Uri.parse(Uri.encodeFull(url)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "nom": entreprise.nom,
        "description": entreprise.description,
        //"image": entreprise.image,
        //"user": USER_ID,
      }),
    );

    if (response.statusCode == 200) {
      //return jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future UpdateExpertProfil({expert, profileid}) async {
    String base_url = const_base_url;
    String url = base_url + 'profile/' + '$profileid/';
    AdCardDataExpert expert_ = expert;

    http.Response response = await http.put(
      Uri.parse(Uri.encodeFull(url)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "titre": expert_.titre,
        "description": expert_.description,
        "nb_etoiles": expert_.nb_etoiles,
        "competences": expert_.competences,
        "prix_par_heure": expert_.prix_par_heure,
        //"user": USER_ID,
      }),
    );

    if (response.statusCode == 200) {
      //return jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future UpdateExpertImProfil({file, profileid}) async {
    String base_url = const_base_url;
    String url = base_url + 'profile/' + '$profileid/';

    print("Debut ------------------1");

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    print("Debut ------------------1");

    http.StreamedResponse Sresponse = await request.send();

    http.Response response = await http.Response.fromStream(Sresponse);

    print("response----------------------------");
    print("response----------------------------");
    print(response.body);
    print("response----------------------------");
    print("response----------------------------");

    if (response.statusCode == 200) {
      //return jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future CreateSimpleExpertProfil() async {
    String base_url = const_base_url;
    String url_profile = base_url + 'profile/';

    String titre = " ";
    String description = " ";
    int nb_etoiles = 0;
    int prix_par_heure = 0;
    List competences = [];
    int user = USER_ID;

    final response_profile = await http.post(
      Uri.parse(url_profile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "titre": titre,
        "description": description,
        "nb_etoiles": nb_etoiles,
        "competences": competences,
        "prix_par_heure": prix_par_heure,
        "user": USER_ID,
      }),
    );

    USER_PROFILE_ID = jsonDecode(response_profile.body)["id"];

    if (response_profile.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future CreateSimpleEntrepriseProfil() async {
    String base_url = const_base_url;
    String url_profile = base_url + 'profilentreprise/';

    int userid = USER_ID;
    String nom = " ";
    String description = " ";
    String image = "";
    int user = userid;

    final response_profile = await http.post(
      Uri.parse(url_profile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "nom": nom,
        "description": description,
        //"image": image,
        "user": user,
      }),
    );

    if (response_profile.statusCode == 201) {
      USER_PROFILE_ENTREPRISE_ID = jsonDecode(response_profile.body)["id"];

      return true;
    } else {
      return false;
    }
  }
}
