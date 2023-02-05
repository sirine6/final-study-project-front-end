import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/screens/popups/Postuler.dart';

import '../screens/Dossier.dart';
import '../utils/colors.dart';

class MesPrestBox extends StatelessWidget {
  String title;
  String name;
  String date;
  Uint8List image;
 
  MesPrestBox({Key? key,required this.title,required this.name,required this.date,required this.image}) : super(key: key);

  @override


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: MemoryImage(image), fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  date,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(
              Icons.pan_tool,
              size: 15,
              color: Colors.grey,
            ),
            const Expanded(
              child: SizedBox(),
            ),
             InkWell(
              onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Dossier())); 
              },
               child: const FaIcon(
                FontAwesomeIcons.eye,
                size: 15,
                color: Colors.grey,
                         ),
             ),
            
          ],
        ),
      ),
    );
  }
}
