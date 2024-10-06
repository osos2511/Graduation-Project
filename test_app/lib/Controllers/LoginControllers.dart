import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Utils/EndPointApi.dart';
import '../bottomnavigbar.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
  var token;
  Future<void>Login()async{
    try{
      var Headers={'content-type':'application/json'};
      var urlIntegration=Uri.parse(
          ApiEndPoints.BaseUrl+ApiEndPoints.AllPropertyApi.Login);
      Map body={
        'email':emailController.text.trim(),
        'password':passwordController.text

      };
      http.Response responseRegister=
      await http.post(urlIntegration,body:jsonEncode(body),headers:Headers);

      if(responseRegister.statusCode==200){
        final json = jsonDecode(responseRegister.body);
        print("body is:$json");
        token=json['token'];
        final SharedPreferences preferences=await _prefs;
        Get.off(bottomnavigatbar());
      }else {
        throw jsonDecode(responseRegister.body)["message"]??"error";

      }

    }catch(e){
      Get.back();
      showDialog(context: Get.context!,
          builder: (context){
            return SimpleDialog(
              title: Center(child: Text("Email or password do not match our records")),

            );
          });
    }
  }
}