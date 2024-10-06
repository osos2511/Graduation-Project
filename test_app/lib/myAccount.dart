
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'Controllers/GetProfile.dart';
import 'Controllers/LoginControllers.dart';
import 'Widgets/MyAccountWidget.dart';

class myAccount extends StatefulWidget {
  const myAccount({super.key});
  @override
  State<myAccount> createState() => _myAccountState();
}
class _myAccountState extends State<myAccount> {
  LoginController loginController=Get.put(LoginController());
  int selectedIndex = 0;
  var width , height;
  GetProfile profile=Get.put(GetProfile());

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
      return  Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.blueAccent])),
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              children: [



                MyAccountWidget(onClicked: (){
                  profile.fetchAllProfileData();
                Navigator.of(context).pushNamed("profileinfo");
                },suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.person) ,label:"معلومات الحساب" ,),
                const SizedBox(
                height: 15,),
                MyAccountWidget(onClicked: (){
                  Navigator.of(context).pushNamed("Contact");
                },suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.phone) ,label:"تواصل معنا" ,),
                const SizedBox(
                  height: 15,
                ),
                MyAccountWidget(onClicked: (){
                  Navigator.of(context).pushNamed("Aboutus");
                },suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.info) ,label:"معلومات عنا" ,),

                const SizedBox(
                  height: 15,
                ),
                MyAccountWidget(onClicked: (){},suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.rate_review) ,label:"تقييمك" ,),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: ListTile(
                      leading:const Icon(Icons.language),
                      title:const Text("اللغة", style: TextStyle(fontSize: 20),),
                      trailing:const Text("العربية",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      ),
                      onTap: (){},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyAccountWidget(onClicked: (){},suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.privacy_tip) ,label:"الخصوصية والأمان" ,),

                const SizedBox(
                  height: 15,
                ),
                MyAccountWidget(onClicked: (){
                  loginController.emailController.clear();
                  loginController.passwordController.clear();
                  Navigator.of(context).pushReplacementNamed("Login");
                },suffixIcon: const Icon(Icons.arrow_forward_ios), prefixIcon:const Icon(Icons.logout) ,label:"تسجيل الخروج" ,),
              ],
            ),
          ),
        ),
      );
  }

}
