import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Utils/EndPointApi.dart';
import '../login.dart';

class RegisterController extends GetxController{
   TextEditingController firstnameController = TextEditingController();
   TextEditingController lastnameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
   Future<void>Register()async{
      try{
         var Headers={'content-type':'application/json'};
         var urlIntegration=Uri.parse(
             ApiEndPoints.BaseUrl+ApiEndPoints.AllPropertyApi.Register);
         Map body={
            'first_name':firstnameController.text,
            'last_name' :lastnameController.text,
            'email':emailController.text.trim(),
            'password':passwordController.text

         };
         http.Response responseRegister=
         await http.post(urlIntegration,body:jsonEncode(body),headers:Headers);

         if(responseRegister.statusCode==200){
            final json = jsonDecode(responseRegister.body);
            print("body is:$json");
            final SharedPreferences preferences=await _prefs;
            Get.off(Login());

         }else {
            throw jsonDecode(responseRegister.body)["message"]??"error";

         }

      }catch(e){
         Get.back();
         showDialog(context: Get.context!,
             builder: (context){
            return SimpleDialog(
               title: Center(child: Text("The email has already been taken.")),
               
            );
         });
      }
   }
}