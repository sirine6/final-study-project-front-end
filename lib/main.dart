import 'package:flutter/material.dart';

import 'package:sirin/screens/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sirin/welcome.dart';




void main()async{
    await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
