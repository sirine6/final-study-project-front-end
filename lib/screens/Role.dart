import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/controllers/AfficheGroupe.dart';
import 'package:sirin/models/Role.dart';
import 'package:sirin/screens/administration.dart';

import '../Component/AppBar.dart';
import '../Component/listadmin.dart';

import '../controllers/RoleControlleur.dart';
import '../utils/colors.dart';
import '../widgets/GroupBox.dart';
import 'Acceuil.dart';

class Role extends StatefulWidget {
  
// RoleModel  roleModel;
  Role({ Key? key}) : super(key: key);

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  ApiRole roleControlleur = ApiRole();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late int idrole;
    @override



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey, null),
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
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(5),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gestion de  Role",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: buttonColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text("Ajouter"),
                              Icon(Icons.add_circle),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: FutureBuilder<List<RoleModel>?>(
                  future: roleControlleur.getRoleAll(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                               /* onTap: () async {
                                  await role.ActiverRole(id_role)
                                      .then((value) => {
                                            Navigator.of(context).pop(),
                                            setState(() {}),
                                          });
                                          
                                },*/
                                child: Row(
                                  children: [

                                  snapshot.data![index].condition ?? true?

                                  InkWell(
                                    onTap: ()async{
                                      await roleControlleur.DesactiverRole(snapshot.data![index].id??0).then((value) {
                                        setState(() {
                                          
                                        });
                                      });

                                    },
                                    child: Icon(Icons.check_circle_outline_sharp,
                                          color: Colors.grey),
                                  ):


                                    
                                    
                                    
                                    InkWell(
                                       onTap: ()async{
                                      await roleControlleur.ActiverRole(snapshot.data![index].id??0).then((value) {
                                        setState(() {
                                          
                                        });
                                      });

                                    },
                                      child: Icon(Icons.check_circle_outline_sharp,
                                          color: Colors.orange),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: AutoSizeText(
                                            snapshot.data![index].nameRoles ??
                                                ""))
                                  ],
                                ),
                              );
                            }));
                  }))
        ],
      ),
    );
  }
}
