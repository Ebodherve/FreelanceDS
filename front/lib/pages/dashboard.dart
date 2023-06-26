import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/modif_profil.dart';
import 'package:front/widgets/dashboard_widgets.dart';

import 'package:front/widgets/navbar_widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Stack(alignment: Alignment.center, children: [
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.notifications,
                size: 40,
              ),
            ),
            Text(
              '0',
              style: TextStyle(fontSize: 15),
            )
          ]),
        ),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              ProfileEntrepriseWidget(),
              ProjetsCoursWidget(),
              PortfolioWidget(),
              ModifProfileWidget(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Icon(Icons.arrow_back),
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
      ),
      drawer: DrawerNavWidget(),
    );
  }
}
