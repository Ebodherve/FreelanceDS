import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:front/widgets/navbar_widgets.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 0.0,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.notifications,
                    size: 50,
                  ),
                ),
                Text(
                  '0',
                  style: TextStyle(fontSize: 30),
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
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text("PROJETS EN COUR"),
                      ),
                    ),
                  ),
                  onTap: () {
                    print("PROJETS EN COUR");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text("PORTFOLIO"),
                      ),
                    ),
                  ),
                  onTap: () {
                    print("PORTFOLIO");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text("MODIFIER VOTRE PROFILE"),
                      ),
                    ),
                  ),
                  onTap: () {
                    print("PROFILE");
                  },
                ),
              ),
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
