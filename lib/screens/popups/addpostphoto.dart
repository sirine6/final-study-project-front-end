// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirin/controllers/PublicationControlleur.dart';
import 'package:sirin/controllers/globalController.dart';
import 'package:sirin/utils/colors.dart';

import '../../models/accountModel.dart';
import '../../widgets/media buttons.dart';

class AddPostPhoto extends StatefulWidget {
  
  AddPostPhoto({Key? key}) : super(key: key);
  @override
  State<AddPostPhoto> createState() => _AddPostState();
}

class _AddPostState extends State<AddPostPhoto> {
// GlobalController golbal=GlobalController();
  late int idUser;
  PublicationControlleur publicationControlleur = PublicationControlleur();
  GlobalController globalController = GlobalController();
  XFile? selectedImage;
  TextEditingController statusControlleur = TextEditingController();
  @override
  void initState() {
    super.initState();
    //idUser=widget.user.id??00;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: buttonColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Creer une publication"),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)),
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
                decoration: const InputDecoration(
                  hintText: 'Quoi de neuf?',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          selectedImage != null
              ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: FileImage(File(selectedImage!.path)),
                          fit: BoxFit.cover)),
                )
              : Center(
                  child: IconButton(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          selectedImage = image;
                        });
                      },
                      icon: FaIcon(FontAwesomeIcons.image)),
                ),
          InkWell(
            onTap: () async {
              await globalController
                  .addPublicationPhoto(statusControlleur.text,selectedImage,3)
                  .then((value) => {
                        Navigator.of(context).pop(),
                        setState(() {}),
                      });
            },
            child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .54),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: buttonColor),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Publier"),
                )),
          ),
        ],
      ),
    );
  }
}
