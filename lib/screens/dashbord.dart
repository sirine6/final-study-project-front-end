import 'package:flutter/material.dart';
import 'package:sirin/controllers/authController.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: FutureBuilder<String?>(
          future: authController.getToken(),
          builder: (context, snapshot) {
            // return snapshot.connectionState != ConnectionState.waiting
            return snapshot.hasData
                ? Center(
                    child: Text(
                    "Token is ${snapshot.data}",
                  ))
                : const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
