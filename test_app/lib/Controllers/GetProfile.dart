
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../Utils/EndPointApi.dart';
import '../Controllers/LoginControllers.dart';

class GetProfile {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  String? userImage;
  LoginController loginController = Get.put(LoginController());

  Future<void> fetchAllProfileData() async {
    try {
      var urlIntegration = Uri.parse(ApiEndPoints.BaseUrl + ApiEndPoints.AllPropertyApi.GetProfile);

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginController.token}',
      };

      http.Response response = await http.get(urlIntegration, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == true) {
          var profileData = json['data'];

          // Update text controllers with profile data
          firstName.text = profileData['first_name'];
          lastName.text = profileData['last_name'];
          email.text = profileData['email'];
          userImage = profileData['user_image'];

          // Handle user_image if needed (assuming it's a file path or URL)
          // Example: userImage = File(profileData['user_image']);

          //print('Profile information retrieved successfully');
          //print(response.body);
          print(profileData);
        } else {
          print('Error: ${json['message']}');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
