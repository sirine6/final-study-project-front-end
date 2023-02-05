import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/utils/colors.dart';

import '../models/MesPrestation.dart';
import '../models/PrestationModel.dart';
import '../models/Publication.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PrestationControlleur {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }


 Future<List<dynamic>?> getprestationAll() async {
    String? token = await getToken();

    final response = await http.get(
      Uri.parse(
          "http://192.168.1.21:9092/api/Demande/getAlldem?pageNo=0&pageSize=4"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', 
      },
    );

     if (response.statusCode == 200) {
      //print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // log("********* ${json.decode(response.body)}");
      List<dynamic> newData = List<dynamic>.from(json.decode(response.body));
      return newData;
      
    } else {
    }
  }
  Future<PrestationModel?> ajouterPrestation(String title, String description,
      String link, String start_date, String closing_date) async {
    String? token = await getToken();
    int id = await getID();
    http.Response response = await http.post(
      Uri.parse('http://192.168.1.21:9092/api/Demande/addSer'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "title": title,
        "description": description,
        "link": link,
        "start_date": start_date,
        "closing_date": closing_date,
        "users":{
          "id":id,
        }
      }),
    );

print(response.body);
    if (response.statusCode == 200) {
    } else {
      log("erreur status est : ${response.statusCode}");
    }
  }


  Future<void> affectationGroupe(List<Map<String,int>> listOfRoles,List<Map<String,int>> listOfUsers,int groupeID)async{
    String? token = await getToken();


    http.Response response = await http.put(Uri.parse("http://192.168.1.21:9092/api/Groups/affectation"),
     headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },

      body: jsonEncode(<String,dynamic>{
        "id":groupeID,
        "roles":listOfRoles,
        "users":listOfUsers,

      })
    
    );
    log("response status of api Affectation Groupe ${response.statusCode}");
    


  }

  Future<List<dynamic>?> getMesPrest() async {
    String? token = await getToken();
    int id = await getID();
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.15:9092/api/Demande/getMesDem?pageNo=0&pageSize=4&id=1226"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // log("********* ${json.decode(response.body)}");
      List<dynamic> newData = List<dynamic>.from(json.decode(response.body));
      return newData;
    } else {}
  }
  Future<List<dynamic>?> getMesPostules() async {
    String? token = await getToken();
    int id = await getID();
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.15:9092/api/Demande/getMesPostule?pageNo=0&pageSize=4&id=3"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // log("********* ${json.decode(response.body)}");
      List<dynamic> newData = List<dynamic>.from(json.decode(response.body));
      return newData;
    } else {}
  }



}
