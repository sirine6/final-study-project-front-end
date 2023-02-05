import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sirin/controllers/PublicationControlleur.dart';
import 'package:sirin/controllers/globalController.dart';
import 'package:sirin/models/Publication.dart';
import 'package:sirin/utils/colors.dart';
import 'package:sirin/widgets/reaction_buttons.dart';


import '../models/MesPubb.dart';

class MesPub extends StatefulWidget {
  @override
  _MesPubState createState() => _MesPubState();
}

class _MesPubState extends State<MesPub> {
  PublicationControlleur publicationControlleur = PublicationControlleur();
  GlobalController globalController = GlobalController();
  bool isLiked = false;
  late List<int> listOfLikedPosts;
  GetStorage box = GetStorage();

  @override
  void initState() {
   
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Mespubb>?>(
      future: publicationControlleur.getMesPub(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(
                child: Text("Loading"),
              )
            : ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: InkWell(
                             
                              child: Container(
                                width: 33,
                                height: 33,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: MemoryImage(
                                          base64Decode(snapshot
                                                  .data![index].users!.picture ??
                                              ""),
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            title: Text(
                              '${snapshot.data![index].users!.firstName}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${snapshot.data![index].startDate}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("${snapshot.data![index].status}"),
                          ),
                          snapshot.data![index].image == null
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.memory(
                                    base64Decode(
                                        snapshot.data![index].image ?? ""),
                                  ),
                                ),
                          
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}




