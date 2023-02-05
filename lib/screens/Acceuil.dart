// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/controllers/AfficheGroupe.dart';
import 'package:sirin/models/Role.dart';
import 'package:sirin/models/emai.dart';
import 'package:sirin/screens/Compte.dart';
import 'package:sirin/utils/colors.dart';

import '../Component/AppBar.dart';
import '../Component/MyHeaderDrawer.dart';
import '../Component/listview.dart';
import '../Component/pub2.dart';
import '../Component/publication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/authController.dart';

class Acceuil extends StatefulWidget {
  //RoleModel roleModel;
  Acceuil({Key? key}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuiState();
}

class _AcceuiState extends State<Acceuil> {
  String? _base64;

  //ApiGroup apiGroup = ApiGroup();
  AuthController authController = AuthController();
 /* @override
  void initState() {
    super.initState();
    //apiGroup.getAll();
  }*/

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
          children: [
            MyHeaderDrawer(),
            Listview(),
          ],
        )))),
        appBar: customAppBar(_scaffoldKey, () {
          setState(() {});
        }),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            Publication(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Pub())
          ]),
        ));
  }
}
