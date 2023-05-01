import 'package:flutter/material.dart';
import 'package:front/pages/dashboard.dart';

class ConnexionPage extends StatefulWidget {
  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> with RegisterAuth {
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
              Container(
                color: const Color(0xfffcfcfb),
                height: 60.0,
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    text: "Pas encore inscrit? ",
                    children: [
                      TextSpan(
                          text: "Inscription",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ))
                    ],
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              const Divider(height: 1.0),
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
                          Text("Se connecter",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            decoration: buildInputDecoration("Login"),
                            validator: InputValidator.email,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              obscureText: visiblePassword,
                              decoration:
                                  buildInputDecoration("Password", true),
                              validator: InputValidator.password,
                              onChanged: (t) {
                                InputValidator.passwordText = t;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 26.0),
                    //   child: CheckboxListTile(
                    //     onChanged: (a) {
                    //       setState(() {
                    //         rememberMe = !rememberMe;
                    //       });
                    //     },
                    //     value: rememberMe,
                    //     controlAffinity: ListTileControlAffinity.leading,
                    //     title: const Text(
                    //       "Receive our weekly newsletter and other occasional updates",
                    //       style: TextStyle(
                    //         fontSize: 12.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: MediaQuery.of(context).size.width,
                        // color: const Color(0xff449b76),
                        color: Color.fromARGB(255, 3, 196, 9),
                        onPressed: () {
                          //register();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()));
                        },
                        child: Text("Connexion",
                            style: TextStyle(color: Colors.white)),
                        /*child: isLoading
                            ? const SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                ))
                            : const Text("Connexion",
                                style: TextStyle(color: Colors.white)),*/
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
      suffixIcon: eyeVisible
          ? IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: !visiblePassword ? Colors.grey : Colors.red,
              ),
              onPressed: () {
                setState(() {
                  visiblePassword = !visiblePassword;
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
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setState(() {
        isLoading = true;
      });

      if (rememberMe) {
        debugPrint("saved");
      }

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        isLoading = false;
      });
    }

    return null;
  }
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();

  bool rememberMe = false;

  bool visiblePassword = false;

  bool isLoading = false;

  //Future register();
}

class InputValidator {
  static String? confirmPasswordText;

  static String? passwordText;

  static String? emailText;

  static String? name;

  static emptyCheck(String msg) {
    return (t) {
      if (t.isEmpty || t == null) return msg;

      return null;
    };
  }

  static String? email(String? t) {
    if (t!.isEmpty) return "Email can't be empty";

    return null;
  }

  static String? password(String? t) {
    if (t!.isEmpty) return "Password can't be empty";

    if (confirmPasswordText != passwordText) return "Password not matched";

    return null;
  }
}
