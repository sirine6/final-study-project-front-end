import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sirin/Component/listview.dart';
import 'package:sirin/controllers/PublicationControlleur.dart';
import 'package:sirin/controllers/globalController.dart';
import 'package:sirin/models/CommentaireModel.dart';
import 'package:sirin/models/Publication.dart';
import 'package:sirin/utils/colors.dart';
import 'package:sirin/widgets/reaction_buttons.dart';

class Pub extends StatefulWidget {
  @override
  _PubState createState() => _PubState();
}

class _PubState extends State<Pub> {
  PublicationControlleur publicationControlleur = PublicationControlleur();
  GlobalController globalController = GlobalController();
  bool isLiked = false;
  late List<int> listOfLikedPosts;
  GetStorage box = GetStorage();
  bool areCommentsHidden = true;
  @override
  void initState() {
   
    super.initState();
    if (box.read('likes') == null){
      listOfLikedPosts = [];
    }
    else{
      listOfLikedPosts = List<int>.from(box.read('likes') as List);

      
   
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PublicationModel>?>(
      future: publicationControlleur.getpubAll(),
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
                          const SizedBox(
                            height: 45,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: ()async{
                                    int id = await getID();
                                    await publicationControlleur.aimer(snapshot.data![index].id??0, id).then((value) => {
                                      setState((){
                                        isLiked = !isLiked;
                                        if (listOfLikedPosts.contains(snapshot.data![index].id??0)){
                                          listOfLikedPosts.remove(snapshot.data![index].id??0);
                                        }
                                        else{
                                          listOfLikedPosts.add(snapshot.data![index].id??0);
                                          
                                        }
                                        
                                      }),
                                      box.write('likes', listOfLikedPosts),
                                    });
                                    
                                  },
                                  child: ReactionButtons(
                                      text: "J'aime",
                                      icon: FaIcon(FontAwesomeIcons.solidHeart,
                                      color: listOfLikedPosts.contains(snapshot.data![index].id??0)?Colors.red:Colors.black,
                                      
                                      ),
                                      
                                      ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(context: context, builder: (_){
                                      TextEditingController controller = TextEditingController();
                                      return Dialog(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            children: [
                                              TextFormField(
                                                controller: controller,
                                                decoration: InputDecoration(
                                                  hintText: 'Commentaire'
                                                ),
                                              ),
                                              ElevatedButton(onPressed: ()async{
                                                await getID().then((value)  async => {
                                                await publicationControlleur.addCommentaire(snapshot.data![index].id??0, value, controller.text).then((value) => {
                                                  Navigator.of(context).pop()
                                                }),

                                                });


                                              }, child: Text("Commenter"))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  child: ReactionButtons(
                                      text: "Commenter",
                                      icon:
                                          const FaIcon(FontAwesomeIcons.comment)),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: dividerColor,
                            indent: 5,
                            endIndent: 5,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FutureBuilder<String?>(
                                  future: publicationControlleur.getNbaimer(snapshot.data![index].id??0),
                                  builder: (context, snapshot) {
                                    return 

                                    !snapshot.hasData?
                                    SizedBox():
                                    
                                    
                                    Text(
                                      "${snapshot.data} aime ça",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    );
                                  }
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: (){
                                   setState(() {
                                    areCommentsHidden = !areCommentsHidden;
                                  });
                                },
                                child: Row(children: [
                                  Text("0 commentaires ", //ba3d hadhie
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                  const Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ]),
                              ),
                             
                            ],
                          ),
                           Visibility(
                            visible: !areCommentsHidden,
                             child: LimitedBox(maxHeight: 100,
                                maxWidth: 200,
                                child: FutureBuilder<List<CommentaireModel>?>(
                                  future
                                  : publicationControlleur.getNbcommenter(snapshot.data![index].id??0,4,0), // 3addihom hne tra
                                  builder: (context, snap) {
                                    return 
                           
                                    !snap.hasData?
                                    Text("Loading"):
                                    
                                    
                                    ListView.builder(
                                      itemCount: snap.data!.length,
                                      itemBuilder: (_,index){
                                        return Text("${snap.data![index].text}");
                                      },
                                
                                    );
                                  }
                                ),
                                
                                
                                ),
                           )
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

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Image.asset(
            'images/user.png',
            width: 45,
            height: 45,
          ),
          title: const Text(
            'ahmed ',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            '16/06/2022 ',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("Monde!"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/food.jpg'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: dividerColor,
          indent: 5,
          endIndent: 5,
          thickness: 2,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}


// await publicationController.addPost(........).then((value) => {********})

// CODE INSIDE THEN EVENT ***************

/*


setsState((){})

Navigator.of(context).pop();




*/

// CODE INSIDE THEN EVENT ***************
