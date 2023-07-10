import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/model/model_one.dart';

class DietPlanScreenThree extends StatefulWidget {
  const DietPlanScreenThree({Key? key}) : super(key: key);

  @override
  _DietPlanScreenThreeState createState() => _DietPlanScreenThreeState();
}

class _DietPlanScreenThreeState extends State<DietPlanScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [],
        centerTitle: true,
        title: const Text("Diet Plans",
            style: TextStyle(
              color: Color(0xff3A9090),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context
                // MaterialPageRoute(
                //     builder: (context) => YourMacronuber())
                );
          },
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: ConstantColors.backgroundColor,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: itemData.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: AssetImage(
                                          itemData[index].itemimages),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemData[index].name_item,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Color(0xff3A9090),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Proteins")
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "530",
                                                  style: TextStyle(),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Fat")
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("103")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.amber,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Carbs")
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("250")
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage(itemData[index].femalimages),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  itemData[index].femalename,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
