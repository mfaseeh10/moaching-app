import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class CustomLabelWithTitle extends StatelessWidget {
  const CustomLabelWithTitle({
    Key? key,
    required this.mediaData,
    required this.label,
  }) : super(key: key);

  final Size? mediaData;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
          height: mediaData!.height * 0.04,
          width: mediaData!.width * 0.4,
          decoration: const BoxDecoration(
            color: ConstantColors.gradientSecond,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
          ),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  label!,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )),
              ],
            ),
          )),
    );
  }
}
