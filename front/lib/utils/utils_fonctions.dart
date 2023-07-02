import 'package:front/constants.dart';

List<String> get_list_competences({list_id}) {
  List<String> liste_competences = [];
  List l_id = list_id;
  l_id.forEach((id) {
    Liste_competentces.forEach((element) {
      liste_competences.add(CompetentcesMAP[id]);
    });
  });

  return liste_competences;
}

String get_devise({id}) {
  String devise = '\$';
  Liste_devises.forEach((element) {
    if (element.id == id) {
      devise = element.nom;
    }
  });

  return devise;
}
