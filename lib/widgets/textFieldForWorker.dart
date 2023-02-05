import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TextFormForWorker extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  IconData icon;
  String hint;
  TextFormForWorker({required this.controller,required this.icon,required this.hint,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        decoration:  InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 5.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: FaIcon(
              icon,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
