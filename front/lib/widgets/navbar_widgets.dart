import 'package:flutter/material.dart';

import 'package:front/pages/experts.dart';
import 'package:front/pages/projects.dart';
import 'package:front/pages/enterprises.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/api_rest/projects_rest.dart';
import 'package:front/api_rest/experts_rest.dart';

class DrawerNavWidget extends StatefulWidget {
  @override
  _DrawerNavWidget createState() => _DrawerNavWidget();
}

class _DrawerNavWidget extends State<DrawerNavWidget> {
  List<dynamic> listProjects = [];
  List<dynamic> listExperts = [];

  @override
  getProjectsFromApi() {
    listProjects.clear();
    setState(() {
      ProjectsRequest.GetAllProjects().then((value) {
        listProjects = value;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectsPage(
                      data: listProjects,
                    )));
      });
    });
  }

  @override
  getExpertsFromApi() {
    listExperts.clear();

    setState(() {
      ExpertsRequest.GetAllExperts().then((value) {
        listExperts = value;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExpertsPage(
                      data: listExperts,
                    )));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Text("Entete"),
          decoration: BoxDecoration(color: Color.fromARGB(255, 3, 196, 9)),
        ),
        ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EnterprisesPage()));
            },
            title: Text("ENTREPRISES")),
        ListTile(
            onTap: () {
              getExpertsFromApi();
            },
            title: Text("EXPERTS")),
        ListTile(
            onTap: () {
              getProjectsFromApi();
            },
            title: Text("PROJETS")),
      ]),
    );
  }
}
