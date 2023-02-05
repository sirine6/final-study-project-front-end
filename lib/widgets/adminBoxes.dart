import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AdminBox extends StatelessWidget {
  String title;
  // Déclaration de List de Widgets
  List<Widget> listOfWidgets;
  String subtitle;
  Color textColor;
  AdminBox(
      {required this.title,
      required this.subtitle,
      required this.listOfWidgets,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.5,
      height: size.width / 2,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        // boxShadow:const [
        //   BoxShadow(
        //     blurRadius: 5,
        //     color: Colors.grey,
        //     offset: Offset(0,0)
        //   )
        // ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: textColor),
                    ),
                  ),
                  Column(children: listOfWidgets),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
