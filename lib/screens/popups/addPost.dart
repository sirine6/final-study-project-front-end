// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sirin/controllers/PublicationControlleur.dart';
import 'package:sirin/controllers/globalController.dart';
import 'package:sirin/utils/colors.dart';


class AddPost extends StatefulWidget {

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
// GlobalController golbal=GlobalController();
PublicationControlleur publicationControlleur=PublicationControlleur();

TextEditingController statusControlleur = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
     
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(color: buttonColor,
        child: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Creer une publication"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.close)),
              )
            ],
          ),
        ),
        
        
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: statusControlleur,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Quoi de neuf?',
                border: InputBorder.none,
              ),
              
            ),
          ),
        ),
       
        InkWell(
          onTap:()async{
            // print('Hello World');
          await  publicationControlleur.addPost(statusControlleur.text, 1).then((value) => {
          setState((){}),
           Navigator.of(context).pop(),
          });
           

          },
          child: Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.54),
           
        
        
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(25),
                                        color:buttonColor
                                    
                                       ),
                                       child:Padding(
                                         padding: const EdgeInsets.all(5),
                                         child:  Text("Publier"),
                                         
                                       )
                                      ),
        ),
      ],
      
    );
  }
}