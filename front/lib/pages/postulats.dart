import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/widgets/profil_widgets.dart';

class PostulatsPage extends StatefulWidget {
  final data;
  const PostulatsPage({
    super.key,
    required List this.data,
  });
  @override
  _PostulatsPage createState() => _PostulatsPage();
}

class _PostulatsPage extends State<PostulatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("DIFFERENTS POSTULATS")),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: ((context, index) {
            return Container(
              child: PostulatCardWidget(dataObject: widget.data[index]),
            );
          }),
        ),
      ),
    );
  }
}
