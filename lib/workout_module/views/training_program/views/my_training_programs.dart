import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_colored_button_small.dart';
import 'package:moaching_app/custom_widget/custom_label_withTItle.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/utils/style.dart';
import 'package:moaching_app/workout_module/views/exercise/model/exercise_detailed_model.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excercise_body_select_screen.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excercises_list_screen.dart';
import 'package:moaching_app/workout_module/views/training_program/bloc/bloc.dart';
import 'package:moaching_app/workout_module/views/training_program/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaching_app/workout_module/views/training_program/repository/repository.dart';

class MyTrainingPrograms extends StatefulWidget {
  const MyTrainingPrograms({Key? key, required this.workout}) : super(key: key);

  final Workout workout;

  @override
  _MyTrainingProgramsState createState() => _MyTrainingProgramsState();
}

class _MyTrainingProgramsState extends State<MyTrainingPrograms> {
  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
          Stack(alignment: Alignment.center, children: [
            Image.asset('images/Rectangle.png'),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExcercisesBodySelectScreen()));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ])
        ],
        leading: GestureDetector(
          onTap: () {
           Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomLabelWithTitle(
                      mediaData: mediaData, label: 'My Training Programs'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: mediaData.width * 0.95,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: new AssetImage("images/module_one_image.PNG"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.workout.name.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Text(
                      "${widget.workout.exercises.length} Excercises",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              BlocProvider(
                create: (_) => WorkOutBloc(
                  workoutRepository:
                      RepositoryProvider.of<WorkoutRepository>(context),
                )..add(GetCurrentWorkout(workoutId: widget.workout.id)),
                child: BlocBuilder<WorkOutBloc, WorkOutState>(
                  builder: (context, state) {
                    if (state.isSuccess) {
                      return state.myWorkOut.first.exercises.length==0?Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: addProgramWidget(mediaData, context),
                      ):Container(
                        height:MediaQuery.of(context).size.height*0.45,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                Padding(
                                  padding: const EdgeInsets.only(left:40.0,right:40),
                                  child: Divider(
                              color: Colors.grey.shade400,
                            ),
                                ),
                            itemCount: state.myWorkOut.first.exercises.length,
                            itemBuilder: (context , index){
                              WorkoutExercise ex = state.myWorkOut.first.exercises[index];
                              return Row(
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
                                      Text(ex.name),
                                     const SizedBox(
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
                                            ex.time,
                                            style: TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        ex.equipment.map((e) => e.name.toString()).toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.menu, color: Color(0xff3A9090))
                                ],
                              );
                            }
                            ),
                      );

                    }



                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: addProgramWidget(mediaData, context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addProgramWidget(Size mediaData, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/NoExcerciseAdded-mdpi.png'),
        SizedBox(
          height: 10,
        ),
        Text("Add Exercise",
            style: TextStyle(
              color: Color(0xff3A9090),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 5,
        ),
        Text(
          "to this exercise program",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomColoredButtonSmall(
            mediaData: mediaData,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ExerciseListScreen()));
            },
            label: 'Add'),
      ],
    );
  }
}
