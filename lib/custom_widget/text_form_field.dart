import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  // final Widget suffixIcon;
  // final bool suffixIconTap;
  final String error;
  final TextInputType keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.multiline,
    required this.obscureText,
    this.enabled = true,
    //this.suffixIcon = Icon(Icons.ac_unit) ,
    // this.suffixIconTap,
    this.error = '',
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? _obscureText;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        primaryColor: ConstantColors.backgroundColor,
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: _obscureText ?? false,
        controller: widget.controller,
        enabled: widget.enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: ConstantColors.textFieldColor.withOpacity(0.12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: ConstantColors.textFieldColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: ConstantColors.textFieldColor.withOpacity(0.12),
              width: 1.0,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xffbcbcbc),
          ),
          //errorText: widget.error,
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff575757),
        ),
        cursorColor: ConstantColors.backgroundColor,
        cursorWidth: 1,
      ),
    );
  }
}
