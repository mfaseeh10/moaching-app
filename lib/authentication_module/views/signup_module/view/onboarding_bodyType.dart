import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/signup_module/widgets/bodyTypeWidget.dart';
import 'package:moaching_app/authentication_module/views/signup_module/widgets/goal_widget.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button.dart';

import '../widgets/motivation_widget.dart';

enum bodyType {
  athletic,
  normal,

}

class OnboardingBodyTypeScreen extends StatefulWidget {
  const OnboardingBodyTypeScreen({Key? key}) : super(key: key);

  @override
  _OnboardingBodyTypeScreenState createState() => _OnboardingBodyTypeScreenState();
}

class _OnboardingBodyTypeScreenState extends State<OnboardingBodyTypeScreen> {
  bodyType? selected = bodyType.athletic;
  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;
    return Scaffold(

      // backgroundColor: ConstantColors.backgroundColor,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: mediaData.height,
                child: Align(
                  child: Image.asset(
                    'images/topleftcircle.png',
                    height: 150,
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Container(
                height: mediaData.height,
                child: Align(
                  child: Image.asset(
                    alignment: Alignment.bottomRight,
                    'images/bottomrightcircle.png',
                    height: 250,
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
              Container(
                height: mediaData.height,
                width: mediaData.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Body Type',
                      style: TextStyle(
                        color: ConstantColors.backgroundColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                Container(
                  height: mediaData.height * 0.55,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(child: Image.asset('images/body-mdpi.png')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BodyTypeWidget(
                      isSelected: bodyType.athletic == selected,
                      onclick: () {
                        selected = bodyType.athletic;
                        setState(() {});
                      },
                      title: "Athletic",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BodyTypeWidget(
                      isSelected: bodyType.normal == selected,
                      onclick: () {
                        selected = bodyType.normal;
                        setState(() {});
                      },
                      title: "Normal",
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomColoredButton(
                      showCircle: false,
                      label: 'Next',
                      mediaData: mediaData,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NowScreen_2()));
                      },
                    ),
                  ],
                ),
              ),
              AppBar(
                elevation: 0, backgroundColor: Colors.transparent, //
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ));
  }
}
