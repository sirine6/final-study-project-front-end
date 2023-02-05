import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = const Color(0xFF18283B);
Color borderColor = const Color(0xFFBAB2B2);
Color buttonColor = const Color(0xFFE4A33D);
Color snackBarBackgroundColor = Colors.red;
Color borderr= const Color(0xBAB2B259);
 const Color facebookBlue = Color(0xFF1777F2);
 const Color online = Color(0xFF4BCB1F);
const Color dividerColor = Color(0xFFC8CCD0);
const Color subColor = Color.fromARGB(255, 241, 159, 197);
 const Color bord = Color(0xFFEEEEEE);




Future<int> getID()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('id')??0;
}

void showErrorMessage(BuildContext context){

  CoolAlert.show(
   context: context,
   type: CoolAlertType.error,
   text: "Tous les champs sont requis",
);

}

