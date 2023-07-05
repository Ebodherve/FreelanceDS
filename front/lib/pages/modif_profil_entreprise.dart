import 'package:flutter/material.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:front/api_rest/projects_rest.dart';
import 'package:front/pages/my_projects.dart';
//import 'package:front/pages/dashboard.dart';
import 'package:front/pages/update_projets.dart';
import 'package:front/pages/update_image.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/constants.dart';

class ModifProfilEPage extends StatefulWidget {
  //final expert;
  ModifProfilEPage({
    super.key,
    required this.entreprise,
  });

  AdCardDataEnterprise entreprise;

  @override
  _ModifProfilEPage createState() => _ModifProfilEPage();
}

class _ModifProfilEPage extends State<ModifProfilEPage> with RegisterAuth {
  static String nom_ = '';

  static String description_ = '';

  String imagePorf = "";

  @override
  Widget build(BuildContext context) {
    imagePorf =
        widget.entreprise.image == null ? "" : "${widget.entreprise.image}";
    nom_ = widget.entreprise.nom;
    description_ = widget.entreprise.description;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: const Color(0xfffcfcfb),
                //color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Placeholder(
                        fallbackHeight:
                            MediaQuery.of(context).size.height * 0.3,
                        fallbackWidth: MediaQuery.of(context).size.width * 0.5,
                        child: widget.entreprise.image != ""
                            ? Image.network(
                                const_base_urlIm + '${widget.entreprise.image}')
                            : Image.asset(
                                "assets/images/default_profile.png",
                              ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateImagePage(
                                type_im: "entreprise",
                                defaultIm: widget.entreprise.image != ""
                                    ? const_base_urlIm +
                                        '${widget.entreprise.image}'
                                    : "",
                              ),
                            ),
                          );
                        },
                        child: Text("Logo"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
              SizedBox(
                height: 50,
              ),
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
                          const SizedBox(height: 25.0),
                          TextFormField(
                            initialValue: widget.entreprise.nom,
                            decoration: buildInputDecoration("Nom"),
                            validator: null,
                            onChanged: (t) {
                              nom_ = t;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            initialValue: widget.entreprise.description,
                            decoration: buildInputDecoration("Description"),
                            validator: null,
                            onChanged: (t) {
                              ;
                              description_ = t;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          CreateProjectWidget(),
                          MesProjetsWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: MediaQuery.of(context).size.width,
                        // color: const Color(0xff449b76),
                        color: Color.fromARGB(255, 3, 196, 9),
                        onPressed: () {
                          register();
                        },
                        child: const Text("Mettre à jour",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    //CreateProjectWidget(),
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
        AdCardDataEnterprise data = AdCardDataEnterprise(
          id: USER_PROFILE_ID,
          nom: nom_,
          description: description_,
        );
        ProfilRequest.UpdateEntrepriseProfil(
            entreprise: data, profileid: USER_PROFILE_ENTREPRISE_ID);
      }

      //setState(() {});
    }

    return null;
  }
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();

  bool rememberMe = false;

  Future register();
}

class CreateProjectWidget extends StatefulWidget {
  CreateProjectWidget({
    String this.name = "creation d'un projet",
  });

  final name;

  @override
  _CreateProjectWidget createState() => _CreateProjectWidget();
}

class _CreateProjectWidget extends State<CreateProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        child: Text(widget.name),
        onPressed: () {
          AdCardDataProject P1 = AdCardDataProject(
            id: 0,
            description: "",
            createur: USER_ID,
          );
          ProjectsRequest.CreateOneProject(P1).then(
            (value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreationProjectsPage(project: value)));
            },
          );
        },
      ),
    );
  }
}

class MesProjetsWidget extends StatefulWidget {
  MesProjetsWidget({
    String this.name = "mes projets",
  });

  final name;

  @override
  _MesProjetsWidget createState() => _MesProjetsWidget();
}

class _MesProjetsWidget extends State<MesProjetsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        child: Text(widget.name),
        onPressed: () {
          AdCardDataProject P1 = AdCardDataProject(
            id: 0,
            description: "",
            createur: USER_ID,
          );
          ProjectsRequest.GetMyProjects(createur: USER_ID).then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectsModifPage(data: value),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
