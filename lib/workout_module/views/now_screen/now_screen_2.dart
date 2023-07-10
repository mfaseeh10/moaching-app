import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_1.dart';

import '../training _result/training_result_screen_new.dart';

class NowScreen_2 extends StatefulWidget {
  const NowScreen_2({Key? key}) : super(key: key);

  @override
  _NowScreenState createState() => _NowScreenState();
}

class _NowScreenState extends State<NowScreen_2> {
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
                    Icon(
                      Icons.clear,
                      size: 20,
                    ),
                    Text("Now",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(""),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // FlatDbScreen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FlatDbScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: new AssetImage("images/now_screen_image.PNG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Flate FB Bench Press"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.play_circle_outline,
                              size: 15,
                              color: Color(0xff3A9090),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 mints",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Without Equipment",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Icon(Icons.done, color: Color(0xff3A9090))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              InkWell(
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DietPlanScreenone()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrainingResultScreen_2()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: Color(0xff3A9090),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
