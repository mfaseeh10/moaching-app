import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/diet_plans/add_to_breakfast.dart';

import '../../../model/model_one.dart';

class SearchForFood extends StatefulWidget {
  const SearchForFood({Key? key}) : super(key: key);

  @override
  _SearchForFoodState createState() => _SearchForFoodState();
}

class _SearchForFoodState extends State<SearchForFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DietPlan3Screen()));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Text("Search For Food",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(""),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xff3A9090),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                            "Me",
                            textAlign: TextAlign.center,
                          )),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Mine"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextField(
                    // cursorColor: Colors.white,
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xff3A9090),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Recent Search",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: itemData.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddToBreakfast()));
                        },
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
                                                    Text(
                                                      "Proteins",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12),
                                                    )
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
                                                    Text(
                                                      "Fat",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12),
                                                    )
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
                                                    Text(
                                                      "Carbs",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12),
                                                    )
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
