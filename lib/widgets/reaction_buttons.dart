import 'package:flutter/material.dart';

class ReactionButtons extends StatelessWidget {
  String text;
  Widget icon;
  ReactionButtons({required this.text,required this.icon, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(text)
      ],
      
    );
  }
}