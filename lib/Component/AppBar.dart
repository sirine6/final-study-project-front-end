import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/authController.dart';
import '../models/emai.dart';
import '../utils/colors.dart';





PreferredSizeWidget customAppBar(GlobalKey<ScaffoldState> scaffoldkey,Function()? onclick){
    AuthController authController = AuthController();
    return AppBar(
          backgroundColor: primaryColor,
          //  leading: IconButton(icon: Icon(Icons.menu),
          //  onPressed:(){},),
          centerTitle: true,

          title: Image.asset(
            'images/logo.png',
            width: 110,
            height: 15,
            // _bytesImage = Base64Decoder().convert(_imgString);

          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child:

      // ****
            
             FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snap) {
                                    // log("${snap.data!.getString("email")}");

                return
                !snap.hasData?
                const SizedBox():
                
      
                 FutureBuilder<EmailModel?>(
                  future: authController.getemaill(snap.data!.getString("email")??""),
                  builder: (context, snapshot) {
                    return
            
                    // SizedBox();
            
                    !snapshot.hasData?
                    const Center(child: Text("Loading..."),):
       // *****
                    
                     InkWell(
                      onTap: (){
                        scaffoldkey.currentState!.openDrawer();
                      },
                       child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: MemoryImage(base64Decode(snapshot.data!.picture??""),),fit: BoxFit.cover)
                          ),
                       
                       ),
                     );
                  }
                );
              }
            ),
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: onclick,
            )
          ],
        );


}