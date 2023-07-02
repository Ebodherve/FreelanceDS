import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/widgets/profil_widgets.dart';

class ExpertsPage extends StatefulWidget {
  final data;
  final titre;
  const ExpertsPage({
    super.key,
    required List this.data,
    String this.titre = "LISTE DES EXPERTS",
  });

  @override
  _ExpertsPage createState() => _ExpertsPage();
}

class _ExpertsPage extends State<ExpertsPage> {
  @override
  Widget build(BuildContext context) {
    print("widget.data.length --------");
    print("widget.data.length --------");
    print(widget.data.length);
    print(widget.data);
    print(widget.data.length);
    print("widget.data.length --------");
    print("widget.data.length --------");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.titre)),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: ((context, index) {
            return Container(
              child: ExpertsCardWidget(dataObject: widget.data[index]),
            );
          }),
        ),
      ),
    );
  }
}
