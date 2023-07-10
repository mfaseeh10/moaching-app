import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/training%20_result/complete_training_screen.dart';

import '../../../custom_widget/custom_text.dart';
import '../../utils/style.dart';

class TrainingResultScreen_5 extends StatelessWidget {
  const TrainingResultScreen_5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CompleteTrainingScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
        title: CustomText(
          text: "Flat DB Bench Press",
          color: AppColor.appBackGroundColor,
          size: 20,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xffd5d6d9),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Notes",
                          hintStyle: TextStyle(color: Colors.black)),
                    )),
              ),
            ),
            // Center(
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=>FlatDbBenchPress_3()));
            //
            //     },
            //     child: Container(
            //       height: 45,
            //       width: 180,
            //       margin: EdgeInsets.only(top: 40),
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: AppColor.appBackGroundColor,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Text("Add",
            //         style: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.bold),
            //       ),
            //
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
