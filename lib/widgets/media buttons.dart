import 'package:flutter/material.dart';

class MediaButton extends StatelessWidget {
  String text;
  Widget icon;
  MediaButton({Key? key,  required this.text,required this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5,),
        Text(text)
      ],
    );
  }
}