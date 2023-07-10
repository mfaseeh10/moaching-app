import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/workout_module/views/training_program/widgets/custom_text_field.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key,required this.onChange, required this.controller,required this.onTap}) : super(key: key);

  final TextEditingController controller;
  final void Function()? onTap;
final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CustomTextField(

        onTap: onTap,
        controller: controller,
        contentPadding: const EdgeInsets.all(12.0),
        isDense: false,
        suffixIcon: Icons.search,

        isEraseable: true,
        suffixIconColor: ConstantColors.gradientSecond.withOpacity(0.8),
        suffixIconSize: 20,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        border:OutlineInputBorder(
          borderSide: BorderSide(
            color: ConstantColors.gradientSecond.withOpacity(0.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ConstantColors.gradientSecond.withOpacity(0.8),
          ),
        ),
        onChange: onChange
      ),
    );
  }
}