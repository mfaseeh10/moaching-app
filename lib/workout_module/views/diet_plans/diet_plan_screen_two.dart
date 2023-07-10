import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/diet_plans/deit_plan_screen_three.dart';
import 'package:moaching_app/workout_module/views/diet_plans/search_for_food.dart';
import 'package:moaching_app/workout_module/views/diet_plans/your_macronumber.dart';

class DietPlanScreenTwo extends StatefulWidget {
  const DietPlanScreenTwo({Key? key}) : super(key: key);

  @override
  _DietPlanScreenTwoState createState() => _DietPlanScreenTwoState();
}

class _DietPlanScreenTwoState extends State<DietPlanScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DietPlanScreenThree()));
                    },
                    child: Icon(
                      Icons.book_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    "Diet Plans",
                    style: TextStyle(
                      color: Color(0xff3A9090),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourMacronuber()));
                    },
                    child: Icon(
                      Icons.pie_chart,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: const Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        color: const Color(0xff3A9090),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                        child: Text(
                      "03 Aprile 2022",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Text("   ")
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: Color(0xff3A9090),
                    child: Text(
                      "2365 kcal Goal",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Text(
                    "-",
                    style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: Color(0xff3A9090),
                    child: Text(
                      "0 kcal Food",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Text(
                    "+",
                    style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: Color(0xff3A9090),
                    child: Text(
                      "5 kcal Motion",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Text(
                    "=",
                    style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: Color(0xff3A9090),
                    child: Text(
                      "2370 kcal Remaining",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.33,
                      decoration: const BoxDecoration(
                          color: Color(0xff3A9090),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          )),
                      child: const Center(child: Text("BreakFast")),
                    ),
                    Container(
                      child: const Text("Snack"),
                    ),
                    Container(
                      child: const Text("Dinner"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchForFood()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: const Color(0xff3A9090),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                    "Add to Breakfast",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              const Center(
                  child: const Text(
                "Info About Kcal Calculation",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff3A9090),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
