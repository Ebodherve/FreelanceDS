import 'package:flutter/material.dart';
import 'package:front/constants.dart';
//import 'package:front/utils/utils_fonctions.dart';
import 'package:front/widgets/card_widgets.dart';
import 'package:front/pages/portfolio.dart';

class ExpertsCardWidget extends StatefulWidget {
  ExpertsCardWidget({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false,
  }) : super(key: key);

  AdCardDataExpert dataObject;
  // Search? searchObject;
  // bool viewed;

  @override
  _ExpertsCardWidget createState() => _ExpertsCardWidget();
}

class _ExpertsCardWidget extends State<ExpertsCardWidget> {
  @override
  Widget build(BuildContext context) {
    print("widget.dataObject.competences.length  ----");
    print(widget.dataObject.competences.length);
    print(widget.dataObject.competences);
    print("widget.dataObject.competences.length  ----");

    return GestureDetector(
      child: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: SizedBox(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                  child: widget.dataObject.image != "" &&
                          widget.dataObject.image != ""
                      ? Image.network(
                          "${widget.dataObject.image}",
                          scale: 1.0,
                        )
                      : Image.asset("assets/images/default_profile.png"),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Column(
                          children: List.generate(
                              widget.dataObject.competences.length, (index) {
                            return Padding(
                              padding: EdgeInsets.all(2),
                              child: Chip(
                                label: Text(
                                  CompetentcesMAP[
                                      widget.dataObject.competences[index]],
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.pink),
                                ),
                              ),
                            );
                          }).toList().cast<Widget>(),
                        ),
                        Text(
                          "${widget.dataObject.prix_par_heure}" + "\$/heure",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ExpertPortfolioPage(dataObject: widget.dataObject),
          ),
        );
      },
    );
  }
}

class ExpertsCardRecommandeWidget extends StatefulWidget {
  ExpertsCardRecommandeWidget({
    Key? key,
    required this.dataObject,
    //this.searchObject,
    //this.viewed = false
  }) : super(key: key);

  AdCardDataExpert dataObject;
  // Search? searchObject;
  // bool viewed;

  @override
  _ExpertsCardRecommandeWidget createState() => _ExpertsCardRecommandeWidget();
}

class _ExpertsCardRecommandeWidget extends State<ExpertsCardRecommandeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: SizedBox(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                  child: widget.dataObject.image != "" &&
                          widget.dataObject.image != ""
                      ? Image.network(
                          const_base_urlIm + "${widget.dataObject.image}",
                          scale: 1.0,
                        )
                      : Image.asset("assets/images/default_profile.png"),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                size: 15.0,
                                color: index >= widget.dataObject.nb_etoiles
                                    ? Colors.grey
                                    : Colors.orange,
                              );
                            },
                          ).toList().cast<Widget>(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.dataObject.description),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: List.generate(
                              widget.dataObject.competences.length, (index) {
                            return Padding(
                              padding: EdgeInsets.all(2),
                              child: Chip(
                                label: Text(
                                  CompetentcesMAP[
                                      widget.dataObject.competences[index]],
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.pink),
                                ),
                              ),
                            );
                          }).toList().cast<Widget>(),
                        ),
                        Text(
                          "${widget.dataObject.prix_par_heure}" + "\$/heure",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ]),
                ),
                //Padding(padding:EdgeInsets.all(30), child:,),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        AdCardDataExpert expertClick = AdCardDataExpert(
          id: widget.dataObject.id,
          titre: widget.dataObject.titre,
          image: const_base_urlIm + widget.dataObject.image,
          description: widget.dataObject.description,
          prix_par_heure: widget.dataObject.prix_par_heure,
          nb_etoiles: widget.dataObject.nb_etoiles,
          competences: widget.dataObject.competences,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpertPortfolioPage(
              dataObject: expertClick,
            ),
          ),
        );
      },
    );
  }
}
