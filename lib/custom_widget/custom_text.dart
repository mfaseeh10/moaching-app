import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double size;
  TextOverflow? textOverflow;
  var underLine;
  FontWeight? bold;
  var fontFamily;


  CustomText({required this.text, this.color =const Color(0xff332d2b),
    this.textOverflow,
    this.bold,
    this.size = 0,
    this.underLine,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize:size==0? 20:size,
        fontWeight: bold,
        decoration: underLine,
      ),
    );
  }
}
