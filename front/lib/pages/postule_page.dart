import 'package:flutter/material.dart';
import 'package:front/api_rest/postulat_rest.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/pages/postulats.dart';
import 'package:front/constants.dart';

class PostuleProjetPage extends StatefulWidget {
  //final expert;
  PostuleProjetPage({
    super.key,
    required this.projet,
    int this.id_postule = 0,
    int this.somme = 0,
    String this.text = "",
  });
  AdCardDataProject projet;
  int id_postule;
  int somme;
  String text;

  @override
  _PostuleProjetPage createState() => _PostuleProjetPage();
}

class _PostuleProjetPage extends State<PostuleProjetPage> with RegisterAuth {
  String text_ = "";

  int somme_ = 0;

  @override
  Widget build(BuildContext context) {
    text_ = widget.text;
    somme_ = widget.somme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.grey[500],
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.projet.titre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          widget.projet.description,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 3,
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
                            initialValue: widget.text,
                            decoration:
                                buildInputDecoration("Faite votre proposition"),
                            validator: null,
                            onChanged: (t) {
                              text_ = t;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: buildInputDecoration("somme demandé"),
                              /*inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],*/
                              validator: null,
                              onChanged: (t) {
                                somme_ = int.parse(t);
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
                        child: const Text("postuler",
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
        AdCardDataPostulat postule = AdCardDataPostulat(
          text: text_,
          somme_demande: somme_,
          project: widget.projet.id,
          user: USER_ID,
        );
        PostulatRequest.UpdatePostuleProject(
                postulat: postule, id_postulat: widget.id_postule)
            .then((value) {
          PostulatRequest.GetPostulatsProject(project: widget.projet.id)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostulatsPage(data: value)));
          });
        });
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
