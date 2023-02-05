import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/Component/AppBar.dart';
import 'package:sirin/screens/Acceuil.dart';
import 'package:sirin/screens/Compte.dart';
import 'package:sirin/screens/Groupe.dart';
import 'package:sirin/widgets/adminBoxes.dart';

import '../controllers/AfficheGroupe.dart';
import '../controllers/RoleControlleur.dart';
import '../controllers/globalController.dart';
import '../models/Role.dart';
import '../utils/colors.dart';
import 'Role.dart';

class Administration extends StatefulWidget {
 // RoleModel role;
  Administration({Key? key}) : super(key: key);

  @override
  State<Administration> createState() => _AdministrationState();
}

class _AdministrationState extends State<Administration> {
      final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
GlobalController global= GlobalController();
ApiGroup _apiGroup=ApiGroup();
ApiRole _apiRole=ApiRole();

late int id = 3;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getID().then((value) => {
      setState((){
        id = value;
      })
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_scaffoldKey,null),
    


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                     color:buttonColor,
                                ),
                             
                                child: InkWell(
                                  onTap: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Acceuil()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.arrow_back,color:Colors.white)
                                                            ),
                                ),
                                ),
            ),
      
                              Container(
                              
                                color: buttonColor,
                               child: const Align(
                                alignment: Alignment.centerLeft,
                                 child: Padding(
                                   padding: EdgeInsets.all(8.0),
                                   child: Text("Administration",
                                    style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                                 ),
                               ),
                              
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap:() {
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Compte()));
                                },
                                child: InkWell(
                                  onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Compte()));
                                  },
                                  child: Center(child: FutureBuilder<String?>(
                                    future:global.getNbUser(id) ,
                                    builder: (context, snapshot) {


                                      return !snapshot.hasData?Text("No DATA"):
                                      
                                       AdminBox(
                                       title: "Compte",
                                       subtitle: "${snapshot.data} Comptes",
                                       listOfWidgets: [
                                          FutureBuilder<String ?>(
                                            future: global.getNbUserA(id),
                                            builder: (context, snapshot) {
                                              return !snapshot.hasData?SizedBox():
                                               Text("Active: ${snapshot.data}");
                                            }
                                          ),
                                          FutureBuilder<String ?>(
                                            future: global.getNbUserd(id),
                                            builder: (context, snapshot) {
                                              return !snapshot.hasData?SizedBox():
                                               Text("Desactivate: ${snapshot.data}");
                                            }
                                          ),
                                          FutureBuilder<String?>(
                                            future: global.getNbUserB(id),
                                            builder: (context, snapshot) {
                                              return !snapshot.hasData?SizedBox():
                                               Text("Bloque:${snapshot.data}");
                                            }
                                          ),
                                                                  
                                        ],
                                                                
                                         textColor: Color(0xFF5B9BD7),
                                      );
                                    }
                                  )),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Groupe()));
                                },
                                child: Center(child: FutureBuilder<String?>(
                                  future:_apiGroup.getNbGroupe(id) ,
                                  builder: (context, snapshot) {
                                     return !snapshot.hasData?SizedBox():
                                     AdminBox(
                                        title: "Groupe",
                                     subtitle: "${snapshot.data}Groupe",
                                     listOfWidgets: [
                                        FutureBuilder<String ?>(
                                          future: _apiGroup.getNbGroupeA(id),
                                          builder: (context, snapshot) {
                                            return !snapshot.hasData?SizedBox():
                                            Text("Active: ${snapshot.data}");
                                          }
                                        ),
                                        FutureBuilder<String ?>(
                                          future: _apiGroup.getNbGroupeD(id),
                                          builder: (context, snapshot) {
                                            return !snapshot.hasData?SizedBox():
                                            Text("Desactivate: ${snapshot.data}");
                                          }
                                        ),
                                                        
                                      ],
                                    
                                        textColor: Color(0xFFDB4B5C),
                                                              
                                    );
                                  }
                                )),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: () {
                                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Role()));
                                },
                                child: Center(child: FutureBuilder<String?>(
                                  future: _apiRole.getNbRole(),
                                  builder: (context, snapshot) {
                                     return !snapshot.hasData?SizedBox():
                                     AdminBox(
                                        title: "Rôle",
                                     subtitle: "${snapshot.data}Rôles",
                                     listOfWidgets: [
                                         FutureBuilder<String?>(
                                           future: _apiRole.getNbRoleA(),
                                           builder: (context, snapshot) {
                                              return !snapshot.hasData?SizedBox():
                                              Text("Active: ${snapshot.data}");
                                           }
                                         ),
                                        FutureBuilder<String ?>(
                                          future: _apiRole.getNbRoled(),
                                          builder: (context, snapshot) {
                                            return !snapshot.hasData?SizedBox():
                                            Text("Desactivate: ${snapshot.data}");
                                          }
                                        ),
                                      ],
                                     textColor: Color(0xFFC78C30),
                                    );
                                  }
                                )),
                              )
                           
      
                            
          ],
          
        ),
      ),







    );
  }
}
