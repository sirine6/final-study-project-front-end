import 'package:flutter/material.dart';
import 'package:sirin/models/Group.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../utils/colors.dart';

class AddDialogue extends StatefulWidget {
  //Groups groups;
  AddDialogue({ Key? key}) : super(key: key);

  @override
  State<AddDialogue> createState() => _AddDialogueState();
}

class _AddDialogueState extends State<AddDialogue> {
    ApiGroup _apiGroup = ApiGroup();
   TextEditingController _GroupeController=TextEditingController();
  TextEditingController _descController=TextEditingController();

  //late int idGroupe;
  @override
 
  @override
  void initState() {
    super.initState();


 

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
      height: 260,
      child: Wrap(children: [
        Column(
          children: [
            Container(
                color: primaryColor,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Nouveau Groupe',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // height: MediaQuery.of(context).size.width * .15,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(3)),
                child: TextFormField(
                  controller: _GroupeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nom groupe',
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              // height: MediaQuery.of(context).size.width * .15,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(3)),
              child: TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 60, right: 10),
              child: InkWell(
                onTap: () async {
                  // print('Hello World');
                  await _apiGroup.addGroup(_GroupeController.text,
                          _descController.text,1900)
                      .then((value) => {
                            Navigator.of(context).pop(),
                            setState(() {}),
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
            ),
          ],
        )
      ]),
    ));
  }
}
