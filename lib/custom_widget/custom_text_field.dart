import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Icon? icon,suffixIcon;
  String? hintText;
  var obscTextTrue;
  var validation;
  var onSave;
  var controller;
  CustomTextField({Key? key,this.icon,
    this.suffixIcon,
    this.controller,
    this.hintText,
    this.onSave,
    this.validation,
    this.obscTextTrue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        obscureText: obscTextTrue,
        validator: validation,
        controller: controller,
        onSaved: onSave,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.5)),
            prefixIcon: icon,
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.black,
            prefixIconColor: Colors.black,
            border: InputBorder.none
        ),
      );
  }
}
