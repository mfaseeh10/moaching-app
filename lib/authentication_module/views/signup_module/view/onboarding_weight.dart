import 'package:flutter/material.dart';

import '../../../../constants/constant_colors.dart';
import '../../../../custom_widget/custom_colored_button.dart';

class OnboardingWeightScreen extends StatelessWidget {
  OnboardingWeightScreen({Key? key}) : super(key: key);
  TextEditingController weightInput = TextEditingController();
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
                      'Your Weight?',
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
                                  controller: weightInput,
                                  //editing controller of this TextField
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter Weight",
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
                              Text('KG')
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
