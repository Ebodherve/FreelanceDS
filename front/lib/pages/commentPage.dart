import 'package:flutter/material.dart';
/*
import 'package:front/api_rest/inscription_rest.dart';
import 'package:front/pages/dashboard.dart';
*/
import 'package:front/widgets/card_widgets.dart';
import 'package:front/api_rest/experts_rest.dart';
import 'package:front/constants.dart';

class CommentPage extends StatefulWidget {
  CommentPage({
    Key? key,
    required this.expertInfo,
  }) : super(key: key);

  AdCardDataExpert expertInfo;
  @override
  _CommentPage createState() => _CommentPage();
}

class _CommentPage extends State<CommentPage> with RegisterAuth {
  static String commentText_ = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: <Widget>[
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
                        Text("LAISSEZ UN COMMENTAIRE SUR LE FREELANCER",
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          initialValue: commentText_,
                          decoration: buildInputDecoration("Commentaire"),
                          onChanged: (t) {
                            commentText_ = t;
                          },
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
                            child: Text("Laisser le commentaire",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(hintText, [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    );

    return InputDecoration(
      suffixIcon: eyeVisible
          ? IconButton(
              icon: Icon(Icons.remove_red_eye, color: Colors.grey),
              onPressed: () {
                setState(() {
                  //set()
                });
              },
            )
          : const SizedBox.shrink(),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  @override
  Future register() async {
    AdCardDataComment data = AdCardDataComment(
        emetteur: USER_ID,
        destinataire: widget.expertInfo.id,
        text: commentText_);
    ExpertsRequest.SendComment(CommentInfo: data).then((value) {
      if (value != false) {
        Navigator.pop(context);
      }
    });
    return null;
  }
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();

  Future register();
}
