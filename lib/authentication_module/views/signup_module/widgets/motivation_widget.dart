import 'package:flutter/material.dart';
import '../../../../constants/constant_colors.dart';

class MotivationWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final String subtitle;

  final String img;

  final bool isSelected;

  MotivationWidget({
    required this.isSelected,
    required this.onclick,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onclick,
      child: Container(
        height: mediaData.height * 0.1,
        width: mediaData.width * 0.9,
        child: Card(
          color: isSelected
              ? ConstantColors.gradientSecond.withOpacity(0.8)
              : null,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  //change color based on your need
                  child: Image.asset(img),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Colors.white
                                : ConstantColors.backgroundColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                            fontSize: 10,
                            color: isSelected
                                ? ConstantColors.tablerowText
                                : ConstantColors.clickTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
