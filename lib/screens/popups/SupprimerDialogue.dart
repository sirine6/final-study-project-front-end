import 'package:flutter/material.dart';
import 'package:sirin/utils/colors.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../controllers/globalController.dart';
import '../../models/Group.dart';

class SupprimerDialogue extends StatefulWidget {
  Groups groups;
  SupprimerDialogue({required this.groups, Key? key}) : super(key: key);

  @override
  State<SupprimerDialogue> createState() => _SupprimerDialogueState();
}

class _SupprimerDialogueState extends State<SupprimerDialogue> {
  ApiGroup _apiGroup = ApiGroup();
  late int idGroupe;
  void initState() {
    super.initState();

    idGroupe = widget.groups.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0.0),
      title: Container(
        padding: const EdgeInsets.all(10.0),
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'suppression Groupe',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      content: Container(
          child: Text('Etes_vous sur de vouloir supprimer cet groupe ?')),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.grey,
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Fermer',style:TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: buttonColor,
              onPrimary: Colors.white,
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onPressed: () {},
          child: InkWell(
              onTap: (() async {
                await _apiGroup.supprimerGroupe(idGroupe).then((value) => {
                      Navigator.of(context).pop(),
                      setState(() {}),
                    });
              }),
              child: Text('Supprimer')),
        ),
      ],
    );
  }
}
