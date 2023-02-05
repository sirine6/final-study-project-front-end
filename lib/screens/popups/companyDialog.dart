
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../dashbord.dart';

class CompanyDialog extends StatelessWidget {
 //bool isValidEmail;

  CompanyDialog({


    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: const EdgeInsets.symmetric(horizontal: 90),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: buttonColor,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Info",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              const SizedBox(height: 15),
            
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
               // child: Text(
                  //isValidEmail?
                  
                //  "Votre Email est valid": "votre email n'est pas validé") 
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        
                   
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('loading...')),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_)=>Dashboard())
                          );
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (context) => Dashboard()));
                        
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: buttonColor),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Confirmer"),
                          )),
                    ),
                    TextButton(
                      child: const Text(
                        "Fermer",
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
 
      