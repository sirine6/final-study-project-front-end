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
import '../Component/MesPub.dart';
import '../Component/MyHeaderDrawer.dart';
import '../Component/listview.dart';
import '../Component/pub2.dart';
import '../Component/publication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/authController.dart';
import 'Acceuil.dart';

class Mespublication extends StatefulWidget {
  //RoleModel roleModel;
  Mespublication({Key? key}) : super(key: key);

  @override
  State<Mespublication> createState() => _MesPublicationState();
}

class _MesPublicationState extends State<Mespublication> {
  String? _base64;

  AuthController authController = AuthController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: customAppBar(_scaffoldKey, () {
          setState(() {});
        }),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buttonColor,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Acceuil()));
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                ),
              ),
            ),
            ],),
            SizedBox(
              height: 10,
            ),
            Publication(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: MesPub())
          ]),
        ));
  }
}
