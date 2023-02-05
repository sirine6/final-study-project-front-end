import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/globalController.dart';
import '../../utils/colors.dart';
import '../../widgets/textFieldForWorker.dart';
import '../home.dart';

class AddWorkerDialog extends StatefulWidget {
  AddWorkerDialog({Key? key}) : super(key: key);

  @override
  State<AddWorkerDialog> createState() => _AddWorkerDialogState();
}

class _AddWorkerDialogState extends State<AddWorkerDialog> {
  TextEditingController _nomController = TextEditingController();

  TextEditingController _prenomController = TextEditingController();

  TextEditingController _loginController = TextEditingController();

  TextEditingController _motdepasseController = TextEditingController();

  TextEditingController _confirmerPasswordController = TextEditingController();

  TextEditingController _adresseController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _numeroController = TextEditingController();
  GlobalController _globalController = GlobalController();
  XFile? selectedImage;
  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: Center(
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
                              icon: FaIcon(
                                FontAwesomeIcons.camera,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormForWorker(
                    controller: _nomController,
                    icon: FontAwesomeIcons.solidCircleUser,
                    hint: 'Nom',
                  ),
                  TextFormForWorker(
                    controller: _prenomController,
                    icon: FontAwesomeIcons.solidCircleUser,
                    hint: 'Prenom',
                  ),
                  TextFormForWorker(
                    controller: _loginController,
                    icon: FontAwesomeIcons.arrowRightToBracket,
                    hint: 'Login',
                  ),
                  TextFormForWorker(
                    controller: _motdepasseController,
                    icon: FontAwesomeIcons.key,
                    hint: 'Mot de passe',
                  ),
                  TextFormForWorker(
                    controller: _confirmerPasswordController,
                    icon: FontAwesomeIcons.key,
                    hint: 'Confirmer mot de passe',
                  ),
                  TextFormForWorker(
                    controller: _adresseController,
                    icon: FontAwesomeIcons.solidEnvelope,
                    hint: 'Adresse',
                  ),
                  TextFormForWorker(
                    controller: _emailController,
                    icon: FontAwesomeIcons.solidEnvelope,
                    hint: 'Email',
                  ),
                  TextFormForWorker(
                    controller: _numeroController,
                    icon: FontAwesomeIcons.phone,
                    hint: 'Numéro',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: buttonColor,
                                border: Border.all(color: buttonColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                  child: InkWell(
                                onTap: () async {
                                  if ((_nomController.text.isEmpty) ||
                                      (_prenomController.text.isEmpty) ||
                                      (_loginController.text.isEmpty) ||
                                      (_motdepasseController.text.isEmpty) ||
                                      (_confirmerPasswordController
                                          .text.isEmpty) ||
                                      (_adresseController.text.isEmpty) ||
                                      (_emailController.text.isEmpty) ||
                                      (_numeroController.text.isEmpty)) {
                                    showErrorMessage(context);
                                  } else {
                                    await getID().then((id) async {
                                      await _globalController
                                          .addUser(
                                              _nomController.text,
                                              _prenomController.text,
                                              _loginController.text,
                                              _motdepasseController.text,
                                              _confirmerPasswordController.text,
                                              _adresseController.text,
                                              _emailController.text,
                                              _numeroController.text,
                                              selectedImage,
                                              1226)
                                          .then((value) => {
                                                Navigator.of(context).pop(),
                                                setState(() {}),
                                              });
                                    });
                                  }
                                },
                                child: Text(
                                  "Ajouter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  border: Border.all(color: buttonColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                    child: Text(
                                  "Annuler",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
