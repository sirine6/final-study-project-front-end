import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/models/accountModel.dart';
import 'package:sirin/utils/colors.dart';

import '../models/DossierCompetence.dart';

class DossierController {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }

  Future<void> addDossier(
      String name,
      String mail,
      String phone,
      String date,
      List<String> poste,
      List<String> skills,
      List<String> experiences,
      List<String> languages,
      List<String> ecole) async {
    String? token = await getToken();
    int id = await getID();

    http.Response response = await http.post(
      Uri.parse(
          'http://192.168.1.15:9092/api/CompetenceFiles/addCompetencesFiles'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "mail": mail,
        "phone": phone,
        "date": date,
        "poste": poste,
        "skills": skills,
        "experiences": experiences,
        "languages": languages,
        "ecole": ecole,
        "user": id
      
      }),
    );

    if (response.statusCode == 200) {
    } else {
    }
  }

  
  
Future<List<DossierCompetenceModel>?> getdossierAll()async{

   String? token = await getToken();
       int id = await getID();
    final response =await http.get(Uri.parse("http://192.168.1.15:9092/api/CompetenceFiles/getMine?id=$id"),
    headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);

    if(response.statusCode==200){
   final parsed=json.decode(response.body);
  return  parsed.map<DossierCompetenceModel>((item)=>DossierCompetenceModel.fromJson(item)).toList();
  
   }

      else{

      }

}

  Future<List<DossierCompetenceModel>?> getdetails() async {
    String? token = await getToken();
    int id = await getID();
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.15:9092/api/CompetenceFiles/getCompetencesFilesID?id=$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
  
      final parsed = json.decode(response.body);
      return parsed
          .map<DossierCompetenceModel>(
              (item) => DossierCompetenceModel.fromJson(item))
          .toList();
    } else {
  
    }
  }
    Future<void> supprimerDossier(int id) async {
    String? token = await getToken();
      // int id = await getID();
    http.Response response = await http.delete(
      Uri.parse('http://192.168.1.15:9092/api/CompetenceFiles/deleteCompetencesFiles?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
    } else {
    }
    }
 Future<void> ModifierDossier(
    
      String name,
      String mail,
      String phone,
      String date,
      List<String> poste,
      List<String> skills,
      List<String> experiences,
      List<String> languages,
      List<String> ecole) async {
    String? token = await getToken();
    int id = await getID();

    http.Response response = await http.post(
      Uri.parse(
          'http://192.168.1.15:9092/api/CompetenceFiles/addCompetencesFiles?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "mail": mail,
        "phone": phone,
        "date": date,
        "poste": poste,
        "skills": skills,
        "experiences": experiences,
        "languages": languages,
        "ecole": ecole,
        "user": id
      
      }),
    );

    if (response.statusCode == 200) {
    } else {
    }
  }
   Future<void> Acceptcv(int idService,int idcomp ) async {
    String? token = await getToken();
     int id = await getID();
    http.Response response = await http.delete(
      Uri.parse('http://192.168.1.15:9092/api/CompetenceFiles/AcceptCV?idService=$idService&idcomp=$idcomp'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
    } else {
      log("erreur status est : ${response.statusCode}");
    }
  }
    Future<void> Reffusercv(int idService,int idcomp ) async {
    String? token = await getToken();
     int id = await getID();
    http.Response response = await http.delete(
      Uri.parse('http://192.168.1.15:9092/api/CompetenceFiles/AcceptCV?idService=$idService&idcomp=$idcomp'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
    } else {
      log("erreur status est : ${response.statusCode}");
    }
  }





}
