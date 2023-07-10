import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTransparentButton extends StatelessWidget {
  const CustomTransparentButton(
      {Key? key,
      required this.mediaData,
      required this.onTap,
      required this.label,
      required this.color,
      this.iconData})
      : super(key: key);

  final Size? mediaData;
  final void Function()? onTap;
  final String? label;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
          height: mediaData!.height * 0.08,
          width: kIsWeb ? mediaData!.width * 0.30 : mediaData!.width * 0.2,
          child: InkWell(
            onTap: onTap,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(iconData, size: 42, color: color),
                Text(
                  label!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            )),
          )),
    );
  }
}
