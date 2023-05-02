import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';

class EnterprisesPage extends StatefulWidget {
  @override
  _EnterprisesPage createState() => _EnterprisesPage();
}

class _EnterprisesPage extends State<EnterprisesPage> {
  List<Widget> listExperts = [
    EnterprisesCardWidgetSimple(),
    EnterprisesCardWidgetSimple(),
    EnterprisesCardWidgetSimple(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LISTE DES ENTREPRISES ")),
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
            EnterprisesCardWidgetSimple(),
            EnterprisesCardWidgetSimple(),
            EnterprisesCardWidgetSimple(),
            EnterprisesCardWidgetSimple(),
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
