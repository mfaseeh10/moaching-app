import 'package:flutter/material.dart';
import '../../../../constants/constant_colors.dart';

class BodyTypeWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String title;

  final bool isSelected;

  BodyTypeWidget({
    required this.isSelected,
    required this.onclick,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onclick,
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        height: mediaData.height * 0.06,
        width: mediaData.width * 0.7,
        child: Card(
          color: isSelected
              ? ConstantColors.gradientSecond.withOpacity(0.8)
              : ConstantColors.tablehead.withOpacity(0.85),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        color: isSelected
                            ? Colors.white
                            : ConstantColors.clickTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
