import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/login_module/widgets/widgets.dart';
import 'package:moaching_app/authentication_module/views/signup_module/view/onboarding_goal_screen.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button.dart';

import '../../../../workout_module/views/now_screen/now_screen_2.dart';
import '../bloc/bloc.dart';
import '../widgets/motivation_widget.dart';

enum motivation { not_active, slightly_active, active, very_active }

class OnboardingMotivationScreen extends StatefulWidget {
  const OnboardingMotivationScreen({Key? key}) : super(key: key);

  @override
  _OnboardingMotivationScreenState createState() =>
      _OnboardingMotivationScreenState();
}

class _OnboardingMotivationScreenState
    extends State<OnboardingMotivationScreen> {
  motivation? selected = motivation.not_active;
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
                      'What motivates you?',
                      style: TextStyle(
                        color: ConstantColors.backgroundColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    MotivationWidget(
                      img: 'images/notParticularlyActive.png',
                      isSelected: motivation.not_active == selected,
                      onclick: () {
                        selected = motivation.not_active;
                        setState(() {});
                      },
                      title: "Not particularly active",
                      subtitle: "I want to be more confident in myself",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MotivationWidget(
                      img: 'images/slightlyactive.png',
                      isSelected: motivation.slightly_active == selected,
                      onclick: () {
                        selected = motivation.slightly_active;
                        setState(() {});
                      },
                      title: "Slightly active",
                      subtitle: "I want to be respected, appreciated and loved",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MotivationWidget(
                      img: 'images/active.png',
                      isSelected: motivation.active == selected,
                      onclick: () {
                        selected = motivation.active;
                        setState(() {});
                      },
                      title: "Active",
                      subtitle: "I want to feel energetic, fit and healthy",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MotivationWidget(
                      img: 'images/veryactive.png',
                      isSelected: motivation.very_active == selected,
                      onclick: () {
                        selected = motivation.very_active;
                        setState(() {});
                      },
                      title: " Very active",
                      subtitle: "I want to be and look stronger",
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomColoredButton(
                      showCircle: false,
                      label: 'Next',
                      mediaData: mediaData,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnboardingGoalScreen()));
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
