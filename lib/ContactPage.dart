import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'Widgets/AddApartmentWidget.dart';
class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.indigo,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back),),
        title: Text("تواصل معنا", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blueAccent])),


        child: Column(

          children: [
           Spacer(flex: 1,),

            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              width: 340,
              height: 70,
              child: ElevatedButton.icon(

                  onPressed: () async {
                    String smsurl = 'sms:01067079970?body=Hello Smsark!';
                    if (await canLaunchUrlString(smsurl)) {
                      launchUrlString(smsurl);
                    } else {
                      print("can't launch $smsurl");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      WidgetStatePropertyAll(Colors.white)),
                  icon: const Icon(Icons.sms,color: Colors.black,size: 25,),
                  label: const Text('Send SMS',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              width: 340,
              height: 70,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    String telurl = 'tel:01067079970';
                    if (await canLaunchUrlString(telurl)) {
                      launchUrlString(telurl);
                    } else {
                      print("can't launch $telurl");
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  icon: const Icon(Icons.call,color: Colors.black,size: 25,),
                  label: const Text('Make CALL',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              width: 340,
              height: 70,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    String subject = 'Sending a Mail';
                    String body = "Hello Smsark!";
                    String emailurl =
                        'mailto:smsarkapp46@gmail.com?subject=$subject&body=$body';
                    if (await canLaunchUrlString(emailurl)) {
                      launchUrlString(emailurl);
                    } else {
                      print("can't launch $emailurl");
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  icon: const Icon(Icons.forward_to_inbox,color: Colors.black,size: 25,),
                  label: const Text('Send MAIL',style: TextStyle(fontSize: 18,color: Colors.black),),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              width: 340,
              height: 70,
              child: ElevatedButton.icon(
                onPressed: () async {
                  String facebookUrl = 'https://www.facebook.com/groups/800499218876507/?ref=share&mibextid=NSMWBT'; // Replace with your Facebook page URL
                  if (await canLaunchUrlString(facebookUrl)) {
                    launchUrlString(facebookUrl);
                  } else {
                    print("Can't launch $facebookUrl");
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                icon: Icon(Icons.facebook, color: Colors.black, size: 25), // Assuming you have a Facebook icon
                label: Text(
                  'Visit Facebook',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),


            SizedBox(height: 20,),

            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              width: 340,
              height: 70,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    String latitude = '42.3540';
                    String longitude = '71.0586';
                    String geourl = 'geo:$latitude,$longitude';
                    if (await canLaunchUrlString(geourl)) {
                      launchUrlString(geourl);
                    } else {
                      print("can't launch $geourl");
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  icon: const Icon(Icons.near_me,color: Colors.black,size: 25,),
                  label: const Text('LOCATION',style: TextStyle(fontSize: 18,color: Colors.black),)),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("SMSARK",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ],

            ),

        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("FIND YOUR PERFECT PLACE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ],

        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Released in 2025",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
              ],

            ),
            Spacer(flex: 1,),
      ]
      )
          )
    );



  }
}

