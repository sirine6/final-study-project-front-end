import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../controllers/DossierCompetenceControlleur.dart';
import '../../controllers/globalController.dart';
import '../../utils/colors.dart';
import '../../widgets/textFieldForWorker.dart';
import '../home.dart';

class AdddossierDialog extends StatefulWidget {
  AdddossierDialog({Key? key}) : super(key: key);

  @override
  State<AdddossierDialog> createState() => _AdddossierDialogState();
}

class _AdddossierDialogState extends State<AdddossierDialog> {
  DossierController _controller = DossierController();
 
 TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  TextEditingController _EmailController = TextEditingController();

  TextEditingController _telephoneController = TextEditingController();

  TextEditingController _postesController = TextEditingController();

  TextEditingController _EcoleController = TextEditingController();

  TextEditingController _languagesController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();

  TextEditingController _competenceController = TextEditingController();
  GlobalController _globalController = GlobalController();
  XFile? selectedImage;
  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                              'Création de dossier de competence',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,fontSize: 20),
                            ),
                          ),
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
                          controller: _descriptionController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'name',
                                 icon:FaIcon(FontAwesomeIcons.solidCircleUser)
                               ),
                                  
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
                          controller: _EmailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'Email Adresse',
                                 icon:FaIcon(FontAwesomeIcons.message)
                               ),
                                  
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
                          controller: _telephoneController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'N° Telephone',
                                 icon:FaIcon(FontAwesomeIcons.phone)
                               ),
                                  
                        )),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(3)),
                    child: TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Date '),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickeddate != null) {
                          print(pickeddate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                          print(formattedDate);

                          setState(() {
                            _dateController.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
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
                          controller: _postesController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'Postes',
                                 icon:FaIcon(FontAwesomeIcons.briefcase)
                               ),
                                  
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
                          controller: _competenceController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'competences',
                                 icon:FaIcon(FontAwesomeIcons.plusSquare)
                               ),
                                  
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
                          controller: _experienceController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'Experience',
                                 icon:FaIcon(FontAwesomeIcons.pencil)
                               ),
                                  
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
                          controller: _EcoleController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'Ecole',
                                 icon:FaIcon(FontAwesomeIcons.graduationCap)
                               ),
                                  
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
                          controller: _languagesController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                               hintText: 'Languages',
                                 icon:FaIcon(FontAwesomeIcons.language)
                               ),
                                  
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
                          child: Container(
                            decoration: BoxDecoration(
                                color: buttonColor,
                                border: Border.all(color: buttonColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () async {

                                    List<String> tempPosts = _postesController.text.split(',');
                                List<String> tempEcole = _EcoleController.text.split(',');
                                List<String> tempLang = _languagesController.text.split(',');
                                List<String> tempExperience = _experienceController.text.split(',');
                                List<String> tempCompetance = _competenceController.text.split(',');
                                // tempPosts.forEach((element) {
                                //   log("${element}  + ");
                                // });
                              print("clicked");




                                  await _controller
                                      .addDossier(
                                          _descriptionController.text,
                                          _EmailController.text,
                                          _telephoneController.text,
                                          _dateController.text,
                                          tempPosts,
                                          tempCompetance,
                                        tempExperience,
                                          tempLang,
                                          tempEcole)
                                      .then((value) => {
                                            Navigator.of(context).pop(),
                                            setState(() {}),
                                          });
                                },
                                child: Center(
                                    child: Text(
                                  "Save",
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
