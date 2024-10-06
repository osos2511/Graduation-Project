import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

import 'Controllers/GetAllPropertyByLocationControllers.dart';
import 'Widgets/CustomSearchBar.dart';
import 'Widgets/PropertyList.dart';

class SearchPageAdmin extends StatefulWidget {
  const SearchPageAdmin({super.key});
  @override
  State<SearchPageAdmin> createState() => _SearchPageAdminState();
}
class _SearchPageAdminState extends State<SearchPageAdmin> {
  final formKey = GlobalKey<FormState>();
  //final searchController = TextEditingController();
  GetAllPropertiesByLocation getByLocation=Get.put(GetAllPropertiesByLocation());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ClipRRect(
            borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: AppBar(
              toolbarHeight: 100,
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      Navigator.of(context).pushNamed("Bottomnavigatbar");
                      //     builder: (context) =>
                      //     const BottomNavigatorBarAdmin()));
                      // searchController.searchNameController.clear();
                      // searchController.searchAreaController.clear();
                      // searchController.searchNameController.clear();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Color(0xffFFFFFF),
                    ));
              }),
              title: SearchWidget(
                controller: getByLocation.SearchController,
                searchFunction: () {
                  setState(() {
                    getByLocation.fetchAllPropertiesByLocation();
                  });
                },
              ),
              backgroundColor: Color(0xff400076),
              centerTitle: true,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.blueAccent])),
          height: 720,
          width: 450,
          child: ListView.builder(
              itemCount: getByLocation.x,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    PropertyList(
                    image: getByLocation.list?[index]['image'],
                price: getByLocation.list?[index]['price'],
                bedrooms: getByLocation.list?[index]['number_of_bedrooms'],
                bathrooms: getByLocation.list?[index]['number_of_bathrooms'],
                area: getByLocation.list?[index]['area'],
                location: getByLocation.list?[index]['location'],),

                    const SizedBox(height: 10,),
                  ],
                );
              }),
        ));
  }
}
