import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/signup_module/view/onboarding_weight.dart';

import '../../../../constants/constant_colors.dart';
import '../../../../custom_widget/custom_colored_button.dart';

class OnboardingHeightScreen extends StatefulWidget {
  const OnboardingHeightScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingHeightScreen> createState() => _OnboardingHeightScreenState();
}

class _OnboardingHeightScreenState extends State<OnboardingHeightScreen> {
  TextEditingController heightInput = TextEditingController();

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Your Height?',
                      style: TextStyle(
                        color: ConstantColors.backgroundColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ConstantColors.gradientSecond
                                    .withOpacity(0.8),
                                style: BorderStyle.solid),
                          ),
                          width: mediaData.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //color: Colors.amber,
                                width: mediaData.width * 0.3,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: heightInput,
                                  //editing controller of this TextField
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter Height",
                                    labelStyle: TextStyle(
                                        color: ConstantColors.clickTextColor),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  onTap: () {},
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('CM')
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30,
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
                                    OnboardingWeightScreen()));
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
