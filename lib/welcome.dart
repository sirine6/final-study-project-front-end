import 'package:flutter/material.dart';
import 'package:sirin/utils/colors.dart';

import 'screens/home.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              'images/logo.png',             
            ),
            SizedBox(height:10),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyHomePage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(child: Text("C'est Parti",style: Theme.of(context).textTheme.headline5,)),
              ),
            )
        ],
      ),
    );
  }
}