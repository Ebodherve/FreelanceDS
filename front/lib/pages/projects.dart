import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
  /*List<Widget> listProjects = [
    ProjectsCardWidgetSimple(),
    ProjectsCardWidgetSimple(),
    ProjectsCardWidgetSimple(),
    ProjectsCardWidgetSimple(),
  ];*/
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
          children: [
            ProjectsCardWidgetSimple(),
            ProjectsCardWidgetSimple(),
            ProjectsCardWidgetSimple(),
            ProjectsCardWidgetSimple(),
            /*
            ListView.builder(
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Container(
                  child: listExperts[index],
                );
              }),
            ),*/
          ],
        )),
      ),
    );
  }
}
