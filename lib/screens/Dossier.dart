// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/models/DossierCompetence.dart';
import 'package:sirin/screens/Acceuil.dart';
import 'package:sirin/screens/popups/DossierComp%C3%A9tencecc.dart';

import '../Component/AppBar.dart';
import '../controllers/DossierCompetenceControlleur.dart';
import '../utils/colors.dart';
import '../widgets/DossierBox.dart';
import '../widgets/detailsBox.dart';

class Dossier extends StatefulWidget {
 const  Dossier({Key? key}) : super(key: key);
  

  @override
  State<Dossier> createState() => _DossierState();
}

class _DossierState extends State<Dossier> {
   DossierController dossierController=DossierController();
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(_scaffoldKey, null),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buttonColor,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Acceuil()));
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
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
                      Text(
                        "Les dossier de compétence",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: (() {
                          showDialog(
                        
                          context: context,
                          builder: (context) {
                            return AdddossierDialog();
                          });
                        }),
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
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<DossierCompetenceModel>?>(
                future: dossierController.getdossierAll(),
                builder: (context,snapshot){
                  return !snapshot.hasData
                  ? Center(child: Text("No Data"),)
                  :ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // return Text("${snapshot.data![index].ecole![1].name}");
                    
                        return Center(
                        child: DossierBox(
                          
                          nameuser: snapshot.data![index].name??"",
                          email: snapshot.data![index].mail?? "",
                          titleButton: 'Accépte',
                          textColor: Colors.green,
                          dossierCompetenceModel: snapshot.data![index],
                        ),
                                        );
                    
                          
                      
                    },
                    
                    
                    );
                }
                
              
              ),
            )
          ],
        ));
  }
}
