import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/globalController.dart';
import '../../models/accountModel.dart';
import '../../utils/colors.dart';
import '../../widgets/textFieldForWorker.dart';
import '../home.dart';

class ModifierUser extends StatefulWidget {
  PagedItems user;

  ModifierUser({required this.user, Key? key}) : super(key: key);

  @override
  State<ModifierUser> createState() => _ModifierState();
}

class _ModifierState extends State<ModifierUser> {
  late int idUser;
  late TextEditingController _nomController;

  late TextEditingController _prenomController;

  late TextEditingController _loginController;

  late TextEditingController _motdepasseController;

  late TextEditingController _confirmerPasswordController;
  GlobalController _controller = GlobalController();

  late TextEditingController _adresseController;
  late TextEditingController _emailController;

  late TextEditingController _numeroController;

  @override
  void initState() {
    super.initState();

    idUser = widget.user.id ?? 0;
    _nomController = TextEditingController(text: widget.user.nameUser);

    _prenomController = TextEditingController(text: widget.user.firstName);

    _loginController = TextEditingController(text: widget.user.login);

    _motdepasseController = TextEditingController(text: widget.user.password);

    _confirmerPasswordController =
        TextEditingController(text: widget.user.confirmPassword);

    _adresseController =
        TextEditingController(text: widget.user.accountNonExpired.toString());
    _emailController = TextEditingController(text: widget.user.email);

    _numeroController = TextEditingController(text: widget.user.phone);
  }

  GlobalController _globalController = GlobalController();
  XFile? selectedImage;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                            await _controller.ModifierUserr(
                               _prenomController.text,
                                _emailController.text,
                                widget.user.id ?? 0,
                                selectedImage);
                          },
                          child: Text(
                            "Save",
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
                            "Cancel",
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
    );
  }
}
