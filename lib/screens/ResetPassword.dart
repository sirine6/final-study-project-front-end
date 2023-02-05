// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sirin/controllers/companyController.dart';

import '../utils/colors.dart';
import 'code.dart';
import 'home.dart';


class ResetPassword extends StatefulWidget {
  ResetPassword({ Key? key }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  CompanyController company= CompanyController();

    TextEditingController _emaillControlleur = TextEditingController();
        TextEditingController _confirmControlleur = TextEditingController();

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
           
            SizedBox(height: 50,),
            
             Column(
              children: [
                const Text(
                    "Changez votre mot de passe",
                    style:TextStyle(
                      color:Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  

                  SizedBox(height: 50,),
                Center(
                  child: Form(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text("Mot de passe ", style:TextStyle(
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
                       controller: _emaillControlleur,
                      decoration: InputDecoration(
                        
                        hintText: 'mot passe',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.key,
                          color: borderColor,
                        )),
                     ),
                                )),
                                  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text("Confirmer mot de passe ", style:TextStyle(
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
                       controller: _confirmControlleur,
                      decoration: InputDecoration(
                        
                        hintText: 'Confirmer mot de passe',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.key,
                          color: borderColor,
                        )),
                     ),
                                )),
                SizedBox(height: 25,),

              
                 InkWell(
                 onTap:()async{
                   await company.getConfirme(_emaillControlleur.text,_confirmControlleur.text).then((value) => {
                    if(value!.contains('success')){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage())),
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
               
             
                 
                      ],
                    ),),),],),],),),);}}