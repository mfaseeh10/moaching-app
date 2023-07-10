import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/login_module/widgets/widgets.dart';
import 'package:moaching_app/authentication_module/views/signup_module/view/oboarding_motivation.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button.dart';

import '../../../../workout_module/views/now_screen/now_screen_2.dart';
import '../bloc/bloc.dart';

enum gender { male, female }

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({Key? key}) : super(key: key);

  @override
  _GenderSelectScreenState createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  gender? selected = gender.female;

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
                    Text(
                      'Are you?',
                      style: TextStyle(
                        color: ConstantColors.backgroundColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: mediaData.height * 0.5,
                      child: Row(
                        children: [
                          Expanded(
                              child: GenderWidget(
                            img: 'images/malepng.png',
                            onclick: () {
                              selected = gender.male;

                              setState(() {});
                            },
                            isSelected: gender.male == selected,
                            title: 'Male',
                            icon: Icons.male,
                          )),
                          Expanded(
                              child: GenderWidget(
                            img: 'images/femalepng.png',
                            isSelected: gender.female == selected,
                            onclick: () {
                              selected = gender.female;
                              setState(() {});
                            },
                            title: 'Female',
                            icon: Icons.female,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomColoredButton(
                      showCircle: false,
                      label: 'Next',
                      mediaData: mediaData,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OnboardingMotivationScreen()));
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
