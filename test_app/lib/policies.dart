import 'package:flutter/material.dart';
class aboutus extends StatelessWidget {
  const aboutus({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Text(" gk ",
          style: TextStyle(fontSize: 16,color: Colors.white),textAlign: TextAlign.right,),
      ),
    );
  }
}
