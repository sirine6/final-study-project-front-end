import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/authController.dart';
import '../models/emai.dart';
import '../utils/colors.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
      AuthController authController = AuthController();
    return Container(
      color: primaryColor,
      width: double.maxFinite,
      height: 55,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
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
                    
                       Row(
                        children: [
                              Text(snapshot.data!.username?? ""),
                                  Text(snapshot.data!.firstName?? ""),
                        ],
                       );
                   
                     
                     
                  }
                );
              }
            ),
           
                 ),
        
        ],
      ),
    );
  }
}
