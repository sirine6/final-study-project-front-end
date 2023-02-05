import 'dart:convert';
import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/controllers/globalController.dart';
import 'package:sirin/models/accountModel.dart';
import 'package:sirin/screens/administration.dart';
import 'package:sirin/screens/popups/Ajouter.dart';

import 'package:sirin/screens/popups/addWorkerDialog.dart';

import '../Component/AppBar.dart';
import '../utils/colors.dart';
import '../widgets/detailsBox.dart';

class Compte extends StatefulWidget {
  Compte({Key? key}) : super(key: key);

  @override
  State<Compte> createState() => _CompteState();
}


class _CompteState extends State<Compte> {
 GlobalController globalController = GlobalController();

      final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey,() {
          setState(() {});
        }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buttonColor,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                ),
              ),
            ),
      
            Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          
                        });
                      },
                      child: Text(
                        "Gestion de  compte",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          
                            context: context,
                            builder: (context) {
                              return AddWorkerDialog();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: buttonColor),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text("Ajouter"),
                                Icon(Icons.add_circle),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
      
            Expanded(
              child: FutureBuilder<List<Account>?>(
                future:globalController.getAllAccounts(),
                builder: (context, snapshot) {
                  return
                  !snapshot.hasData?
                  Center(child: Text("Loading..."),):
                  
                  
                   ListView.builder(
                      itemCount: snapshot.data![0].pagedItems!.length,
                    
                      itemBuilder: (_, index) {
                        log("+++ $index");
                         GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlipCard(
                            flipOnTouch: false,
                            key: cardKey,
                            fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            front: DetailsBoxFront(
                              name:snapshot.data![0].pagedItems![index].nameUser??"",job:snapshot.data![0].pagedItems![index].companies!.function??"",
                              imageCode:  base64Decode(snapshot.data![0].pagedItems![index].picture??"",),
                              isEnabled: snapshot.data![0].pagedItems![index].enabled??true,
                              onClick: (){
                                cardKey.currentState!.toggleCard();
                              },
                              user: snapshot.data![0].pagedItems![index],
                            ),
                              back: DetailsBoxBack(
                                name: snapshot.data![0].pagedItems![index].nameUser??"",
                                job: snapshot.data![0].pagedItems![index].companies!.function??"",
                                phone: snapshot.data![0].pagedItems![index].phone??"",
                                age: snapshot.data![0].pagedItems![index].age.toString(),
                                email: snapshot.data![0].pagedItems![index].email??"",
                                  imageCode:  base64Decode(snapshot.data![0].pagedItems![index].picture??""),
      
      
      
      
                                onClick :(){
                                  cardKey.currentState!.toggleCard();
                                }
              
                              )
                      ),
                          ),
                        );
                      });
                }
              ),
            )
      
            //  Container(color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
