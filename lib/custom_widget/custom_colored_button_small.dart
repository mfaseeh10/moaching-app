import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class CustomColoredButtonSmall extends StatelessWidget {
  const CustomColoredButtonSmall({
    Key? key,
    required this.mediaData,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final Size? mediaData;
  final void Function()? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
          height: mediaData!.height * 0.06,
          width: mediaData!.width * 0.6,
          decoration: const BoxDecoration(
            color: ConstantColors.gradientSecond,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  label!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )),
    );
  }
}
