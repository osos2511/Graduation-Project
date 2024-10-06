import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountWidget extends StatefulWidget {
  final String? label;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback onClicked;
  const MyAccountWidget(
      {Key? key,
        this.label,
        this.prefixIcon,
        this.suffixIcon,
        required this.onClicked,
      }) : super(key: key);

  @override
  State<MyAccountWidget> createState() => _MyAccountWidgetState();
}

class _MyAccountWidgetState extends State<MyAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          leading: widget.prefixIcon,
          title:Text(widget.label ?? "" , style: TextStyle(fontSize: 20),),
          trailing:widget.suffixIcon,
          onTap: widget.onClicked
        ),
      ),
    );
  }
}
