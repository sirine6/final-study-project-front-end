import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/models/Group.dart';
import 'package:sirin/screens/administration.dart';
import 'package:sirin/screens/popups/AddGroupp.dart';

import '../Component/AppBar.dart';

import '../Component/listadmin.dart';
import '../controllers/AfficheGroupe.dart';
import '../utils/colors.dart';
import '../widgets/GroupBox.dart';
import 'Acceuil.dart';

class Groupe extends StatefulWidget {
    //Groups groupe;
  Groupe({Key? key}) : super(key: key);

  @override
  State<Groupe> createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  ApiGroup apiGroup = ApiGroup();

  TextEditingController _GroupController = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();

  ApiGroup apigroupe = ApiGroup();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late int idGroupe;

  @override
  void initState() {
    // TODO: implement initState
    //idGroupe = widget.groupe.id ?? 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey, () {
        setState(() {});
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: buttonColor,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Administration()));
                },
                child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.arrow_back, color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gestion de  Groupe",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddDialogue();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: buttonColor),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                const Text("Ajouter"),
                                const Icon(Icons.add_circle),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<Groups>?>(
              future: apiGroup.getAll(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? const Center(
                        child: const Text("Loading..."),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Row(children: [
                              const Icon(Icons.check_circle_outline_sharp),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(snapshot.data![index].nameGrp ?? ""),
                              Spacer(),
                              GroupBox(
                                groupe: snapshot.data![index],
                              )
                            ]);
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
