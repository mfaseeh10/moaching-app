import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';

import '../exercise/view/excise_detail_screen.dart';

class TrainingResultScreen extends StatefulWidget {
  const TrainingResultScreen({Key? key}) : super(key: key);

  @override
  _TrainingResultScreenState createState() => _TrainingResultScreenState();
}

class _TrainingResultScreenState extends State<TrainingResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(

                      child: Icon(Icons.arrow_back,size: 20,),
                      onTap: (){
                        Navigator.pop(context);
                      },

                    ),
                    Text("Training Result",style: TextStyle( color: Color(0xff3A9090),
                    fontSize: 22,fontWeight: FontWeight.w600,
                    )),
                    Text(""),
                  ],
                ),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: new AssetImage("images/workout_module_image.PNG"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(

                  children: [
                    Positioned(

                      left: 25,
                      right: 0,
                      top: 110,
                      bottom: 0,
                      child: Text("New",style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600
                      ),),
                    ),



                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width/2.3,
                decoration: BoxDecoration(
                    color: Color(0xff3A9090),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("03-04-2022 21:17",style: TextStyle(color: Colors.white),)),

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
                      Text("Duration",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("00:02:34",
                      style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Current Duration",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("00:01:18",style: TextStyle(color: Colors.grey)),
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
                      Text("Rest Time",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("00:00:30",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Wasted Time",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("00:00:00",style: TextStyle(color: Colors.grey)),
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
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ExerciseDetailScreen()));
                        },
                        child: Text("No of Excirses Perform",style: TextStyle( color: Color(0xff3A9090),
                          fontSize: 18,fontWeight: FontWeight.w600,
                        )),
                      ),
                      Text("1 Excirses (s)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Total Weight",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("33 kg",style: TextStyle(color: Colors.grey)),
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
                      Text("No of Skipped",style: TextStyle( color: Color(0xff3A9090),
                        fontSize: 18,fontWeight: FontWeight.w600,
                      )),
                      Text("0 Exercise",
                        style: TextStyle(color: Colors.grey),
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
