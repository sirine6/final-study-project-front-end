import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CompanyController{

  Future<String> getCompanyName(String email)async{
  http.Response companyName = await http.post(
    
    
   Uri.parse('http://192.168.1.23:9092/api/api/auth/testNomEmail'),
    body: jsonEncode(<String, String>{"email": email,}),
   
   );
  return companyName.body;
  }


Future <String?>  getForgetPassword(String email)async{

  final response = await http.get(Uri.parse('http:// Gestion de :9092/api/api/auth/forget-password/verifCodeOTP?email='+email),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
     
      },);
      

     return response.body;
}


Future <String?>  getConfirm(String otp)async{

  final response = await http.get(Uri.parse('http:// Gestion de :9092/api/api/auth/forget-password/confirm-otp?otp='+otp),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
     
      },);
      
    
   
     return response.body;
}
Future <String?>  getConfirme(String  otp, String pwd)async{

  final response = await http.put(Uri.parse('http:// Gestion de :9092/api/api/auth/forget-password?otp='+otp.toString()),
  headers :{
       'Content-Type': 'application/json',
      'Accept': 'application/json',
      
      },
         body: jsonEncode(<String, String>{
      "otp":otp, 
      "pwd":pwd
     
      }),);
      
 
     return response.body;
}


}
