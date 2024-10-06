import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/Controllers/EditProfile.dart';

import 'Controllers/GetProfile.dart';
import 'Widgets/AddApartmentWidget.dart';

class profileInfo extends StatefulWidget {
  const profileInfo({super.key});

  @override
  State<profileInfo> createState() => _profileInfoState();
}

class _profileInfoState extends State<profileInfo> {
  @override
  File? selectedImage;
  GetProfile getprofile=Get.put(GetProfile());
  EditProfile editProfile = Get.put(EditProfile());

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  String? userImage;

  @override
  Widget build(BuildContext context) {
    firstName.text = getprofile.firstName.text;
    lastName.text = getprofile.lastName.text;
    email.text = getprofile.email.text;

    return  Scaffold(

      appBar: AppBar(backgroundColor: Colors.indigo,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back),),
        title: Text("معلومات الحساب", style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body: Container(
        height: 900,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.blueAccent])),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Stack(
                          children:[
                            selectedImage!=null?
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:FileImage(selectedImage!),
                            ):

                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                 // Optional border
                              ),
                              child: ClipOval(

                                child:
                                getprofile.userImage==null?Image.asset("images/4.jpg",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ):
                                Image.network(

                                  "https://semsark.xyz/storage/app/public/${getprofile.userImage}",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                            ),

                            Positioned(child: IconButton(onPressed: (){
                              _pickImageFromGallery();
                            },
                              icon: Icon(Icons.add_a_photo),
                            ),
                              right: 10,
                              bottom: -4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                    CustomAddApartment(
             HintText:"الاسم الاول",
             controller: firstName,

                    ),
                    const SizedBox(
            height: 30,
                    ),
                    CustomAddApartment(
            HintText:"الاسم الاخير",
            controller: lastName,
                    ),
                    const SizedBox(
            height: 30,
                    ),
                    CustomAddApartment(
            HintText:"البريد الالكتروني",
            controller:email,
                    ),
                    const SizedBox(
            height: 60,
                    ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      editProfile.firstName.text = firstName.text;
                      editProfile.lastName.text = lastName.text;
                      editProfile.email.text = email.text;


                      editProfile.editProfile();
                      //print(getprofile.firstName.text);
                      getprofile.fetchAllProfileData();
                    }
                    , child: Text("حفظ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple
                    ),
                  ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  width: 200,
                  height: 50,
                ),
                    ]
                    ),
          ),
      ),
    )
    );
  }
  Future _pickImageFromGallery() async{
    final returnedImage =await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage=File(returnedImage!.path );
      editProfile.userImage = returnedImage.path ;
      // getprofile.UserImage.text=selectedImage as String;
    });
  }
}
