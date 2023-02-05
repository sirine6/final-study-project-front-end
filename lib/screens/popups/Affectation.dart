import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:sirin/controllers/PrestationControlleur.dart';
import 'package:sirin/models/Group.dart';

import 'package:sirin/models/accountModel.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../controllers/RoleControlleur.dart';
import '../../models/Role.dart';
import '../../utils/colors.dart';

class Affectation extends StatefulWidget {
  Groups groups;
 



  Affectation({required this.groups,Key? key}) : super(key: key);

  @override
  State<Affectation> createState() => _AffectationState();
}

class _AffectationState extends State<Affectation> {
  ApiRole roleController = ApiRole();
  PrestationControlleur _prestationControlleur = PrestationControlleur();

  ApiGroup _apiGroup = ApiGroup();
  late int idGroupe;
  List<dynamic> tempList = [];
  List<dynamic> userList = [];

  Future<void> initList() async {
    await roleController.getActiveRole().then((value) => {
          value!.forEach((element) {
            setState(() {
              tempList.add(
                {
                  "display": element.nameRoles,
                  "value": element.id,
                },
              );
            });
          })
        });
          await roleController.getallUser().then((value) => {
          value!.forEach((element) {
            setState(() {
              userList.add(
                {
                  "display": element.firstName,
                  "value": element.id,
                },
              );
            });
          })
        });
  }

  List<int> selectedRoles = [];
  List<int> selectedUsers = [];



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
      
      child: Wrap(children: [
        Column(
          children: [
            Container(
                color: primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Affectation',
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
                                borderRadius:BorderRadius.all(Radius.circular(12.0))),
                            title: const Text(
                              "Role",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            dataSource: tempList,
                            textField: 'display',
                            fillColor: buttonColor,
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            onSaved: (value) {
                             

                              value.forEach((element)=>{
                                setState((){
                                  selectedRoles.add((element));
                                })
                              });


                              if (value == null) return;
                            },
                          ),
                        ),
            const SizedBox(
              height: 5,
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
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0))),

                            title: const Text(
                              "Users",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),

                            dataSource: userList,

                            textField: 'display',

                            fillColor: buttonColor,

                            valueField: 'value',

                            okButtonLabel: 'OK',

                            cancelButtonLabel: 'CANCEL',

                            // initialValue: _myActivities,

                            onSaved: (value) {
                              value.forEach((element)=>{
                                setState((){
                                  selectedUsers.add((element));
                                })
                              });

                              if (value == null) return;
                            },
                          ),
                        ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () async {
              List<Map<String,int>> mapSelectedUsers = [];
              List<Map<String,int>> mapSelectedRoles = [];

              selectedRoles.forEach((element) {
                mapSelectedRoles.add({"id":element});                
              });

              selectedUsers.forEach((element) {
                mapSelectedUsers.add({"id":element});
                
              });

              await _prestationControlleur.affectationGroupe(mapSelectedRoles, mapSelectedUsers, widget.groups.id??0).then((value) => {
                setState((){}),
                Navigator.of(context).pop()
              });






              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: buttonColor),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Sauvgarder ",
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
