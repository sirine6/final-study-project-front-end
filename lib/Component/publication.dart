// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirin/screens/popups/addPost.dart';
import 'package:sirin/widgets/media%20buttons.dart';

import '../screens/popups/addpostphoto.dart';
import '../screens/popups/addpostt.dart';

class Publication extends StatefulWidget {
  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  TextEditingController _pubControlleur = TextEditingController();
    XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BuildTitleRow(),
            SizedBox(
              height: 18,
            ),
            BuildStoriesRow(),
            SizedBox(
              height: 40,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
              showDialog(context: context, 
              builder: (_){
                return Dialog(
                  insetPadding: EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                  child: AddPostPhoto(),
                );
              });
            },
                child: MediaButton(text: 'Photo', icon: FaIcon(FontAwesomeIcons.image))),
              MediaButton(text: 'Video', icon: FaIcon(FontAwesomeIcons.clapperboard)),
              MediaButton(text: 'GIF', icon: FaIcon(FontAwesomeIcons.laptop)),
    
    
            ],
          ),
          Divider(
         
            thickness: 5,
            color: Colors.grey,
          )
          ],
        ),
      ),
    );
  }
}

class BuildTitleRow extends StatelessWidget {
  const BuildTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Text(
        'Créer une publication',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}

class BuildStoriesRow extends StatelessWidget {
  const BuildStoriesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/user.png',
          width: 45,
          height: 45,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: InkWell(
            onTap: (){
              showDialog(context: context, 
              builder: (_){
                return Dialog(
                  insetPadding: EdgeInsets.symmetric(vertical: 200,horizontal: 30),
                  child: AddPost()
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey)
              ),
              height: MediaQuery.of(context).size.width/3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment:Alignment.topLeft,
                  child: Text("Quoi de neuf?"),
                ),
              ),
              
            )
          ),
          // keyboardType: TextInputType.multiline,
        )
      ],
    );
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.indigo,

          child: InkWell(
            onTap: (){
               showDialog(context: context, 
              builder: (_){
                return Dialog(
                  insetPadding: EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                  child: AddPostt()
                );
              });
            },
            child: TextButton(
                onPressed: () {},
                child: Row(children: [
                  FlatButton.icon(
                    onPressed: () => print("photo"),
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.black,
                    ),
                    label: Text('photo'),
                  ),
                ])),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          color: Colors.red,
          child: TextButton(
              onPressed: () {},
              child: Row(children: [
                FlatButton.icon(
                  onPressed: () => print("video"),
                  icon: const Icon(
                    Icons.video_camera_back,
                    color: Colors.black,
                  ),
                  label: Text('video'),
                ),
              ])),
        ),
        SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {},
            child: Row(children: [
              FlatButton.icon(
                onPressed: () => print("gif"),
                icon: const Icon(
                  Icons.gif_box_sharp,
                  color: Colors.black,
                ),
                label: Text('gif'),
              ),
            ])),
            
      ],
    );
  }
}
