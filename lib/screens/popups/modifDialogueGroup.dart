import 'package:flutter/material.dart';
import 'package:sirin/models/Group.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../utils/colors.dart';

class ModifDialogue extends StatefulWidget {
  Groups groups;
  ModifDialogue({required this.groups, Key? key}) : super(key: key);

  @override
  State<ModifDialogue> createState() => _ModifDialogueState();
}

class _ModifDialogueState extends State<ModifDialogue> {
  late TextEditingController _modifController;
  late TextEditingController _descController;
  ApiGroup _apiGroup = ApiGroup();
  late int idGroupe;
  @override
  void initState() {
    super.initState();

    idGroupe = widget.groups.id ?? 0;
    _modifController = TextEditingController(text: widget.groups.nameGrp);

    _descController = TextEditingController(text: widget.groups.descGrp);
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Modifier groupe',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
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
                  controller: _modifController,
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
                  await _apiGroup.ModierGroup(
                          _modifController.text, _descController.text, idGroupe)
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
                      child: Text("Sauvgarder ",style: TextStyle(color: Colors.white,fontSize: 15),),
                    )),
              ),
            ),
          ],
        )
      ]),
    ));
  }
}
