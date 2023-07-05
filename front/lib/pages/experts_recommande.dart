import 'package:flutter/material.dart';

// import 'package:front/widgets/navbar_widgets.dart';
// import 'package:front/widgets/card_widgets.dart';
import 'package:front/widgets/profil_widgets.dart';

class ExpertsRecommandPage extends StatefulWidget {
  final data;
  final titre;
  const ExpertsRecommandPage({
    super.key,
    required List this.data,
    String this.titre = "LISTE DES EXPERTS",
  });
  @override
  _ExpertsRecommandPage createState() => _ExpertsRecommandPage();
}

class _ExpertsRecommandPage extends State<ExpertsRecommandPage> {
  @override
  Widget build(BuildContext context) {
    print("widget.data -------");
    print(widget.data);
    print(widget.data.length);
    print("widget.data.length ------");
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
            print("itemBuilder ----------------");
            print("itemBuilder ----------------");
            print(index);
            print("itemBuilder ----------------");
            print("itemBuilder ----------------");
            return Center(
              child: ExpertsCardRecommandeWidget(
                dataObject: widget.data[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
