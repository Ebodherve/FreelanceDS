import 'package:flutter/material.dart';
import 'package:front/constants.dart';
import 'package:front/pages/commentPage.dart';
import 'package:front/api_rest/experts_rest.dart';
import 'package:front/widgets/card_widgets.dart';

class ExpertPortfolioPage extends StatefulWidget {
  ExpertPortfolioPage({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false
    this.baseIm = "",
  }) : super(key: key);

  AdCardDataExpert dataObject;
  String baseIm;
  // Search? searchObject;
  // bool viewed;

  @override
  _ExpertPortfolioPage createState() => _ExpertPortfolioPage();
}

class _ExpertPortfolioPage extends State<ExpertPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.dataObject.competences);
    ExpertsRequest.GetComment(destinataire: 1).then((value) {
      print(value);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 196, 9),
        title: Center(
          child: Text(
            "PORTEFOLIO",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Placeholder(
              fallbackHeight: MediaQuery.of(context).size.height * 0.2,
              child: widget.dataObject.image != null &&
                      widget.dataObject.image != ""
                  ? Image.network(widget.baseIm + "${widget.dataObject.image}")
                  : Image.asset("assets/images/default_profile.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.dataObject.titre,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 15.0,
                color: index >= widget.dataObject.nb_etoiles
                    ? Colors.grey
                    : Colors.orange,
              ),
            ).toList().cast<Widget>(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.dataObject.description),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(
                children: List.generate(
                  widget.dataObject.competences.length,
                  (index) => Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      CompetentcesMAP[widget.dataObject.competences[index]],
                      style: TextStyle(fontSize: 25, color: Colors.pink),
                    ),
                  ),
                ).toList().cast<Widget>(),
              ),
              Text(
                "${widget.dataObject.prix_par_heure}" + "\$/heure",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Colors.blueGrey,
                  child: Text("Engagez"),
                  onPressed: () {
                    print("Engager");
                  }),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CommentPage(expertInfo: widget.dataObject),
                    ),
                  );
                },
                icon: Icon(Icons.comment),
              ),
            ],
          ),
          /*Padding(
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: [

              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
