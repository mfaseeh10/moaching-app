import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class CustomColoredButton extends StatelessWidget {
  const CustomColoredButton(
      {Key? key,
      required this.mediaData,
      required this.onTap,
      required this.label,
      this.showCircle})
      : super(key: key);

  final Size? mediaData;
  final void Function()? onTap;
  final String? label;
  final bool? showCircle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
          height: mediaData!.height * 0.06,
          width: kIsWeb ? mediaData!.width * 0.30 : mediaData!.width,
          decoration: const BoxDecoration(
            color: ConstantColors.clickTextColor,
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
                Container(
                  child: showCircle!
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Container(),
                )
              ],
            ),
          )),
    );
  }
}
