import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sirin/controllers/authController.dart';
import 'package:sirin/screens/Acceuil.dart';
import 'package:sirin/utils/colors.dart';

import 'dashbord.dart';
import 'forgetPassword.dart';
import 'inscription.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  AuthController authController = AuthController();

  bool isNotValidEmail = false;
  bool isNotValiPassword=false;

  bool verifyEmail(String email) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      setState(() {
        isNotValidEmail = false;
      });
      return true;
    } else {
      setState(() {
        isNotValidEmail = true;
      });
      return false;
    }
  }

  bool verifyPassword( String valeur){
    if(RegExp(
       (r'^[a-z A-Z]+$')).hasMatch(valeur)){
        setState(() {
          isNotValiPassword=false;
        });
        return true;

      }else {
         setState(() {
             isNotValiPassword=true;
         });
         return false;
      }

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child: Center(
                child: Column(
                  children: [
                 
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "BIENVENUE !",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'images/user.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              "Adresse Mail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
        
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // height: MediaQuery.of(context).size.width * .15,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email_outlined,
                          color: borderColor,
                        )),
                  ),
                )),
            Visibility(
              visible: isNotValidEmail,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                     child: Text("Email Invalide",
                          style: TextStyle(color: Colors.red)))),
            ),
            // CHAMP MOT DE PASSE
            const SizedBox(height: 10),
            const Text(
              "Mot de passe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
        
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              // height: MediaQuery.of(context).size.width * .15,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    
                      border: InputBorder.none,
                      suffix: const Icon(Icons.visibility),
                      icon: Icon(
                        Icons.lock,
                        color: borderColor,
                      )),
                ),
              ),
            ),
        
          Visibility(
              visible: isNotValiPassword,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("password Invalide",
                          style: TextStyle(color: Colors.red)))),
            ),
            const SizedBox(height: 10),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: const Text(
                    "Mot de passe Oublié",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 20),
        
            InkWell(
              onTap: () async {
                /* if (!(verifyPassword(_passwordController.text))) {
                  setState(() {
                    isNotValiPassword=true;
                  });
                }
                */

                if ((_emailController.text.isEmpty) || (_passwordController.text.isEmpty)){
                  showErrorMessage(context);
                }
                else{
                   try{
                 await authController
                    .loginUser(_emailController.text, _passwordController.text)
                    .then((value) {
                  log(value!.accessToken?.length.toString() ?? "token empty");
                  authController.saveToken(value.accessToken);
                  authController.saveEmail(_emailController.text);

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Acceuil()));
                      
                });
                

               }

               catch (e){
                log("exception is : ${e.toString()}");
               }
                }
              
                
                
                
                
               /* if (!(verifyEmail(_emailController.text))) {
                  setState(() {
                    isNotValidEmail = true;
                  });
                }*/
        
        
        
        
        
                 if (((verifyEmail(_emailController.text)))){
                 
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // height: MediaQuery.of(context).size.width * .15,
                decoration: BoxDecoration(
                    color: buttonColor,
                    border: Border.all(color: buttonColor),
                    borderRadius: BorderRadius.circular(3)),

                child: const Center(

                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Connexion",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
        
            const Text(
              "Se connecter avec",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.twitter,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                FaIcon(
                  FontAwesomeIcons.facebook,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                FaIcon(
                  FontAwesomeIcons.google,
                  color: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Vous n'avez pas de compte? ",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                TextButton(
                  onPressed : () {
                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                               inscription()));
        
                  },
        
                  child :Text("s'identifier"),
                  style: TextButton.styleFrom(
                  primary : buttonColor,
                    textStyle: const TextStyle(fontStyle:FontStyle.italic)
                  ),
        
               
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'images/background.png',
                  height: 300,
                  width: 300,
                ))
          ],
              ),
            ),
        ));
  }
}
