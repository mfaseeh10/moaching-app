import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/signup_module/widgets/goal_widget.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button.dart';

import '../widgets/motivation_widget.dart';

enum goal {
  lose_weight,
  maintain_weight,
  gain_weight,
}

class OnboardingGoalScreen extends StatefulWidget {
  const OnboardingGoalScreen({Key? key}) : super(key: key);

  @override
  _OnboardingGoalScreenState createState() => _OnboardingGoalScreenState();
}

class _OnboardingGoalScreenState extends State<OnboardingGoalScreen> {
  goal? selected = goal.lose_weight;
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
                      'Your Goal?',
                      style: TextStyle(
                        color: ConstantColors.backgroundColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    GoalWidget(
                      isSelected: goal.lose_weight == selected,
                      onclick: () {
                        selected = goal.lose_weight;
                        setState(() {});
                      },
                      title: "Lose weight",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GoalWidget(
                      isSelected: goal.maintain_weight == selected,
                      onclick: () {
                        selected = goal.maintain_weight;
                        setState(() {});
                      },
                      title: "Maintain weight",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GoalWidget(
                      isSelected: goal.gain_weight == selected,
                      onclick: () {
                        selected = goal.gain_weight;
                        setState(() {});
                      },
                      title: "Gain weight",
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
