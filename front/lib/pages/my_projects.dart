import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/api_rest/projects_rest.dart';

class ProjectsModifPage extends StatefulWidget {
  final data;
  const ProjectsModifPage({
    super.key,
    required List this.data,
  });

  @override
  _ProjectsModifPage createState() => _ProjectsModifPage();
}

class _ProjectsModifPage extends State<ProjectsModifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "MES PROJETS",
          style: TextStyle(
            fontSize: 18,
          ),
        )),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: ((context, index) {
              print(widget.data[index].id);
              return Container(
                child: ProjectsCardModifWidget(dataObject: widget.data[index]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
