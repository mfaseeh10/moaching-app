import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/diet_plans/diet_plan_screen_two.dart';

import '../../utils/style.dart';

class DietPlanScreenone extends StatefulWidget {
  const DietPlanScreenone({Key? key}) : super(key: key);

  @override
  _DietPlanScreenoneState createState() => _DietPlanScreenoneState();
}

class _DietPlanScreenoneState extends State<DietPlanScreenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Diet Plans",
            style: TextStyle(
              color: Color(0xff3A9090),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DietPlanScreenTwo()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "You have not yet received a deiat plan from your specialist :( ",
                textAlign: TextAlign.center,
              )),
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
