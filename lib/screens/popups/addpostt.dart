
// ignore_for_file: deprecated_member_use

import 'dart:io' as f ;



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import 'package:image_picker/image_picker.dart';


class AddPostt extends StatefulWidget {
 

  @override
  State<AddPostt> createState() => _AddPosttState();
 
}

class _AddPosttState extends State<AddPostt> {
 f.File?  image;
 Future pickImage() async{

  try{
  XFile? imageTemporary=await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image==null) return;

;
  setState(() => image=f.File(imageTemporary!.path));
  } on PlatformException catch(e){
    print('Failed to pick image :$e');
  }
 }

 

        
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
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Quoi de neuf?',
                border: InputBorder.none,
              ),
              
            ),
          ),
        ),
        Row(
          children: [
           FlatButton.icon(
                  onPressed: () => {
                    pickImage()
                    
                  },
           
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.black,
                  ),
                  label: Text('photo'),
           ),

          ],
          
        ),
       
        Container(
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


                                    
      ],
      
    );
   
  }

}