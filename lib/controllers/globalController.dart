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



class GlobalController {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }

  Future<List<Account>?> getAllAccounts() async {
    String? token = await getToken();

    int id  = await getID();

    final response = await http.get(
      Uri.parse(
          'http://192.168.1.15:9092/api/Users/getUsersByCompanie?id=$id&pageNo=0&pageSize=8'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed.map<Account>((item) => Account.fromJson(item)).toList();
    } else {
    }
  }

  Future<bool?> addUser(
      String name_user,
      String first_name,
      String login,
      String pwd,
      String confirmPassword,
      String address,
      String email,
      String phone,
      XFile? file,
      int id) async {
    String? token = await getToken();
   
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("http://192.168.1.15:9092/api/Users/addUserr?id=$id"),
    );

    print(file!.path);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);

    request.files.add(multipartFile);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);

    request.fields["name_user"] = name_user;
    request.fields["first_name"] = first_name;
    request.fields["login"] = login;
    request.fields["pwd"] = pwd;
    request.fields["confirmPassword"] = confirmPassword;
    request.fields["address"] = address;
    request.fields["email"] = email;
    request.fields["phone"] = phone;

    // *******************************
    // request.fields["email"] = email;
    // request.fields['users'] = jsonEncode(<String,int>{
    //   "id":3
    // });


    // **************************






    // print("pwd of "+pwd);
    http.StreamedResponse response = await request.send();

  }

  Future<void> supprimerUser(int id) async {
    String? token = await getToken();
    http.Response response = await http.delete(
      Uri.parse('http://192.168.1.15:9092/api/Users/deleteUser?id=$id'),
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

  Future<bool?> ModifierUserr(
      String firstname,
      String email,
      int id,
      XFile? file) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("put",
        Uri.parse("http://192.168.1.15:9092/api/Users/updatewithparam?id=$id"));

    print(file!.path);
    

    String? token = await getToken();

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    
    };
    request.headers.addAll(headers);

    request.files.add(multipartFile);

    /*Map<String,String> data = {
    "first_name": first_name,
    "email": email,
   
    
    };*/
    request.fields["email"] = email;
    request.fields["firstname"] = firstname;

    //request.fields.addAll(data);
    http.StreamedResponse response = await request.send();

  }

   Future<void> ActiverUser( int id) async {
    String? token = await getToken();
    http.Response response = await http.put(
      Uri.parse('http://192.168.1.15:9092/api/Users/Active?id=$id'),
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
 Future<void> bloquerUser( int id) async {
    String? token = await getToken();
    http.Response response = await http.put(
      Uri.parse('http://192.168.1.15:9092/api/Users/Bloque?id=$id'),
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
  Future <String?> getNbUser(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Users/getNBRUsers?id=$id'),
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
Future <String?> getNbUserA(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Users/getNBRuserA?id=$id'),
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
Future <String?> getNbUserB(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Users/getNBRuserB?id=$id'),
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
Future <String?> getNbUserd(int id)async{
    String? token = await getToken();
  final response = await http.get(Uri.parse('http://192.168.1.15:9092/api/Users/getNBRuserEnAttenteDeValidation?id=$id'),
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

   Future<bool?> addPublicationPhoto(
      String status,
      XFile? file,
      int id) async {
        int id = await getID();
    String? token = await getToken();
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("http://192.168.1.15:9092/api/Pub/addPubI"),
    );

    print(file!.path);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);

    request.files.add(multipartFile);

    Map<String, String> headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);

  

    // *******************************
    //  request.fields["status"] = status;
     request.fields["publicationsDto"] = jsonEncode(<String,dynamic>{
      "status":status,
      "users":jsonEncode(<String,int>{
       "id":id
    }),
      
     });
    //  request.fields['users'] = jsonEncode(<String,int>{
    //    "id":id
    // });
    http.StreamedResponse response = await request.send();

    log(response.statusCode.toString());
   
  }



}
