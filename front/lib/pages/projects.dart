import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/api_rest/projects_rest.dart';

class ProjectsPage extends StatefulWidget {
  final data;
  const ProjectsPage({
    super.key,
    required List this.data,
  });

  @override
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: ((context, index) {
              return Container(
                child: ProjectsCardWidget(dataObject: widget.data[index]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
