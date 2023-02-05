import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/models/Group.dart';
import 'package:sirin/screens/popups/Postuler.dart';

import '../screens/popups/Affectation.dart';
import '../screens/popups/DetailGroup.dart';
import '../screens/popups/SupprimerDialogue.dart';
import '../screens/popups/modifDialogueGroup.dart';

class GroupBox extends StatefulWidget {
  Groups groupe;


  GroupBox({Key? key, required this.groupe,})
      : super(key: key);

  @override
  State<GroupBox> createState() => _GroupBoxState();
}

class _GroupBoxState extends State<GroupBox> {
  late int idgroupe;

  @override
  void initState() {
    super.initState();

    idgroupe = widget.groupe.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

          
       
           Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                showDialog(
                context: context,
                 builder: (context) {
                 return ModifDialogue(groups: widget.groupe);
                        });
                  },
                  child: const Icon(
                    FontAwesomeIcons.edit,
                    size: 15,
                    color: Colors.grey,
                  )),
                   const SizedBox(
                    width: 10,
                    ),
                   InkWell(
                    onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SupprimerDialogue(groups: widget.groupe);
                        });
                     },
                    child: const Icon(
                    FontAwesomeIcons.trash,
                    size: 15,
                    color: Colors.grey,
                     )),
                     const SizedBox(
                    width: 10,
                      ),
                    InkWell(
                    onTap: () {
                       showDialog(
                        context: context,
                        builder: (context) {
                          return Detailgroup(groups: widget.groupe);
                        });
                    },
                    child: const Icon(
                    FontAwesomeIcons.eye,
                    size: 15,
                    color: Colors.grey,
                     )),
                    const SizedBox(
                     width: 10,
                     ),
                    InkWell(
                    onTap: () {
                       showDialog(
                   context: context,
                   builder: (context) {
                    return Affectation(groups: widget.groupe,);
                        });
                    },
                    child: const Icon(
                    FontAwesomeIcons.cog,
                    size: 15,
                    color: Colors.grey,
                     )),
                      
            ],
          ),
        
      ],
    );
  }
}
