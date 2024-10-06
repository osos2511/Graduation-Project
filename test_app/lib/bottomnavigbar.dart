
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Favourite.dart';
import 'HomePage.dart';
//import 'addApartment.dart';
import 'myAccount.dart';

class bottomnavigatbar extends StatefulWidget {
  const bottomnavigatbar({super.key});
  @override
  State<bottomnavigatbar> createState() => _bottomnavigatbarState();
}
class _bottomnavigatbarState extends State<bottomnavigatbar> {
  final screens =[
    myAccount(),
    //Apartment(),
    Fav(),
    HomePage(),
  ];
  final items =[Icon(Icons.person,size: 30,),
    //Icon(Icons.add,size: 30,),
    Icon(Icons.favorite,size: 30,),
    Icon(Icons.home,size: 30,),
  ];
  int index =2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CurvedNavigationBar(
        items: items,
        index: index,
        color: Colors.white,
        onTap: (selectedIndex){
          setState(() {
            index=selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screens[index],
    );
  }
}
