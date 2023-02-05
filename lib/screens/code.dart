
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sirin/controllers/companyController.dart';

import '../utils/colors.dart';
import 'ResetPassword.dart';

class Code extends StatelessWidget {
   Code({ Key? key }) : super(key: key);
    TextEditingController codecontrolleur = TextEditingController();
    CompanyController companye=CompanyController();
    TextEditingController code=TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
       body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'images/logo.png',
                          width: 110,
                          height: 40,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "BIENVENUE !",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),



            const SizedBox(height: 20),
            Image.asset(
              'images/user.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height:20),
            Column(
             crossAxisAlignment: CrossAxisAlignment.center,
               // ignore: prefer_const_literals_to_create_immutables
               children: [
                Column(
                  children: [
                 
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 50),
                     child: Center(
                       child: Text('un code de vérification  vous à été envoyé',
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        )),
                     ),
                   ),
                  
                
            
             SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                      Text('saisissez le code vérification à 6 chiffre envoyé  ',
                        style: 
                          TextStyle(
                      color: Colors.black,
                      fontSize:12
                    
                        )),
                       Text('Changer',
                      style: 
                        TextStyle(
                    color: buttonColor,
                    fontSize:10

                      ))
               ]),
                  ),
                  ]
        ),
      

                  SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 22),
                       child: Center(
                  child: Form(
                    child: Column(
                       
                        children: [
                   Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                // height: MediaQuery.of(context).size.width * .15,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                         controller: codecontrolleur,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          hintText: 'saisissez le code ',
                            
                         ),
                      ),
                    ),)
                   ]
                   
          
          )
          
          )
          ),

                     ),
    
                       SizedBox(height: 30,),

                InkWell(
                  onTap: ()async {
                    await companye.getConfirm(codecontrolleur.text).then((value) => {
                    if(value!.contains('success')){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResetPassword())),
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('code invalid'),))
                    }
                   });
                  },
                    
                
                  child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  // height: MediaQuery.of(context).size.width * .15,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      border: Border.all(color: buttonColor),
                      borderRadius: BorderRadius.circular(20)),
                
                  child: const Center(
                
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Valider",
                        style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 15),
                      ),
                    ),
                  ),
                              ),
                ),
              SizedBox(height: 20,),

                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "je n'ai pas recu de code   ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
               
                  Text(
                    "envoyer à nouveau",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: buttonColor),
                  ),
                
              ],
            ),
          ],

         






          
        )
          ]
        
       ),)
     );
  }
}


