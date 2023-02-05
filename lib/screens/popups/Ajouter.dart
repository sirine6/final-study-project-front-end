import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../controllers/PrestationControlleur.dart';
import '../../controllers/globalController.dart';
import '../../models/accountModel.dart';
import '../../models/userModel.dart';
import '../../utils/colors.dart';
import '../../widgets/textFieldForWorker.dart';
import '../home.dart';

class Ajouter extends StatefulWidget {
//PagedItems user;
  Ajouter({Key? key}) : super(key: key);

  @override
  State<Ajouter> createState() => _AjouterState();
}

class _AjouterState extends State<Ajouter> {
  TextEditingController _TitreController = TextEditingController();

  TextEditingController _DescriptionController = TextEditingController();

  TextEditingController _LienController = TextEditingController();

  TextEditingController _datedebutController = TextEditingController();

  TextEditingController _dateFinController = TextEditingController();
  PrestationControlleur prestationcontrolleur=PrestationControlleur();
 /* late int idUser;
   @override
void initState() {
  super.initState();

  idUser = widget.userModel.id??0;
   

}*/

  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: buttonColor,
                            border: Border.all(color: buttonColor),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Nouvelle offre',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: TextFormField(
                          controller: _TitreController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Titre'),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: TextFormField(
                          controller: _DescriptionController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Description'),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: TextFormField(
                          controller: _LienController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Lien'),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: TextFormField(
                            controller: _datedebutController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.calendar_today),
                                hintText: 'Date Debut'),
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101)
                                  );
                             
                            
                               if(pickeddate != null ){
                               print(pickeddate);  
                               String formattedDate = DateFormat('yyyy-MM-dd').format(pickeddate); 
                               print(formattedDate); 
                     

                               setState(() {
                               _datedebutController.text = formattedDate; 
                                 });
                                }
                                },)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: TextFormField(
                          controller: _dateFinController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.calendar_today),
                              hintText: 'Date Fin'),
                                onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101)
                                  );
                             
                            
                               if(pickeddate != null ){
                               print(pickeddate);  
                               String formattedDate = DateFormat('yyyy-MM-dd').format(pickeddate); 
                               print(formattedDate); 
                     

                               setState(() {
                               _dateFinController.text = formattedDate; 
                                 });
                                }else{
                               print("Date is not selected");
                              }
                                },
                
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () async{
                              await prestationcontrolleur.ajouterPrestation(_TitreController.text,
                               _DescriptionController.text,
                                _LienController.text,
                                 _datedebutController.text,
                                  _dateFinController.text,
                                   ).then((value) => {
                                              Navigator.of(context)
                                                              .pop(),
                                                          setState((){}),
                                                           });
                                                           // widget.user.id??0
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  border: Border.all(color: buttonColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                    child: Text(
                                  "Ajouter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  border: Border.all(color: buttonColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                    child: Text(
                                  "Annuler",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
