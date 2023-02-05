import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/utils/colors.dart';

import '../models/Group.dart';

class ApiGroup {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }

  Future<List<Groups>?> getAll() async {
    String? token = await getToken();
    int id = await getID();
    final response = await http.get(
      Uri.parse('http://192.168.1.15:9092/api/Groups/getGroups'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
 
      final parsed = json.decode(response.body);
      return parsed.map<Groups>((item) => Groups.fromJson(item)).toList();
    } else {
 
    }
  }

  Future<void> addGroup(String name, String description, int id) async {
    String? token = await getToken();
      int id = await getID();
    http.Response response = await http.post(
      Uri.parse('http://192.168.1.15:9092/api/Groups/addGroup?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          <String, dynamic>{"name_grp": name, "desc_grp": description}),
    );
    if (response.statusCode == 200) {
    } else {
    }
  }


  Future<void> ModierGroup( String name, String description,int id) async {
    String? token = await getToken();
    http.Response response = await http.put(
      Uri.parse('http://192.168.1.15:9092/api/Groups/updateGroup'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
       body: jsonEncode(
          <String, dynamic>{
            "name_grp": name,
             "desc_grp": description,
             "id":id}),
      
    );
    if (response.statusCode == 200) {
    } else {
      log("erreur status est : ${response.statusCode}");
    }
  }
   Future<void> supprimerGroupe(int id) async {
    String? token = await getToken();
    http.Response response = await http.delete(
      Uri.parse('http://192.168.1.15:9092/api/Groups/deleteGroup?id=$id'),
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
   Future <String?> getNbGroupe(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Groups/getNBRGroup?id=$id'),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);
      
    
    if (response.statusCode == 200) {
    return response.body;
    } else {
      log("erreur status est 1234 : ${response.statusCode}");
    }
}
Future <String?> getNbGroupeA(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Groups/getNBRGroupA?id=$id'),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);
      
    
    if (response.statusCode == 200) {
    return response.body;
    } else {
      log("erreur status est 1234 : ${response.statusCode}");
    }
}
Future <String?> getNbGroupeD(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Groups/getNBRGroupD?id=$id'),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);
      
    
    if (response.statusCode == 200) {
    return response.body;
    } else {
      log("erreur status est 1234 : ${response.statusCode}");
    }
}
  
}
