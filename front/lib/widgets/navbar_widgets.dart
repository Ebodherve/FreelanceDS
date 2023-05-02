import 'package:flutter/material.dart';

/*
import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/navbar_widgets.dart';
*/
import 'package:front/pages/experts.dart';
import 'package:front/pages/projects.dart';
import 'package:front/pages/enterprises.dart';
import 'package:front/widgets/navbar_widgets.dart';

class DrawerNavWidget extends StatefulWidget {
  @override
  _DrawerNavWidget createState() => _DrawerNavWidget();
}

class _DrawerNavWidget extends State<DrawerNavWidget> {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExpertsPage()));
            },
            title: Text("EXPERTS")),
        ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProjectsPage()));
            },
            title: Text("PROJETS")),
      ]),
    );
  }
}
