import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class YourMacronuber extends StatefulWidget {
  const YourMacronuber({Key? key}) : super(key: key);

  @override
  _YourMacronuberState createState() => _YourMacronuberState();
}

class _YourMacronuberState extends State<YourMacronuber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Text("Your Macro Numbers",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(""),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                    color: Color(0xff3A9090),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "03 Aprile 2022",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 13.0,
                percent: 1.0,
                center: new Text(
                  "Energy Percentage",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff3A9090),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                progressColor: Color(0xff3A9090),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("  "),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Proteins")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xff3A9090),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Proteins")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xff3A9090),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Proteins")
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Latle"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Protein"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Goal"),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("15g"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("9.95 %"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("0%"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("15g"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("9.95 %"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("0%"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("15g"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("9.95 %"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("0%"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
