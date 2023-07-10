import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDetailScreen extends StatefulWidget {
  const ExerciseDetailScreen({Key? key ,required this.exercise}) : super(key: key);
  final Exercise exercise;

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  YoutubePlayerController? _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.exercise.youtubeLink);
   _controller = YoutubePlayerController(
    initialVideoId: videoId!,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Exercises",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    Icon(Icons.list)
                  ],
                ),
              ),
              YoutubePlayer(
                controller: _controller!,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.exercise.name,
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.exercise.description,
                      style: TextStyle(color: Colors.grey,fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Equipment",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                  Text(widget.exercise.equipments.map((e) => e.key).join(","),
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Instruction",
                        style: TextStyle(
                          color: Color(0xff3A9090),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: widget.exercise.instructions.length,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Color(0xff3A9090),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.exercise.instructions[index].text,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    ),


                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
