import 'package:flutter/material.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excise_detail_screen.dart';

class CompleteTrainingScreen extends StatefulWidget {
  const CompleteTrainingScreen({Key? key}) : super(key: key);

  @override
  _CompleteTrainingScreenState createState() => _CompleteTrainingScreenState();
}

class _CompleteTrainingScreenState extends State<CompleteTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff575757),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  Text("Flate DB Bench Press",
                      style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(""),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 230,
                width: double.infinity,
                color: Colors.grey.shade600,
                child: TextField(
                    // cursorColor: Colors.white,
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Notes',
                )),
              ),
              Text("Well Done!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 20,
              ),
              Text("You have complete the new training programe",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              InkWell(
                //ExcirsesScreen
                onTap: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ExerciseDetailScreen()));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: Color(0xff3A9090),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
