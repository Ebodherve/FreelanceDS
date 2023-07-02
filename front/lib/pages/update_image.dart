import 'package:flutter/material.dart';
import 'package:front/api_rest/profil_rest.dart';
import 'package:front/constants.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateImagePage extends StatefulWidget {
  //final expert;
  UpdateImagePage({
    super.key,
    this.data,
    String this.type_im = "expert",
    String this.defaultIm = "",
  });

  final data;
  String type_im;
  String defaultIm;

  @override
  _UpdateImagePage createState() => _UpdateImagePage();
}

class _UpdateImagePage extends State<UpdateImagePage> with RegisterAuth {
  var _image = null;

  Future getImage(imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Choisissez une image "),
        ),
      ),
      body: Center(
        child: Column(children: [
          _image != null
              ? Image.file(_image, width: 250, height: 250, fit: BoxFit.cover)
              : (widget.defaultIm == ""
                  ? Image.asset("assets/images/default_profile.png")
                  : Image.network(
                      widget.defaultIm,
                      width: 250,
                      height: 250,
                    )),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomButton(
                title: "Choisir à partir de la Gallery",
                icon: Icon(Icons.image_outlined),
                onClick: () {
                  getImage(ImageSource.gallery);
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomButton(
                title: "Choisir à partir de la Camera",
                icon: Icon(Icons.image_outlined),
                onClick: () {
                  getImage(ImageSource.camera);
                }),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: MaterialButton(
              child: Text("Update"),
              onPressed: () {
                register();
              },
            ),
          ),
        ]),
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
    //if (rememberMe) {
    if (true) {
      if (_image != null) {
        if (widget.type_im == "expert") {
          print("Expert Image .....");
          ProfilRequest.UpdateExpertImProfil(
              file: _image, profileid: USER_PROFILE_ID);
          if (My_competentcesid != []) {
            ProfilRequest.UpdateCompProfil(
                competences: My_competentcesid, profileid: USER_PROFILE_ID);
          } else {
            if (widget.data != null) {
              ProfilRequest.UpdateCompProfil(
                  competences: widget.data.competences,
                  profileid: USER_PROFILE_ID);
            }
          }
        } else if (widget.type_im == "entreprise") {
          print("Profile Entreprise --------");
          print("Profile Entreprise --------");
          print("Profile Entreprise --------");
          ProfilRequest.UpdateEntrepriseImProfil(
              file: _image, profileid: USER_PROFILE_ENTREPRISE_ID);
        }
      }
    }

    //setState(() {});

    return null;
  }
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();

  bool rememberMe = false;

  Future register();
}

Widget CustomButton({
  String title = "",
  Icon icon = const Icon(Icons.image_outlined),
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(children: [
        icon,
        SizedBox(
          width: 20,
        ),
        Text(title),
      ]),
    ),
  );
}
