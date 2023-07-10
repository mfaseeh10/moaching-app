import 'package:flutter/material.dart';

import '../../../custom_widget/custom_navigation_bar.dart';
import '../../utils/style.dart';
import '../flat_db_bench_press/flat_db_bench_press_5.dart';

class TrainingResultScreen_2 extends StatefulWidget {
  const TrainingResultScreen_2({Key? key}) : super(key: key);

  @override
  _TrainingResultScreenState createState() => _TrainingResultScreenState();
}

class _TrainingResultScreenState extends State<TrainingResultScreen_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: new AssetImage("images/module_one_image.PNG"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(
                    "New",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: Color(0xff3A9090),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "03-04-2022 21:17",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duration",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          "00:02:34",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Current Duration",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("00:01:18", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rest Time",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          "00:00:30",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Wasted Time",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("00:00:00", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ExcirsesScreen()));
                          },
                          child: Text("No of Excirses Perform",
                              style: TextStyle(
                                color: Color(0xff3A9090),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Text(
                          "1 Excirses (s)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Total Weight",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("33 kg", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No of Skipped",
                            style: TextStyle(
                              color: Color(0xff3A9090),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          "0 Exercise",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrainingResultScreen_5()));
                  },
                  child: Container(
                    height: 45,
                    width: 180,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.13),
                    decoration: BoxDecoration(
                      color: AppColor.appBackGroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Exit",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
