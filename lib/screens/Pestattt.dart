import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/screens/popups/Postuler.dart';

import '../utils/colors.dart';

class PrestationBox extends StatefulWidget {
  String title;
  String name;
  String date;
  Uint8List image;
 
  PrestationBox({Key? key,required this.title,required this.name,required this.date,required this.image}) : super(key: key);

  @override
  State<PrestationBox> createState() => _PrestationBoxState();
}

class _PrestationBoxState extends State<PrestationBox> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    log("++++ ${widget.image}");
  }


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
                image: MemoryImage(widget.image), fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  widget.date,
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
            const FaIcon(
              FontAwesomeIcons.eye,
              size: 15,
              color: Colors.grey,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                       showDialog(
                   context: context,
                   builder: (context) {
                    return Postuler();
                        });
                    },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: buttonColor),
                  child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: const Text("Postuler"))),
            ),
          ],
        ),
      ),
    );
  }
}
