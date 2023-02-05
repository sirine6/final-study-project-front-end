import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sirin/models/DossierCompetence.dart';

import '../../controllers/DossierCompetenceControlleur.dart';
import '../../controllers/globalController.dart';
import '../../utils/colors.dart';
import '../../widgets/textFieldForWorker.dart';
import '../home.dart';

class ModifierdossierDialog extends StatefulWidget {
  DossierCompetenceModel dossier;
  ModifierdossierDialog({required this.dossier,Key? key}) : super(key: key);

  @override
  State<ModifierdossierDialog> createState() => _ModifierdossierDialogState();
}

class _ModifierdossierDialogState extends State<ModifierdossierDialog> {
  DossierController _controller = DossierController();

 late  TextEditingController  _descriptionController ;
  late TextEditingController _dateController ;

  late TextEditingController _EmailController ;

  late TextEditingController _telephoneController; 

  late TextEditingController _postesController ;

  late TextEditingController _EcoleController ;

  late TextEditingController _languagesController ;
  late TextEditingController _experienceController ;

 late  TextEditingController _competenceController ;
 late int idDossier;



    String posts = "";
    String ecole = "";
    String langue = "";
    String experience = "";
    String competence = "";

    void initVariables(){

      widget.dossier.poste!.forEach((element) { 
      posts+= "${element.name},";
    });
     widget.dossier.ecole!.forEach((element) { 
      ecole+= "${element.name},";
    });

     widget.dossier.languages!.forEach((element) { 
      langue+= "${element.langName},";
    });

     widget.dossier.experiences!.forEach((element) { 
      experience+= "${element.title},";
    });

     widget.dossier.skills!.forEach((element) { 
      competence+= "${element.name},";
    });







    }







  @override
  void initState() {
    super.initState();

    idDossier = widget.dossier.id ?? 0;

    initVariables();
  

    _descriptionController = TextEditingController(text: widget.dossier.name ?? "1");

    _dateController = TextEditingController(text: widget.dossier.date ?? "2");

    _EmailController = TextEditingController(text: widget.dossier.mail ?? "3");

    _telephoneController = TextEditingController(text: widget.dossier.phone ?? "4");

     _postesController = TextEditingController(text: posts);
    _EcoleController = TextEditingController(text: ecole);

    _languagesController = TextEditingController(text: langue);
    _experienceController = TextEditingController(text: experience);
    _competenceController = TextEditingController(text: competence);
  }
  GlobalController _globalController = GlobalController();
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
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
                        // initialValue: widget.dossier.poste!.forEach((element) {
                        //   element.name;
                        //  }),



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
                               await _controller.ModifierDossier(widget.dossier.name??"", widget.dossier.mail??"", widget.dossier.phone??"", widget.dossier.date??"", tempPosts, tempCompetance, tempExperience, tempExperience, tempEcole).then((value) => {
                                setState((){}),
                                Navigator.of(context).pop()
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
    );
  }
}
