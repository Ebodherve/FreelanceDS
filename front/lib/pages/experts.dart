import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';

class ExpertsPage extends StatefulWidget {
  @override
  _ExpertsPage createState() => _ExpertsPage();
}

class _ExpertsPage extends State<ExpertsPage> {
  List<Widget> listExperts = [
    ExpertsCardWidgetSimple(),
    ExpertsCardWidgetSimple(),
    ExpertsCardWidgetSimple(),
    ExpertsCardWidgetSimple(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LISTE DES EXPERTS")),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
            /*child: Center(
            child: Text("Experts"),
          ),*/
            child: Column(
          children: [
            ExpertsCardWidgetSimple(),
            ExpertsCardWidgetSimple(),
            ExpertsCardWidgetSimple(),
            ExpertsCardWidgetSimple(),
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
