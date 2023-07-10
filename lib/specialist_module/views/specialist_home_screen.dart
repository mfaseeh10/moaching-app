import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/utils/style.dart';
import 'package:moaching_app/workout_module/views/diet_plans/diet_plan_screen_two.dart';

import '../../constants/constant_colors.dart';

class SpecialistHomeScreen extends StatefulWidget {
  const SpecialistHomeScreen({Key? key}) : super(key: key);

  @override
  _SpecialistHomeScreenState createState() => _SpecialistHomeScreenState();
}

class _SpecialistHomeScreenState extends State<SpecialistHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Specialist",
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
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: SpecialistOptionCard(
                title: 'See your Specialists ',
                subtitle: 'Get an overview of your specialists ',
                mediaData: mediaData,
                onTap: () {},
                showCircle: false,
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(10),
              child: SpecialistOptionCard(
                title: 'Search for Specialists ',
                subtitle: 'Find specialists in your country ',
                mediaData: mediaData,
                onTap: () {},
                showCircle: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialistOptionCard extends StatelessWidget {
  const SpecialistOptionCard(
      {Key? key,
      required this.mediaData,
      required this.onTap,
      required this.title,
      required this.subtitle,
      this.showCircle})
      : super(key: key);

  final Size mediaData;
  final void Function()? onTap;
  final String? title;
  final String? subtitle;
  final bool? showCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaData.width,
      height: mediaData.height * 0.2,
      child: Stack(fit: StackFit.loose, children: [
        Container(
          height: mediaData.height * 0.12,
          width: mediaData.width * 0.9,
          decoration: BoxDecoration(
            color: ConstantColors.gradientSecond.withOpacity(0.05),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: const TextStyle(
                              color: ConstantColors.gradientSecond,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          subtitle!,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: showCircle!
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 100,
          bottom: 80,
          child: Container(
              width: mediaData.width * 0.8,
              height: mediaData.height * 0.4,
              child: Image.asset('images/body-mdpi.png')),
        ),
      ]),
    );
  }
}
