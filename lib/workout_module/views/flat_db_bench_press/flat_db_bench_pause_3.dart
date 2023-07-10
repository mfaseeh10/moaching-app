import 'package:flutter/material.dart';

import '../../../custom_widget/custom_navigation_bar.dart';
import '../../../custom_widget/custom_text.dart';
import '../../utils/style.dart';
import 'flat_db_bench_press_4.dart';
class FlatDbBenchPress_3 extends StatelessWidget {
  const FlatDbBenchPress_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child:Column(

          children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: 50),
              child: CustomText(text: "Flat DB Bench Press",
              color: AppColor.white,size: 22,
              bold: FontWeight.bold,
              ),
            ),
          ),
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
                child: CustomText(text: "Pause",
                  color: AppColor.white,size: 22,
                  bold: FontWeight.bold,
                ),
              ),
            ),
              Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color:AppColor.appBackGroundColor,width: 10 )
                ),
                child: Text("00:14",style: TextStyle(fontSize: 26,color: Colors.white,
                    fontWeight: FontWeight.bold),),
              ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FlatDbBenchPress_4()));

              },
              child: Center(
                child: Container(
                  height: 45,
                  width: 180,
                  margin: EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Skip",
                    style: TextStyle(color: AppColor.appBackGroundColor,fontSize: 16,fontWeight: FontWeight.bold),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
