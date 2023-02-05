import 'package:flutter/material.dart';
import 'package:sirin/models/Group.dart';
import 'package:sirin/models/accountModel.dart';

import '../../controllers/AfficheGroupe.dart';
import '../../utils/colors.dart';

class Detailgroup extends StatefulWidget {
  Groups groups;

  Detailgroup({required this.groups, Key? key}) : super(key: key);

  @override
  State<Detailgroup> createState() => _DetailgroupState();
}

class _DetailgroupState extends State<Detailgroup> {

  ApiGroup _apiGroup = ApiGroup();
  late int idGroupe;
  @override
  void initState() {
    super.initState();

    idGroupe = widget.groups.id ?? 0;
   
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      width: 50,
      height: 280,
      child: Wrap(children: [
        Column(
          children: [
            Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Details Groupe',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
              ExpansionTile(title: Text('Roles'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.groups.roles!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.groups.roles![index].nameRoles}");
                },
              ),
            ),
          ]),
            const SizedBox(
              height: 15,
            ),
              ExpansionTile(title: Text('Users'), children: [
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.groups.users!.length,
                itemBuilder: (_, index) {
                  return Text("● ${widget.groups.users![index].firstName}");
                },
              ),
            ),
          ]),
           
          ],
        )
      ]),
    ));
  }
}
