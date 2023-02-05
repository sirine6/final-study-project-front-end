// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_final_fields, unused_field, camel_case_types

import 'dart:developer';
import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirin/controllers/authController.dart';
import 'package:sirin/controllers/companyController.dart';
import 'package:sirin/screens/popups/companyDialog.dart';
import 'package:sirin/utils/colors.dart';

import 'Acceuil.dart';
import 'home.dart';

// ignore: must_be_immutable
class inscription extends StatefulWidget {
  inscription({Key? key}) : super(key: key);

  @override
  State<inscription> createState() => _inscriptionState();
 
}

class _inscriptionState extends State<inscription> {
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }
  
   XFile? selectedImage;
  PickedFile? _pickedFile;

  String url_img =
      '/data/user/0/com.example.sirin/cache/image_picker5145411999282563539.jpg';
  AuthController authController = AuthController();
  // ignore: prefer_final_fields
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  TextEditingController _textControlleur = TextEditingController();
  TextEditingController _prenomControlleur = TextEditingController();
  TextEditingController _adresseControlleur = TextEditingController();
  TextEditingController _siretControlleur = TextEditingController();
  TextEditingController _codenafControlleur = TextEditingController();
  TextEditingController _raisonControlleur = TextEditingController();
  TextEditingController _respControlleur = TextEditingController();
  TextEditingController _loginControlleur = TextEditingController();
  TextEditingController _motpasseControlleur = TextEditingController();
  TextEditingController _confirmControlleur = TextEditingController();
  CompanyController companyController = CompanyController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isNotValisiret = false;
  bool _isPasswordVisible = false;
  bool _isconfirmPasswordVisible = false;
   

  bool verifysiret(String valeur) {
    if (RegExp(r'^[0-9]{14}$').hasMatch(valeur)) {
      setState(() {
        isNotValisiret = false;
      });
      return true;
    } else {
      setState(() {
        isNotValisiret = true;
      });
      return false;
    }
  }

  final ImagePicker _picker = ImagePicker();
  List<String> unprofessioalEmails = ["gmail", "yahoo", "outlook", "hotmail"];
   _inscriptionState(){
        // Set the text property to a value to be displayed
       // _prenomControlleur.text = "syrine";
     }
   
     
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: primaryColor,
        title: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Image.asset(
              'images/logo.png',
              width: 100,
            )),
          ),
          Center(child: Text("Bienvenu",style: TextStyle(fontSize: 16),)),
        ]),
      ),
      /* child: Text("Bienvenu",  style: TextStyle(fontSize: 30, color: Colors.white),*/

      body: SingleChildScrollView(
        child: Column(
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

            /* imageProfile(),*/
            const SizedBox(height: 10),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'créer mon compte',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextFormField(
                        controller: _textControlleur,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'entre votre nom',
                        ),
                        validator: (String? value) {
                          print('value $value');
                          return value!.isEmpty
                              ? 'field required'
                              : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                                  ? 'invalid format'
                                  : null;
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: _prenomControlleur,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'entre votre prenom',
                        ),
                        validator: (String? value) {
                          print('value $value');
                          return value!.isEmpty
                              ? 'field required'
                              : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                                  ? 'invalid format'
                                  : null;
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _adresseControlleur,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Adresse email',
                      ),
                      validator: (String? value) {
                        print('value $value');
                        return value!.isEmpty
                            ? 'field required'
                            : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)
                                ? 'invalid format'
                                : null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _siretControlleur,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Siret',
                      ),
                      validator: (value) {
                        print('value $value');
                        return value!.isEmpty
                           ? 'field required'
                            : !RegExp(r'^[0-9]{14}$').hasMatch(value)
                                ? 'invalid format'
                               : null;
                       },
                    ),
                    Visibility(
                      visible: isNotValisiret,
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Email Invalide",
                                  style: TextStyle(color: Colors.red)))),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _codenafControlleur,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'N° Naf code',
                      ),
                      validator: (value) {
                        print('value $value');
                        return value!.isEmpty
                            ? 'field required'
                            : !RegExp(r'^[0-9]+\.[0-9]+[a-zA-Z]+')
                                    .hasMatch(value)
                                ? 'invalid format'
                                : null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: _raisonControlleur,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Raison social',
                        ),
                        validator: (String? value) {
                          print('value $value');
                          return value!.isEmpty
                              ? 'field required'
                              : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                                  ? 'invalid format'
                                  : null;
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: _respControlleur,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Responsable',
                        ),
                        validator: (String? value) {
                          print('value $value');
                          return value!.isEmpty
                              ? 'field required'
                              : !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                                  ? 'invalid format'
                                  : null;
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _loginControlleur,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //  hintText: 'Responsable',
                        hintText: 'login',
                      ),
                      validator: (String? value) {
                        print('value $value');
                        return value!.isEmpty
                            ? 'field required'
                            : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)
                                ? 'invalid format'
                                : null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: _isPasswordVisible,
                      controller: _motpasseControlleur,
                      validator: (value) {
                        print('value $value');
                        return value!.isEmpty ? 'password required' : null;
                      },
                      decoration: InputDecoration(
                        suffix: InkWell(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                              print(_isPasswordVisible);
                            },
                            child: Icon(Icons.visibility)),
                        border: OutlineInputBorder(),
                        hintText: 'mot passe',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: _isconfirmPasswordVisible,
                      controller: _confirmControlleur,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'confirme mot passe',
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              _isconfirmPasswordVisible =
                                  !_isconfirmPasswordVisible;
                            });
                            print(_isconfirmPasswordVisible);
                          },

                          child: Icon(Icons.visibility),
                          //onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                          //},
                        ),
                      ),
                      validator: (value) {
                        print('value $value');
                        return value!.isEmpty ? 'password required' : null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  String domain = _adresseControlleur.text.substring(
                      _adresseControlleur.text.indexOf('@') + 1,
                      _adresseControlleur.text.lastIndexOf('.'));

                  showDialog(
                      context: context,
                      builder: (context) {
                        return CompanyDialog(
                            //  isValidEmail: !unprofessioalEmails.contains(domain),

                            );
                      });
                }
              },
              child: InkWell(
                onTap: () {
                  if (_motpasseControlleur.text == _confirmControlleur.text) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Acceuil()));
                  } else {
                    print('erreur');
                  }
                },
                child: InkWell(
                  onTap: () async {

                    if ((_textControlleur.text.isEmpty) ||
                     (_prenomControlleur.text.isEmpty) ||
                     (_adresseControlleur.text.isEmpty) ||
                     (_siretControlleur.text.isEmpty) ||
                     (_codenafControlleur.text.isEmpty) ||
                     (_raisonControlleur.text.isEmpty) ||
                     (_respControlleur.text.isEmpty) ||
                     (_loginControlleur.text.isEmpty) ||
                     (_motpasseControlleur.text.isEmpty) ||
                     (_confirmControlleur.text.isEmpty)){
                      showErrorMessage(context);
                     }
                     else{
                      io.File selected = io.File(this.url_img);

                    await authController
                        .registerUser(
                            _textControlleur.text,
                            _prenomControlleur.text,
                            _adresseControlleur.text,
                            _siretControlleur.text,
                            _codenafControlleur.text,
                            _raisonControlleur.text,
                            _respControlleur.text,
                            _loginControlleur.text,
                            _motpasseControlleur.text,
                            _confirmControlleur.text,
                            selectedImage)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage())));
                     }



                 
                    
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    // height: MediaQuery.of(context).size.width * .15,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        border: Border.all(color: buttonColor),
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Créer un compte",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Déja  inscrit(e)  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }),
                  child: Text(
                    "s'identifier",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: buttonColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    await _displayPickImageDialog(context!,
        (double? maxWidth, double? maxHeight, int? quality) async {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );

        print(pickedFile?.path);
        this.url_img = pickedFile!.path;
        setState(() {
          _setImageFileListFromFile(pickedFile);
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    });
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'image'),
                child: const Text('image'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'video'),
                child: const Text('video'),
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
