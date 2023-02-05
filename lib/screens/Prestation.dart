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
import 'Acceuil.dart';

class Prestation extends StatefulWidget {
  Prestation({Key? key}) : super(key: key);

  @override
  State<Prestation> createState() => _PrestationState();
}

class _PrestationState extends State<Prestation> {
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
                      "Demande de prestation",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Ajouter();
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
                                const Text("Ajouter"),
                                const Icon(Icons.add_circle),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "chercher une prestation",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: buttonColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>?>(
              future: prestation.getprestationAll(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SizedBox(
                      child: Text("Loading"),
                    )
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // log("*** ${snapshot.data![index]['picture']}");
                          return Column(
                            children: [
                              PrestationBox(
                                name: snapshot.data![index]['user']['name_user'] ??
                                    "",
                                title: snapshot.data![index]['title'] ?? "",
                                date:
                                    snapshot.data![index]['dateCreation'] ?? "",
                                image: base64Decode(
                                    snapshot.data![index]['user']['picture']??
                                        ""),
                              )
                            ],
                          );
                        },
                      );
              },
            ),
          ),

/*child: PrestationBox(
                    title: snapshot.data![index].title??"",
                    date: snapshot.data![index].dateCreation??"",
                                   ),*/
        ],
      ),
    );
  }
}
