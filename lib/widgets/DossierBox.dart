import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/utils/colors.dart';
import 'package:sirin/widgets/detailsDossier.dart';

import '../controllers/DossierCompetenceControlleur.dart';
import '../models/DossierCompetence.dart';
import '../screens/popups/ModifierDossier.dart';

class DossierBox extends StatefulWidget {
  String nameuser;
  DossierCompetenceModel dossierCompetenceModel;

  String titleButton;
  String email;
  Color textColor;
  DossierBox(
      {
        required  this.dossierCompetenceModel,
        required this.nameuser,
      required this.email,
      required this.titleButton,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  State<DossierBox> createState() => _DossierBoxState();
}

class _DossierBoxState extends State<DossierBox> {
  DossierController _dossierController=DossierController();
    int? idDossier;
  @override
  void initState() {
    super.initState();

    idDossier = widget.dossierCompetenceModel.id??0;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        //  padding: const EdgeInsets.only(top: 100, bottom: 100,right: 50,left: 100),
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: size.width * .55,
              height: size.width * .7,
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IconButton(
                              onPressed: null,
                              icon: FaIcon(
                                null,
                                color: Colors.white,
                              )),
      
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsDossier(dossier: widget.dossierCompetenceModel,)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor.withOpacity(0.7),
                                  border: Border.all(
                                      color: buttonColor.withOpacity(0.7)),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  "Details",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          //  Spacer(),
      
                          PopupMenuButton(
                          
                            icon: const FaIcon(
                              FontAwesomeIcons.ellipsisVertical,
                              color: Colors.white,
                            ),
                            onSelected: (value) {
                              print(value);
                              // your logic
                            },
                            itemBuilder: (BuildContext bc) {
                              return [
                                PopupMenuItem(
                                  onTap: (){},
                                   
                                    child: InkWell(
                                      onTap: (){
                                        // log("${widget.dossierCompetenceModel.ecole!.length}");
                                         showDialog(context: context, builder: (_){
                                        return ModifierdossierDialog(
                                                  dossier: widget.dossierCompetenceModel,
                                                );
                                      });
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.edit_outlined),
                                          const SizedBox(width: 8),
                                          const Text("modifier"),
                                        ],
                                      ),
                                    )),
                                PopupMenuItem(
                                  child: InkWell(
                                    onTap: (() async {
                                  await _dossierController.supprimerDossier(widget.dossierCompetenceModel.id??0)
                                      .then((value) => {
                                            setState(() {}),
                                            Navigator.of(context).pop(),
                                          });
                                }),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete_outline),
                                        const SizedBox(width: 8),
                                        const Text("Supprimer")
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.nameuser,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  widget.email,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: subColor.withOpacity(0.4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          widget.titleButton,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: widget.textColor),
                                        )),
                                      ),
                                    ),
                                  ),
                                )),
                              ]),
                        ),
                      ),
                    )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
