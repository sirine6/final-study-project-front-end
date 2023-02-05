import 'package:flutter/material.dart';

class  Commentaire extends StatefulWidget {
  const Commentaire({ Key? key }) : super(key: key);

  @override
  State<Commentaire> createState() => _CommentaireState();
}

class _CommentaireState extends State<Commentaire> {
  @override
  Widget build(BuildContext context) {
    return Image.asset( 'images/logo.png',
           width: 110,
           height: 15,);
    
  }
}