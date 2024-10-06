
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextAlign? textAlign;

  const TextFormFieldWidget(
      {Key? key,
        this.controller,
        this.label,
        this.hint,
        this.prefixIcon,
        this.suffixIcon,
        this.suffix,
        this.obscureText,
        this.textAlign,
        this.validator})
      : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText??false,
      validator: widget.validator,
      style:const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      cursorHeight: 30,
      keyboardType: TextInputType.name,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2,
                color: Colors.deepPurple
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        focusColor: Colors.deepPurple,
        prefixIcon: widget.prefixIcon,
        suffixIcon:widget.suffixIcon,
        suffixIconColor: Colors.black,
        hintText:widget.hint,
        labelStyle:const TextStyle(color:Colors.black ),
        border:const OutlineInputBorder(
            borderSide: BorderSide(width: 4,color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),

      ),
    );
  }
}
