import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sirin/controllers/RoleControlleur.dart';

import '../Component/AppBar.dart';
import '../controllers/DossierCompetenceControlleur.dart';
import '../models/DossierCompetence.dart';
import '../models/Role.dart';
import '../utils/colors.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class DetailsDossier extends StatefulWidget {
  final DossierCompetenceModel dossier;

  DetailsDossier({required this.dossier, Key? key}) : super(key: key);

  @override
  State<DetailsDossier> createState() => _DetailsDossierState();
}

class _DetailsDossierState extends State<DetailsDossier> {
  ApiRole roleController = ApiRole();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
DossierController dossiercontrolleur=DossierController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey, null),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10),
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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Les dossier de compétence",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: buttonColor),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: const [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.dossier.name}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text("${widget.dossier.mail}"),
                    Text("${widget.dossier.phone}"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Numéro ${widget.dossier.id}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    LimitedBox(
                        maxWidth: 150,
                        child: AutoSizeText("Crée le ${widget.dossier.date}")),
                  ],
                )
              ],
            ),
          ),
          ExpansionTile(title: const Text('Post'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dossier.poste!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.dossier.poste![index].name}");
                },
              ),
            ),
          ]),
          ExpansionTile(title: const Text('Ecole'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dossier.ecole!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.dossier.ecole![index].name}");
                },
              ),
            ),
          ]),
          ExpansionTile(title: const Text('Experience'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dossier.experiences!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.dossier.experiences![index].title}");
                },
              ),
            ),
          ]),
          ExpansionTile(title: const Text('Language'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dossier.languages!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.dossier.languages![index].langName}");
                },
              ),
            ),
          ]),
          ExpansionTile(title: const Text('Skills'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dossier.skills!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.dossier.skills![index].name}");
                },
              ),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
                  InkWell(
                    onTap: () async{
                    await dossiercontrolleur.Acceptcv(1060, 1061);
                    },
                    child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: buttonColor),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Accepter",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                  ),
                  SizedBox(width: 15,),
              InkWell(
                onTap: () async {
                  await dossiercontrolleur.Reffusercv(1060, 1061);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: buttonColor),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Refuser",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
              ),
          ],
        ),
      ),
    )
        ]),
      ),
    );
  }
}
