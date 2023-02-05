import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/Component/listview.dart';
import 'package:sirin/screens/Pestattt.dart';
import 'package:sirin/screens/popups/Ajouter.dart';

import 'package:sirin/screens/popups/addWorkerDialog.dart';
import 'package:sirin/utils/colors.dart';

import '../Component/AppBar.dart';
import '../controllers/DossierCompetenceControlleur.dart';
import '../controllers/PrestationControlleur.dart';

import '../models/PrestationModel.dart';
import '../widgets/MesPresBox.dart';
import 'Acceuil.dart';

class MesPostules extends StatefulWidget {
  MesPostules({Key? key}) : super(key: key);

  @override
  State<MesPostules> createState() => _MesPostulesState();
}

class _MesPostulesState extends State<MesPostules> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PrestationControlleur prestation = PrestationControlleur();
  DossierController dossier = DossierController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  /* prestation.getprestationAll().then((value) => {
      log("length is ${value!.length}"),
    });*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey, null),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
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
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Postules",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                 
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>?>(
              future: prestation.getMesPostules(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SizedBox(
                      child: Text("Loading"),
                    )
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              MesPrestBox(
                                name: snapshot.data![index]['nameUser'] ??
                                    "",
                                title: snapshot.data![index]['title'] ?? "",
                                date:
                                    snapshot.data![index]['dateCreation'] ?? "",
                                image: base64Decode(
                                    snapshot.data![index]['picture']??
                                        ""),
                              )
                            ],
                          );
                        },
                      );
              },
            ),
          ),


        ],
      ),
    );
  }
}
