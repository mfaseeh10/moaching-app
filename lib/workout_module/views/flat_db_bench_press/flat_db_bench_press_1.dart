import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/custom_navigation_bar.dart';
import '../../../custom_widget/custom_text.dart';
import '../../utils/style.dart';
import '../exercise/view/add_exercise.dart';
class FlatDbScreen extends StatelessWidget {
  const FlatDbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.clear,color: AppColor.black,),
        title: CustomText(text: "Flat DB Bench Press",color: AppColor.appBackGroundColor,size: 20,),
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.help,color: AppColor.black,),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height*0.3,

              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20,bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/module_one_image2.PNG"),fit: BoxFit.cover)
              ),
              //child:Icon(CupertinoIcons.play_rectangle_fill,color: AppColor.white,size: 50,)
          ),
          Center(child: Padding(
            padding:  EdgeInsets.only(top: 20),
            child: CustomText(text: "Flat DB Bench Press",color: AppColor.white.withOpacity(0.9),size: 18,
              bold: FontWeight.bold,),
          )),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,
                vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customContainer(title: "Reps",subtitle: "10", onTap: (){
               //   Get.to(()=>RepsScreen());
                }),
                customContainer(title: "Tempo",subtitle: "****", onTap: (){
                //  Get.to(()=>RepsScreen());
                }),
                customContainer(title: "Pause",subtitle: "00:10", onTap: (){
                  //Get.to(()=>RepsScreen());
                }),
              ],
            ),
          ),
          customContainerList(title: "0 kg",
              cross: "x",
              subtitle: "10 reps",
              containerBackColor: AppColor.appBackGroundColor,
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExerciseScreen()));
              },
            context: context,
          ),
          customContainerList(title: "0 kg", cross: "x",
              subtitle: "20 reps",containerBackColor: AppColor.appBackGroundColor.withOpacity(0.7),
              context: context,
              onTap: (){

              }),
          customContainerList(title: "0 kg", cross: "x",subtitle: "10 reps",
              containerBackColor: AppColor.appBackGroundColor.withOpacity(0.7),
              context: context,
              onTap: (){}

          ),

          InkWell(
            onTap: (){
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExerciseScreen()));

            },
            child: Container(
              height: 45,
               width: 180,
              margin: EdgeInsets.only(top: 20,bottom: 20),
              decoration: BoxDecoration(
                color: AppColor.appBackGroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Done",
                style: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.bold),
              )),

            ),
          ),

        ],
      ),),
    );
  }

  customContainer({final title,final subtitle,final onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.appBackGroundColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: 16,color: AppColor.white),),
            SizedBox(height: 5,),
            Text(subtitle,style: TextStyle(fontSize: 12,color: AppColor.white)),
          ],
        ),
      ),
    );
  }
  customContainerList({final title,final subtitle,final cross,final containerBackColor,final onTap,BuildContext? context}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context!).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:containerBackColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: 16,color: AppColor.white),),
            SizedBox(width: 10,),
            Text(cross,style: TextStyle(fontSize: 16,color: AppColor.white)),
            SizedBox(width: 10,),
            Text(subtitle,style: TextStyle(fontSize: 16,color: AppColor.white)),
          ],
        ),
      ),
    );
  }
}
