import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChanged , this.hintText,this.inputType, required this.pass}) ;
  Function(String)? onChanged;
  bool pass ;
  TextInputType? inputType;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide()
          ) ,
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide()
          ) ,
          hintText: hintText ),
    )
    ;
  }
}
