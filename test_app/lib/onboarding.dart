
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Controllers/GetAllPropertybyType.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {
  Widget dotpageview(){
    return Builder(builder: ((context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i=0; i<3; i++)
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              width: i == pagenumber ? 25: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: i == pagenumber ? Colors.white : Colors.yellow,
              ),
            ),
        ],
      );
    }));
  }
  PageController nextpage = PageController();
  int pagenumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        onPageChanged: (value){
          setState(() {
            pagenumber = value;
          });
        },
        controller: nextpage,
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.fill ,
                  image: AssetImage("images/1.jpg" )
              ),
            ),
            child: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 6,
                    ),

                    Text("SMSAR" , style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff221F1E)
                    ),),
                    Text("K" , style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.greenAccent,
                    ),),
                    Spacer(
                      flex: 3,
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("Login");

                        },
                        child: Text("تخطي",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                Spacer(
                  flex: 4
                ),
                Center(
                  child: Text("FIND YOUR" , style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.yellow,
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("PERFECT " , style: TextStyle(
                      color: Colors.yellow,
                        fontSize: 15,
                        fontWeight:FontWeight.w500
                    ),),
                    Text("PLACE" , style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight:FontWeight.w500
                    ),),
                  ],
                ),
                Spacer(
                  flex: 4,
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 270),
                  child: InkWell(
                    onTap: (){
                      nextpage.animateToPage(1,
                          duration:Duration(milliseconds:400 ),
                          curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:const Icon(Icons.arrow_forward , size: 30),
                      ),
                    )
                  ),
                ),
                dotpageview(),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit:BoxFit.fill ,
                  image: AssetImage("images/2.jpg" )
              ),
            ),
            child: Column(
              children: [
                Spacer(
                  flex: 10,
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 270),
                  child: InkWell(
                      onTap: (){
                        nextpage.animateToPage(2,
                            duration:Duration(milliseconds:400 ),
                            curve: Curves.easeIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child:const Icon(Icons.arrow_forward , size: 30),
                        ),
                      )
                  ),
                ),
                dotpageview(),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit:BoxFit.fill ,
                  image: AssetImage("images/3.jpg" )
              ),
            ),
            child:  Column(
              children: [
                Spacer(
                  flex: 10,
                ),
                Padding(
                  padding:const EdgeInsets.only(bottom: 60),
                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("Login");
                      },
                     child: Container(
                       width: 150,
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.yellow,
                       ),
                       child: Center(
                         child: Text("ابدأ الان" , style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w900,
                           fontSize: 20
                         ),),
                       ),
                     ),
                  ),
                ),
                dotpageview(),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

