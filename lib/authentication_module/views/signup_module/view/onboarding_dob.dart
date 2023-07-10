import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/constant_colors.dart';
import '../../../../custom_widget/custom_colored_button.dart';

class OnboardingDOBScreen extends StatefulWidget {
  const OnboardingDOBScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingDOBScreen> createState() => _OnboardingDOBScreenState();
}

class _OnboardingDOBScreenState extends State<OnboardingDOBScreen> {
  TextEditingController dateInput = TextEditingController();

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
                      height: 20,
                    ),
                    Text(
                      'How old are you?',
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
                      child: Center(
                          child: TextField(
                        controller: dateInput,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Enter Date",
                          labelStyle:
                              TextStyle(color: ConstantColors.clickTextColor),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                                width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                                width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        readOnly: true,

                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            setState(() {
                              dateInput.text = formattedDate;
                            });
                          } else {}
                        },
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
