import 'package:flutter/material.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:front/pages/dashboard.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/constants.dart';

class ModifProfilPage extends StatefulWidget {
  //final expert;
  ModifProfilPage({
    super.key,
    required this.expert,
  });

  AdCardDataExpert expert;

  @override
  _ModifProfilPage createState() => _ModifProfilPage();
}

class _ModifProfilPage extends State<ModifProfilPage> with RegisterAuth {
  static String titre_ = '';

  static String? description_;

  static int? prix_par_heure_;

  TextInputType tint = TextInputType.number;

  String imagePorf = "";

  @override
  Widget build(BuildContext context) {
    imagePorf = widget.expert.image == null ? "" : "${widget.expert.image}";
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
                height: 60.0,
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Placeholder(
                    fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                    //child: Image.network("${widget.dataObject.image}"),
                    //child: Image.network(""),
                    child: widget.expert.image != null
                        ? Image.network('${widget.expert.image}')
                        : Image.asset(
                            "assets/images/default_profile.png",
                          ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text("Photo de profile"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              SizedBox(
                height: 100,
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
                          const SizedBox(height: 25.0),
                          TextFormField(
                            initialValue: widget.expert.titre,
                            decoration: buildInputDecoration("Titre"),
                            validator: null,
                            onChanged: (t) {
                              titre_ = t;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            initialValue: widget.expert.description,
                            decoration: buildInputDecoration("Description"),
                            validator: null,
                            onChanged: (t) {
                              ;
                              description_ = t;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              //initialValue: widget.expert.prix_par_heure,
                              //initialValue: 0,
                              keyboardType: TextInputType.number,
                              decoration:
                                  buildInputDecoration("prix par heure"),
                              validator: null,
                              onChanged: (t) {
                                prix_par_heure_ = int.parse(t);
                              },
                            ),
                          ),
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
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  //0,
                  widget.expert.competences.length,
                  (index) => Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      //"",
                      widget.expert.competences[index],
                      style: TextStyle(fontSize: 25, color: Colors.pink),
                    ),
                  ),
                ).toList().cast<Widget>(),
              ),
              MaterialButton(
                onPressed: () {
                  register();
                },
                child: Text("ajouter des competences"),
              )
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
        //debugPrint(titre_);

        AdCardDataExpert data = AdCardDataExpert(
          id: USER_PROFILE_ID,
          titre: titre_,
          description: description_,
          prix_par_heure: prix_par_heure_,
        );
        ProfilRequest.UpdateExpertProfil(
            expert: data, profileid: USER_PROFILE_ID);
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
