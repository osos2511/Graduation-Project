import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/BedRoomsPage.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/profileInfo.dart';
import 'package:test_app/typeResults.dart';
import 'AreaPage.dart';
import 'ContactPage.dart';
import 'Favourite.dart';
import 'HomePage.dart';
import 'PriceView.dart';
import 'Signup.dart';
import 'aboutus.dart';
//import 'addApartment.dart';
import 'bottomnavigbar.dart';
import 'login.dart';
import 'myAccount.dart';
import 'onboarding.dart';
import 'searchPage.dart';
import 'splashScreen.dart';

void main() async {
  Get.put(FavoritesController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        "fav": (context) => Fav(),
        "Login": (context) => Login(),
        "Signup": (context) => Signup(),
        "onboarding": (context) => Onboarding(),
        "homepage": (context) => HomePage(),
        "myaccount": (context) => myAccount(),
        "Contact": (context) => ContactUs(),
        //"addapartment":(context)=>Apartment(),
        "Aboutus": (context) => aboutus(),
        // "propertydetails":(context)=>PropertyDetails(),
        "splashscreen": (context) => intro(),
        "Bottomnavigatbar": (context) => bottomnavigatbar(),
        "searchPage": (context) => SearchPageAdmin(),
        "priceview": (context) => Priceview(),
        "TypeResults": (context) => Typeresults(),
        "BedRooms": (context) => BedRoomsview(),
        //"Policies":(context)=>policies(),
        //"Conditions":(context)=>condition(),
        "areaPage": (context) => AreaPage(),
        "profileinfo": (context) => profileInfo(),
      },
      home: intro(),
      debugShowCheckedModeBanner: false,
    );
  }
}
