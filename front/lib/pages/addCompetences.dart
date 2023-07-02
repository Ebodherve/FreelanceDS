import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:front/widgets/card_widgets.dart';

class AjoutCompetencePage extends StatefulWidget {
  AjoutCompetencePage({
    Key? key,
    required this.competences,
    required this.expert,
  }) : super(key: key);
  List competences;
  AdCardDataExpert expert;

  @override
  _AjoutCompetencePage createState() => _AjoutCompetencePage();
}

class _AjoutCompetencePage extends State<AjoutCompetencePage> {
  @override
  Widget build(BuildContext context) {
    print("My_competentcesid ..........");
    print(My_competentcesid);
    print(MyCompetentcesMAP);
    print("My_competentcesid ..........");
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "AJOUTEZ DES COMPETENCES",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: List.generate(
                My_competentcesid.length,
                (index) => Padding(
                  padding: EdgeInsets.all(20),
                  child: ChoiceChip(
                    selected: true,
                    onSelected: (value) {
                      print("value -----------");
                      print(value);
                      print("value -----------");
                      setState(() {
                        MyCompetentcesMAP.remove(My_competentcesid[index]);
                        My_competentcesid.remove(My_competentcesid[index]);
                      });
                    },
                    label: Text(CompetentcesMAP[My_competentcesid[index]]),
                  ),
                ),
              ).toList().cast<Widget>(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Selectionner",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Wrap(
              children: List.generate(competentces_id.length, (index) {
                print(competentces_id);
                print(My_competentcesid);
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: ChoiceChip(
                    selected: false,
                    label: Text(CompetentcesMAP[competentces_id[index]]),
                    onSelected: (value) {
                      setState(() {
                        if (!(My_competentcesid.contains(
                            competentces_id[index]))) {
                          MyCompetentcesMAP[competentces_id[index]] =
                              CompetentcesMAP[competentces_id[index]];
                          My_competentcesid.add(competentces_id[index]);
                        }
                      });
                    },
                  ),
                );
              }).toList().cast<Widget>(),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.blueGrey,
                child: Text("Ajouter"),
                onPressed: () {
                  print("Update ......");
                  ProfilRequest.UpdateCompProfil(
                          competences: MyCompetentcesMAP.keys,
                          profileid: USER_PROFILE_ID)
                      .then(
                    (value) {
                      Navigator.pop(context);
                    },
                  );
                  widget.expert.competences.clear();
                  MyCompetentcesMAP.keys.forEach((element) {
                    widget.expert.competences.add(element);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
