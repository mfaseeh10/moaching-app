import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';

import '../../../utils/style.dart';

class CurrentTrainingProgramsScreen extends StatelessWidget {
  const CurrentTrainingProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Training Programs",
            style: TextStyle(
              color: Color(0xff3A9090),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DietPlanScreenTwo()));
              },
              icon: const Icon(
                Icons.menu,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: mediaData.width,
              height: mediaData.height * 0.4,
              //color: Colors.black,
              child: Stack(
                children: [
                  Image.asset('images/exImage.png'),
                  Positioned(
                      top: 230,
                      left: 15,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '1 Excercise',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: mediaData.width * 0.65,
                          ),
                          Container(
                            width: mediaData.width * 0.085,
                            height: mediaData.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: ConstantColors.gradientSecond,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    //right: 0,
                    left: mediaData.width * 0.4,
                    top: mediaData.width * 0.25,
                    child: Container(
                        width: mediaData.width * 0.2,
                        height: mediaData.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          color: ConstantColors.gradientFirst,
                        ),
                        child: Center(
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: ConstantColors.gradientSecond,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Row(
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
                Icon(Icons.menu, color: Color(0xff3A9090))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
