import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../Utils/EndPointApi.dart';
import '../Controllers/LoginControllers.dart';

class EditProfile {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  String? userImage;
  LoginController loginController = Get.put(LoginController());

  Future<void> editProfile() async {
    try {
      var urlIntegration = Uri.parse(ApiEndPoints.BaseUrl + ApiEndPoints.AllPropertyApi.EditProfile);

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginController.token}',
      };

      var body = jsonEncode({
        'data':{ "first_name": firstName.text,
          "last_name": lastName.text,
          "email": email.text,
          "user_image": userImage,}

      });

      http.Response response = await http.post(urlIntegration, headers: headers, body: body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == true) {
          var profileData = json['data'];

          // Update text controllers with profile data
          firstName.text = profileData['first_name'];
          lastName.text = profileData['last_name'];
          email.text = profileData['email'];
          userImage = profileData['user_image'];

          print("Profile updated successfully: $profileData");
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
