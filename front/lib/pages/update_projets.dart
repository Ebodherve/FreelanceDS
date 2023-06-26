import 'package:flutter/material.dart';
import 'package:front/api_rest/projects_rest.dart';
import 'package:front/pages/dashboard.dart';
import 'package:front/pages/experts_recommande.dart';
import 'package:front/pages/update_projets.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/constants.dart';

class CreationProjectsPage extends StatefulWidget {
  //final expert;
  CreationProjectsPage({
    super.key,
    required this.project,
  });

  AdCardDataProject project;

  @override
  _CreationProjectsPage createState() => _CreationProjectsPage();
}

class _CreationProjectsPage extends State<CreationProjectsPage>
    with RegisterAuth {
  static String titre_ = '';

  static String description_ = "";

  static int min_prix_ = 0;

  static int max_prix_ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              const Divider(height: 100.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: widget.project.titre,
                            decoration: buildInputDecoration("Titre"),
                            validator: null,
                            onChanged: (t) {
                              titre_ = t;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: widget.project.description,
                            decoration: buildInputDecoration("Description"),
                            validator: null,
                            onChanged: (t) {
                              ;
                              description_ = t;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              //
                              initialValue: "${widget.project.min_prix}",
                              keyboardType: TextInputType.number,
                              decoration: buildInputDecoration("Prix minimum"),
                              validator: null,
                              onChanged: (t) {
                                min_prix_ = int.parse(t);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              //
                              initialValue: "${widget.project.max_prix}",
                              keyboardType: TextInputType.number,
                              decoration: buildInputDecoration("Prix maximum"),
                              validator: null,
                              onChanged: (t) {
                                max_prix_ = int.parse(t);
                              },
                            ),
                          ),
                          RecommandeProfileWidget(
                            id_project: widget.project.id,
                            updatefunct: () {
                              register();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: MaterialButton(
                        height: 30.0,
                        minWidth: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(255, 3, 196, 9),
                        onPressed: () {
                          register();
                        },
                        child: const Text("Mettre à jour",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(hintText, [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    );

    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  @override
  Future register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      //if (rememberMe) {
      if (true) {
        AdCardDataProject data = AdCardDataProject(
          titre: titre_,
          description: description_,
          devise: widget.project.devise,
          min_prix: min_prix_,
          max_prix: max_prix_,
          travailleurs: widget.project.travailleurs,
          createur: widget.project.createur,
        );
        ProjectsRequest.UpdateOneProject(
          data,
          widget.project.id,
        );
      }

      await Future.delayed(const Duration(seconds: 1));

      setState(() {});
    }

    return null;
  }
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();

  bool rememberMe = false;

  Future register();
}

class RecommandeProfileWidget extends StatefulWidget {
  RecommandeProfileWidget({
    String this.name = "Vos recommandation pour ce projet",
    int this.id_project = 0,
    required this.updatefunct,
  });

  final name;
  final id_project;
  VoidCallback updatefunct;

  @override
  _RecommandeProfileWidget createState() => _RecommandeProfileWidget();
}

class _RecommandeProfileWidget extends State<RecommandeProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        child: Text(widget.name),
        onPressed: () {
          widget.updatefunct();
          ProjectsRequest.GetProfilesProjectRecomand(
            id__project: widget.id_project,
          ).then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpertsRecommandPage(data: value),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PostulatProjetWidget extends StatefulWidget {
  PostulatProjetWidget({
    String this.name = "Vos postulats pour ce projet",
    int this.id_project = 0,
    required this.updatefunct,
  });

  final name;
  final id_project;
  VoidCallback updatefunct;

  @override
  _PostulatProjetWidget createState() => _PostulatProjetWidget();
}

class _PostulatProjetWidget extends State<PostulatProjetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        child: Text(widget.name),
        onPressed: () {
          widget.updatefunct();
          ProjectsRequest.GetProfilesProjectRecomand(
            id__project: widget.id_project,
          ).then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpertsRecommandPage(data: value),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
