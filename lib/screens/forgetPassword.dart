// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sirin/controllers/companyController.dart';

import '../utils/colors.dart';
import 'code.dart';
import 'home.dart';


class ForgetPassword extends StatefulWidget {
  ForgetPassword({ Key? key }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  CompanyController company= CompanyController();

    TextEditingController _emailvControlleur = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Center(
                  child: Column(
                     
                    children: [
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                     color:primaryColor,
                                ),
                             
                                child: InkWell(
                                  onTap: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyHomePage()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.arrow_back,color:Colors.white)
                                                            ),
                                ),
                                ),
                     ),
                    ],
                  ),
                )),
           
            SizedBox(height: 40,),
            
             Column(
              children: [
                const Text(
                    "Mot de passe oublié ?",
                    style:TextStyle(
                      color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                   Column(
                 
                   children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                          "confirmez  votre e-mail pour recevoir le lien de rétinitialisation",
                          style:TextStyle(
                            color:Colors.black,
                            fontSize:12,        
                          ),                  
                          ),
                        ),]                   
                   ),

                  SizedBox(height: 10,),
                Center(
                  child: Form(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text("E-mail", style:TextStyle(
                          color:Colors.black,
                          fontSize:14,
                          fontWeight: FontWeight.bold
             
                      ),),
                        ),
                        const SizedBox(height: 10,),
                        
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                                // height: MediaQuery.of(context).size.width * .15,
                    decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                       controller: _emailvControlleur,
                      decoration: InputDecoration(
                        
                        hintText: 'votre e-mail',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email_outlined,
                          color: borderColor,
                        )),
                     ),
                                )),
                SizedBox(height: 25,),

              
                 InkWell(
                  onTap:()async{
                   await company.getForgetPassword(_emailvControlleur.text).then((value) => {
                    if(value!.contains('success')){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Code())),
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('email invalid'),))
                    }
                   });
                  },

                   child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    // height: MediaQuery.of(context).size.width * .15,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        border: Border.all(color: buttonColor),
                        borderRadius: BorderRadius.circular(5)),
                                 
                    child: const Center(
                                 
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Envoyer le lien ",
                          style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 15),
                        ),
                      ),
                    ),
                                ),
                 ),
               
              SizedBox(height: 25,),
                  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Déja  inscrit(e)  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyHomePage()));
                  },
                  child: Text(
                    "s'identifier",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: buttonColor),
                  ),)
              ],
                  ),
                      ],
                    ),),),],),],),),);}}