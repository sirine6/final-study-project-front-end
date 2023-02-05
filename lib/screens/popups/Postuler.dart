import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:sirin/controllers/DossierCompetenceControlleur.dart';
import 'package:sirin/models/Group.dart';
import 'package:sirin/models/accountModel.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../models/DossierCompetence.dart';
import '../../utils/colors.dart';

class Postuler extends StatefulWidget {


  Postuler({ Key? key}) : super(key: key);

  @override
  State<Postuler> createState() => _PostulerState();
}

class _PostulerState extends State<Postuler> {
  DossierController dossier = DossierController();
  List<dynamic> dossierList = [];
  Future<void> initList() async {
    await dossier.getdossierAll().then((value) => {
          value!.forEach((element) {
            setState(() {
              dossierList.add(
                {
                  "display": element.mail,
                  "value": element.mail,
                },
              );
            });
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      width: 50,
      height: 200,
      child: Wrap(
        children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Postuler',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MultiSelectFormField(
                            autovalidate: AutovalidateMode.disabled,
                            chipBackGroundColor: bord,
                            chipLabelStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            dialogTextStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            checkBoxActiveColor: Colors.white,
                            checkBoxCheckColor: Colors.black,
                            dialogShapeBorder: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            title: const Text(
                              "Competence File",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            dataSource: dossierList,
                            textField: 'display',
                            fillColor: buttonColor,
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            onSaved: (value) {
                              log("*-*-*-*-" + value);

                              if (value == null) return;
                            },
                          ),
                        ),
                      
           
            InkWell(
              onTap: () async {},
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: buttonColor),
                  child: const Padding( 
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Sauvgarder",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )),
            ),
          ],
        )
      ]),
    ));
  }
}
