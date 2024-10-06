import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomAddApartment extends StatefulWidget {
  String? HintText;
  IconData? iconData;
  int? MaxLines;
  final TextEditingController? controller;
   CustomAddApartment({Key? key,this.HintText,this.iconData,this.MaxLines,this.controller}):super(key:key);

  @override
  State<CustomAddApartment> createState() => _CustomAddApartmentState();
}

class _CustomAddApartmentState extends State<CustomAddApartment> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style:TextStyle(
        color: Colors.white,
      ),
      maxLength: widget.MaxLines,
      keyboardType: TextInputType.text,
      cursorHeight: 25,
      cursorColor: Colors.black,
      textAlign: TextAlign.end,
      decoration:  InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: Colors.white,
                width: 1.5
            )
        ),

        focusColor: Colors.white,
        hintText: widget.HintText,
        prefixIcon: Icon(widget.iconData ,color: Colors.white,),
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),

      ),
    );
  }
}
