import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaching_app/chat_module/views/all_chat.dart';
import 'package:moaching_app/specialist_module/views/specialist_home_screen.dart';
import 'package:moaching_app/workout_module/views/diet_plans/diet_plane_screen_one.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excise_detail_screen.dart';

import '../workout_module/utils/style.dart';
import 'custom_text.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int? index;
  CustomBottomNavBar({this.index = 0});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  PageController? _pageController;
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: AppColor.appBackGroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: CustomNavigationBar(
          iconSize: 20,
          selectedColor: AppColor.navIconColor,
          strokeColor: Color(0x30040307),
          unSelectedColor: Colors.white,
          backgroundColor: Colors.transparent,
          items: [
            CustomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    //ExcirsesScreen()
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ExerciseDetailScreen()));
                  },
                  child: Icon(
                    Icons.accessibility_new_outlined,
                    size: 20,
                  )),
              title: CustomText(
                text: "Workout",
                size: 12,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            CustomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietPlanScreenone()));
                  },
                  child: Icon(Icons.restaurant)),
              title: CustomText(
                text: "Meal Plans",
                size: 12,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            CustomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpecialistHomeScreen()));
                  },
                  child: Icon(Icons.person_pin_sharp)),
              title: CustomText(
                text: "Specialist",
                size: MediaQuery.of(context).size.height * 0.018,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            CustomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllChatScreen()));
                  },
                  child: Icon(CupertinoIcons.chat_bubble_2_fill)),
              title: CustomText(
                text: "Chat",
                size: MediaQuery.of(context).size.height * 0.018,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            CustomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    //   Get.offAll(()=>ProfileScreen());
                  },
                  child: Icon(Icons.person)),
              title: CustomText(
                text: "Me",
                size: MediaQuery.of(context).size.height * 0.018,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
          ],
          currentIndex: widget.index ?? _selectedIndex,
          onTap: (index) {
            // if(index==3 && Get.find<storage_controller>().isGuestMode.value)
            // {
            //   Functions.getLoginConfigDialog();
            //   _selectedIndex = 0;
            // }
            // else{

            _selectedIndex = index;
            // _selectedIndex= AppColor.mainColor,
            _pageController!.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
            // _selectedIndex = index;
            // _pageController!.animateToPage(index,
            //     duration: Duration(milliseconds: 300), curve: Curves.ease);
          }

          //  },
          ),
    );
  }
}
