
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'onboarding.dart';

class intro extends StatelessWidget {
  const intro({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 4000,
      splash: Column(
      children: [
        Center(
          child: LottieBuilder.asset("Lottie/zTacR0Gzdu.json"),
        ),
        Text("SMSARK",style: TextStyle(fontSize: 35,color: Color(0xff0000FF),fontWeight: FontWeight.bold),),
        Text("Find Your Perfect Place",style: TextStyle(fontSize: 25,color: Color(0xff0000FF),fontWeight: FontWeight.w700),),
        ],
    ), nextScreen: Onboarding(),splashIconSize: 600,backgroundColor: Color(0xffFFFFFF),);
  }
}
