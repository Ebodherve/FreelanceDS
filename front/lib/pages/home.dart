import 'package:flutter/material.dart';

import 'package:front/pages/connexion.dart';
import 'package:front/pages/inscription.dart';
import 'package:front/api_rest/load_data_rest.dart';

class FreelanceApp extends StatelessWidget {
  const FreelanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Chargement des competences disponibles
    LoadDataSiteRequest.LoadCompetences();

    return MaterialApp(
      title: 'Freelance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
        title: Text("Home page"),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  /*child: CircleAvatar(
                  backgroundImage: AssetImage("images/im1.jpg"),
                  radius: 200,
                )*/
                  child: Container(child: Image.asset("assets/images/i2.png")),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      "Bienvenue sur notre application de free-lance dédiée à la mise en relation de professionnels indépendants et de clients à travers le monde. Vous cherchez à trouver des missions enrichissantes et variées dans votre domaine d'expertise, à travailler en toute liberté et à fixer vos propres tarifs ? Ou peut-être cherchez-vous un expert compétent pour réaliser un projet spécifique pour votre entreprise ? Avec notre application, vous pouvez accéder à un large réseau de talents et de projets, gérer facilement vos missions et vos paiements, et construire une carrière passionnante et rentable. Rejoignez-nous aujourd'hui et découvrez les nombreuses opportunités qui vous attendent en tant que free-lance !"),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*GestureDetector(
                    child: Container(
                      width: 100,
                      height: 35,
                      child: Center(child: Text("Connexion")),
                      color: Color.fromARGB(255, 99, 247, 104),
                    ),
                    onTap: () {},
                  ),*/
                  MenuItemButton(
                    child: Text("Connexion"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnexionPage()));
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  MenuItemButton(
                    child: Text("Inscription"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InscriptionionPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
