import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excercises_list_screen.dart';

import '../../../utils/style.dart';

class ExcercisesBodySelectScreen extends StatefulWidget {
  const ExcercisesBodySelectScreen({Key? key}) : super(key: key);

  @override
  _ExcercisesBodySelectScreenState createState() =>
      _ExcercisesBodySelectScreenState();
}

class _ExcercisesBodySelectScreenState
    extends State<ExcercisesBodySelectScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Excercises",
            style: TextStyle(
              color: Color(0xff3A9090),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        actions: [
          Stack(alignment: Alignment.center, children: [
            Image.asset('images/Rectangle.png'),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseListScreen()));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ])
        ],
        leading: GestureDetector(
          onTap: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => ExcercisesBodySelectScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(child: Image.asset('images/body-mdpi.png')),
                ),
                Container(child: Image.asset('images/rotate-mdpi.png')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
