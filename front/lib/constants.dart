var thoken_authentification = "";
List Liste_competentces = [];
List competentces_id = [];
List My_competentces = [];
List Liste_devises = [];
int USER_ID = -1;
int USER_PROFILE_ID = -1;
int USER_PROFILE_ENTREPRISE_ID = -1;
String TOKEN = "";

class Competence {
  final id;
  final name;

  Competence({required this.id, required this.name});

  String get_name() {
    return this.name;
  }
}

class Devise {
  final id;
  final nom;

  Devise({required this.id, required this.nom});

  String get_name() {
    return this.nom;
  }
}

String const_base_url = "http://127.0.0.1:8000/";
