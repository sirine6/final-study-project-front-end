import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sirin/models/accountModel.dart';

import 'package:sirin/utils/colors.dart';

import '../controllers/globalController.dart';
import '../screens/popups/ModifierUser.dart';

class DetailsBoxFront extends StatefulWidget {
  PagedItems user;
  Function? onClick;
  String name;
  String job;
  bool isEnabled;
  Uint8List imageCode;

  DetailsBoxFront({
    Key? key,
    this.onClick,
    required this.name,
    required this.job,
    required this.isEnabled,
    required this.imageCode,
    required this.user,
  }) : super(key: key);

  @override
  State<DetailsBoxFront> createState() => _DetailsBoxFrontState();
}

class _DetailsBoxFrontState extends State<DetailsBoxFront> {
  GlobalController _controller = GlobalController();

  late int idUser;
  @override
  void initState() {
    super.initState();

    idUser = widget.user.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: size.width *.55,
          height: size.width *.7,
          decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const IconButton(
                          onPressed: null,
                          icon: FaIcon(
                            null,
                            color: Colors.white,
                          )),

                      InkWell(
                        onTap: () {
                          widget.onClick!();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: buttonColor.withOpacity(0.7),
                              border: Border.all(
                                  color: buttonColor.withOpacity(0.7)),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              "Details",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                      //  Spacer(),
                      PopupMenuButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.ellipsisVertical,
                          color: Colors.white,
                        ),
                        onSelected: (value) {
                          print(value);
                          // your logic
                        },
                        itemBuilder: (BuildContext bc) {
                          return [
                            PopupMenuItem(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ModifierUser()));
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ModifierUser(
                                                  user: widget.user,
                                                )));
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.edit),
                                      const SizedBox(width: 12),
                                      const Text("modifier"),
                                    ],
                                  ),
                                )),
                            PopupMenuItem(
                              child: InkWell(
                                onTap: (() async {
                                  await _controller
                                      .supprimerUser(idUser)
                                      .then((value) => {
                                            setState(() {}),
                                            Navigator.of(context).pop(),
                                          });
                                }),
                                child: Row(
                                  children: [
                                    const Icon(Icons.delete),
                                    const SizedBox(width: 12),
                                    const Text("Supprimer")
                                  ],
                                ),
                              ),
                            ),

                            // widget.isEnabled?

                            PopupMenuItem(
                                onTap: () async {
                                  await _controller
                                      .bloquerUser(idUser)
                                      .then((value) => {
                                            setState(() {}),
                                          });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: CustumSnackebarContent(
                                      etat: "warning !",
                                      textsucces: "user bloqued",
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  ));
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.abc),
                                    const SizedBox(width: 12),
                                    const Text("Désactiver")
                                  ],
                                )),
                            PopupMenuItem(
                                onTap: () async {
                                  await _controller.ActiverUser(idUser)
                                      .then((value) => {
                                            setState(() {}),
                                          });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: const CustumSnackebarContent(
                                      etat: "congratulations !",
                                      textsucces: "user activated successfully",
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  ));

                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.check),
                                    const SizedBox(width: 12),
                                    const Text("Activer")
                                  ],
                                ))
                          ];
                        },
                      )

                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 33,
                            height: 33,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: MemoryImage(widget.imageCode),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            widget.job,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            "Actif",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green),
                          ),
                          const Expanded(child: const SizedBox()),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      print("email");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const FaIcon(FontAwesomeIcons.envelope),
                                        const Text("Email")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    print("Appel");
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      FaIcon(FontAwesomeIcons.phone),
                                      Text("Appel")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CustumSnackebarContent extends StatelessWidget {
  const CustumSnackebarContent({
    required this.textsucces,
    required this.etat,
    Key? key,
  }) : super(key: key);
  final String textsucces;
  final String etat;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(const Radius.circular(20))),
          child: Row(children: [
            const SizedBox(
              width: 48,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(etat,
                      style: const TextStyle(fontSize: 18, color: Colors.white)),
                  const Spacer(),
                  Text(
                    textsucces,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ])),
    
      Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: Icon(
              Icons.bubble_chart_outlined,
              color: primaryColor,
              size: 40,
            ),
          )),
      Positioned(
        top: -20,
        left: 0,
        child: Stack(alignment: Alignment.center, children: [
          Icon(
            Icons.bubble_chart_rounded,
            color: primaryColor,
            size: 50,
          ),
          const Positioned(
              top: 10,
              right: 10,
              child: const Icon(Icons.close, color: Colors.white, size: 15))
        ]),
      ),
    ]);
  }
}

// hathi partie back mt3 carte ***********

class DetailsBoxBack extends StatelessWidget {
  Function? onClick;

  String name;
  String job;

  String email;
  String phone;
  String age;
  Uint8List imageCode;

  DetailsBoxBack(
      {Key? key,
      this.onClick,
      required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.job,
      required this.imageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * .4,
        height: size.width * .6,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              const BoxShadow(
                color: Colors.black,
                blurRadius: 8,
              )
            ]),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                onClick!();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(FontAwesomeIcons.circleArrowLeft),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 33,
                      height: 33,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: MemoryImage(imageCode), fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      job,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${age} ans",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
