import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/Component/publication.dart';
import 'package:sirin/screens/Acceuil.dart';
import 'package:sirin/screens/MesPublication.dart';
import 'package:sirin/screens/demandes.dart';
import 'package:sirin/screens/postules.dart';
import 'package:sirin/utils/colors.dart';

import '../screens/Dossier.dart';
import '../screens/MesPostuler.dart';
import '../screens/MesPrestation.dart';
import '../screens/Prestation.dart';
import '../screens/administration.dart';
import '../screens/popups/DossierCompétencecc.dart';

class Listview extends StatefulWidget {
  Listview({Key? key}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  bool isProfileMenuShown = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ListTile(
            title: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Acceuil()));
              },
              child: const Text(
                'Acceuil',
                style: TextStyle(fontSize: 18),
              ),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
            onTap: () {},
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text(
              'Profil',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
            ),
            trailing: Icon(
                isProfileMenuShown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black),
            onTap: () {
              setState(() {
                isProfileMenuShown = !isProfileMenuShown;
              });
            },
          ),
          Visibility(
            visible: isProfileMenuShown,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  InkWell(
                    onTap: (){
                     // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Publication2()));
                    },
                    child: InkWell(
                      onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Mespublication()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top:8.0,bottom: 8.0,left:70),
                        child: Text("Publications",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),
                        ),
                      ),
                    )),
                     InkWell(
                      onTap: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Dossier()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top:8.0,bottom: 8.0,left:70),
                        child: Text("Mes cv",
                                 style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                                ),),
                      ),
                    ),
                  InkWell(
                     onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Demandes()));
                    },
                    child:  Padding(
                   padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:70),

                      child: InkWell(
                        onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MesPrestation())); 
                        },
                        child: Row(
                          children: [
                            const Text("Demandes",
                             style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),),
                            const SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                   color:buttonColor,
                              ),
                           
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Text("3",
                                style: TextStyle(color:Colors.white),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                   InkWell(
                     onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MesPostules()));
                    },
                    child:  Padding(
                   padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:70),

                      child: Row(
                        children: [
                          const Text("Postule",
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                 color:buttonColor,
                            ),
                         
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Text("3",
                              style: TextStyle(color:Colors.white),),
                            ),
                          )
                        ],
                      ),
                    )),
                        InkWell(
                     onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AdddossierDialog()));
                    },
                    child: const  Padding(
                   padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:70),

                      child:  Text("Creer un cv",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),),
                    )),
                   
                ]),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          
     
             InkWell(
              onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Administration()));
                    },
               child: const ListTile(
                title: Text(
                  'Administration',
                  style: TextStyle(fontSize: 18),
                  
                ),
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.grey,
                ),
                trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
                
                         ),
             ),
        
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          InkWell(
            onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Prestation()));
            },
            child: const ListTile(
              title: Text(
                'offre',
                style: TextStyle(fontSize: 18),
              ),
              leading: FaIcon(
              FontAwesomeIcons.briefcase,
                color: Colors.grey,
              ),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
           
            ),
          )
        ]),
      ),
    );
  }
}
