import 'package:flutter/material.dart';

/*
import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/navbar_widgets.dart';
*/
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
        ListTile(onTap: () {}, title: Text("ENTREPRISES")),
        ListTile(onTap: () {}, title: Text("EXPERTS")),
        ListTile(onTap: () {}, title: Text("PROJETS")),
      ]),
    );
  }
}
