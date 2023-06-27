import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/pages/modif_profil.dart';
import 'package:front/pages/modif_profil_entreprise.dart';
import 'package:front/pages/portfolio.dart';
import 'package:front/api_rest/profil_rest.dart';

class ModifProfileWidget extends StatefulWidget {
  ModifProfileWidget({
    super.key,
  });

  @override
  _ModifProfileWidget createState() => _ModifProfileWidget();
}

class _ModifProfileWidget extends State<ModifProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("MODIFIER VOTRE PROFILE"),
            ),
          ),
        ),
        onTap: () {
          ProfilRequest.GetExpertProfil(userid: USER_ID).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ModifProfilPage(
                  expert: value,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class ProjetCreesWidget extends StatefulWidget {
  ProjetCreesWidget({
    super.key,
  });

  @override
  _ProjetCreesWidget createState() => _ProjetCreesWidget();
}

class _ProjetCreesWidget extends State<ProjetCreesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("MODIFIER VOTRE PROFILE"),
            ),
          ),
        ),
        onTap: () {
          ProfilRequest.GetExpertProfil(userid: USER_ID).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModifProfilPage(
                          expert: value,
                        )));
          });
        },
      ),
    );
  }
}

class ProjetPostulerWidget extends StatefulWidget {
  ProjetPostulerWidget({
    super.key,
  });

  @override
  _ProjetPostulerWidget createState() => _ProjetPostulerWidget();
}

class _ProjetPostulerWidget extends State<ProjetPostulerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("Creer un projet"),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class PortfolioWidget extends StatefulWidget {
  PortfolioWidget({
    super.key,
  });

  @override
  _PortfolioWidget createState() => _PortfolioWidget();
}

class _PortfolioWidget extends State<PortfolioWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("PORTFOLIO"),
            ),
          ),
        ),
        onTap: () {
          ProfilRequest.GetExpertProfil(userid: USER_ID).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExpertPortfolioPage(
                          dataObject: value,
                          baseIm: const_base_urlIm,
                        )));
          });
        },
      ),
    );
  }
}

class ProjetsCoursWidget extends StatefulWidget {
  ProjetsCoursWidget({
    super.key,
  });

  @override
  _ProjetsCoursWidget createState() => _ProjetsCoursWidget();
}

class _ProjetsCoursWidget extends State<ProjetsCoursWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("PROJETS EN COUR"),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class ProfileEntrepriseWidget extends StatefulWidget {
  ProfileEntrepriseWidget({
    super.key,
  });

  @override
  _ProfileEntrepriseWidget createState() => _ProfileEntrepriseWidget();
}

class _ProfileEntrepriseWidget extends State<ProfileEntrepriseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("DASHBOARD ENTREPRISE"),
            ),
          ),
        ),
        onTap: () {
          ProfilRequest.GetEntrepriseProfil(userid: USER_ID).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModifProfilEPage(
                          entreprise: value,
                        )));
          });
        },
      ),
    );
  }
}
