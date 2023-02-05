import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirin/models/CommentaireModel.dart';


import '../models/MesPubb.dart';
import '../models/Publication.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/colors.dart';

class PublicationControlleur {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myToken = prefs.getString('cle');
    return myToken;
  }

  Future<List<PublicationModel>?> getpubAll() async {
    String? token = await getToken();

    final response = await http.get(
      Uri.parse(
          "http://192.168.1.15:9092/api/Pub/getAllPub?pageNo=0&pageSize=4"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed
          .map<PublicationModel>((item) => PublicationModel.fromJson(item))
          .toList();
    } else {}
  }

  Future<void> addPost(String status, int id) async {
    String? token = await getToken();

    http.Response response = await http.post(
      Uri.parse('http://192.168.1.15:9092/api/Pub/addPub'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "status": status,
        "users": {"id": id}
      }),
    );
    if (response.statusCode == 200) {
    } else {}
  }

  Future<void> aimer(int pubId, int userId) async {
    String? token = await getToken();
    http.Response response = await http.post(
      Uri.parse('http://192.168.1.15:9092/api/Aime/aime'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{"pubId": pubId, "userId": userId}),
    );
    if (response.statusCode == 200) {}
  }

  Future<void> aimerpas(int id, int idP) async {
    String? token = await getToken();
    http.Response response = await http.post(
      Uri.parse('http://192.168.1.15:9092/api/Aime/aimepas?id=$id&idP=$idP'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{"id": id, "idP": idP}),
    );
    if (response.statusCode == 200) {}
  }

  Future<String?> getNbaimer(int id) async {
    String? token = await getToken();
    final response = await http.get(
      Uri.parse('http://192.168.1.15:9092/api/Aime/getNBRAime?id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {}
  }

  Future<void> addCommentaire(int pubId, int userId, String text) async {
    String? token = await getToken();
    http.Response response = await http.post(
      Uri.parse('http://192.168.1.15:9092/api/Comment/add'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          <String, dynamic>{"pubId": pubId, "userId": userId, "text": text}),
    );
    // log("${response.statusCode}");
    if (response.statusCode == 200) {}
  }

  Future<List<CommentaireModel>?> getNbcommenter(int id, int pageSize, int pageNo) async {//hadhie hya cc
    String? token = await getToken();
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.15:9092/api/Comment/getCommentaires?pageNo=$pageNo&pageSize=$pageSize&id=$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<CommentaireModel>((item) => CommentaireModel.fromJson(item)).toList();

    }
  }

  Future<List<Mespubb>?> getMesPub() async {
    String? token = await getToken();
    int id = await getID();
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.15:9092/api/Pub/getMesPub?pageNo=0&pageSize=4&id=1226"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Mespubb>((item) => Mespubb.fromJson(item)).toList();
    } else {}
  }
}
