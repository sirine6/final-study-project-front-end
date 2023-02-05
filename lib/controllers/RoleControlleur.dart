import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/models/userModel.dart';

import '../models/Group.dart';
import '../models/Role.dart';

import '../models/emai.dart';
import '../utils/colors.dart';



class ApiRole
{
   Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }
  Future<List<RoleModel>?> getRoleAll() async{

   String? token = await getToken();
    final response =await http.get(Uri.parse("http://192.168.1.15:9092/api/Roles/getAllRoles"),
    headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);

    if(response.statusCode==200){
   final parsed=json.decode(response.body);
  return  parsed.map<RoleModel>((item)=>RoleModel.fromJson(item)).toList();
  
   }

      else{

      }
   
    }
     Future<void> ActiverRole( int id) async {
    String? token = await getToken();
    http.Response response = await http.put(
      Uri.parse('http://192.168.1.15:9092/api/Roles/Active?id=$id'),
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
Future<void> DesactiverRole( int id) async {
    String? token = await getToken();
    
    http.Response response = await http.put(
      Uri.parse('http://192.168.1.15:9092/api/Roles/Desactive?id=$id'),
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
  Future <String?> getNbRole()async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Roles/getNBRole'),
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
   Future <String?> getNbRoleA()async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Roles/getNBRoleA'),
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
  Future <String?> getNbRoled()async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Roles/getNBRoleD'),
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

Future<List<RoleModel>?> getActiveRole()async{

   String? token = await getToken();
    final response =await http.get(Uri.parse("http://192.168.1.15:9092/api/Roles/getAllRolesActive"),
    headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);

    if(response.statusCode==200){
   final parsed=json.decode(response.body);
  return  parsed.map<RoleModel>((item)=>RoleModel.fromJson(item)).toList();
  
   }

      else{

      }

}
Future<List<Users>?> getallUser()async{
  int id = await getID();
   String? token = await getToken();

    final response =await http.get(Uri.parse("http://192.168.1.15:9092/api/Users/getAllUsers?id=$id"),
    headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      },);
     

    if(response.statusCode==200){
   final parsed=json.decode(response.body);
  return  parsed.map<Users>((item)=>Users.fromJson(item)).toList();

   }

      else{

      }

}

  }