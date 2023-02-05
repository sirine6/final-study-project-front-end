import 'dart:convert';
import 'dart:developer';

import 'dart:async';
import 'dart:io' as f;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/models/emai.dart';
import 'package:sirin/models/userModel.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class AuthController {
  void saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cle', token ?? "");
  }

  saveId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
  }


  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }

  void saveEmail(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', token ?? "");
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('email');
    return myToken;
  }

  Future<UserModel?> loginUser(String email, String password) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.1.15:9092/api/api/auth/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"login": email, "pwd": password}),
      );
      log(response.statusCode.toString());


      if (response.statusCode == 200) {
        await prefs.setString("email", email);

        var result = json.decode(response.body);
        UserModel currentUser = UserModel.fromJson(result);

        await saveId(currentUser.id??0);

        return UserModel.fromJson(result);
      }
    } catch (e) {
    }
  }

  Future<bool?> registerUser(
      String name_user,
      String first_name,
      String email,
      String siret,
      String confirmPassword,
      String responsable,
      String naf_code,
      String login,
      String pwd,
      String social_reason,
       XFile? file) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.1.15:9092/api/api/auth/Stepsignup"));

    print(file!.path);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);

    request.files.add(multipartFile);

    request.fields["name_user"] = name_user;
    request.fields["first_name"] = first_name;
    request.fields["email"] = email;
    request.fields["siret"] = siret;
    request.fields["naf_code"] = naf_code;
    request.fields["social_reason"] = social_reason;
    request.fields["responsable"] = responsable;
    request.fields["login"] = login;
    request.fields["pwd"] = pwd;
    request.fields["confirmPassword"] = confirmPassword;

    http.StreamedResponse response = await request.send();

  }

  Future<EmailModel?> getemaill(String email) async {
    String? token = await getToken();

    final response = await http.get(
      Uri.parse(
          'http://192.168.1.15:9092/api/Users/getbyemaill?email=' + email),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
      return EmailModel.fromJson(json.decode(response.body));
    }
  }
}
