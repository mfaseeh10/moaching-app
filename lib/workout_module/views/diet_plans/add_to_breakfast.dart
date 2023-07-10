import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/diet_plans/search_for_food.dart';

class AddToBreakfast extends StatefulWidget {
  const AddToBreakfast({Key? key}) : super(key: key);

  @override
  _AddToBreakfastState createState() => _AddToBreakfastState();
}

class _AddToBreakfastState extends State<AddToBreakfast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
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
                  Text("Add To BreakFast",
                      style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(""),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage("images/sandwhich_image.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHole Green noodles Rema 100",
                              style: TextStyle(color: Color(0xff3A9090)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Kcaal",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("0"),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Proteins",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("0 g"),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Fat",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("0 g"),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Carbs",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("0 g"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Quantity"),
                      ),
                    ),
                    Container(
                      child: Text("   "),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchForFood()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.33,
                        decoration: BoxDecoration(
                            color: Color(0xff3A9090),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Center(
                            child: Text(
                          "   Choose for 100g",
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Pr. 100 g",
                  style: TextStyle(
                    color: Color(0xff3A9090),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
