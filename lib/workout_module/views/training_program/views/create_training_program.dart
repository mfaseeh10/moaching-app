import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button_small.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/utils/storage.dart';
import 'package:moaching_app/workout_module/utils/style.dart';
import 'package:moaching_app/workout_module/views/training_program/bloc/bloc.dart';
import 'package:moaching_app/workout_module/views/training_program/models/models.dart';
import 'package:moaching_app/workout_module/views/training_program/models/trainer.dart';
import 'package:moaching_app/workout_module/views/training_program/repository/repository.dart';
import 'package:moaching_app/workout_module/views/training_program/views/my_training_programs.dart';
import 'package:moaching_app/workout_module/views/training_program/widgets/custom_text_field.dart';

class CreateTrainingProgram extends StatefulWidget {
  const CreateTrainingProgram({Key? key}) : super(key: key);

  @override
  _CreateTrainingProgramState createState() => _CreateTrainingProgramState();
}

class _CreateTrainingProgramState extends State<CreateTrainingProgram> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (_) => WorkOutBloc(
              workoutRepository:
              RepositoryProvider.of<WorkoutRepository>(context),
            ),
            child: BlocConsumer<WorkOutBloc, WorkOutState>(
                listener: (context , state){
                  if(state.isSuccess)
                  {
                    const snackBar = SnackBar(
                      content: Text('Added Workout Successfully !'),
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  if(state.isFailure)
                  {
                    const snackBar = SnackBar(
                      content: Text('Not Able To Add Workout !'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context , state)

                {
                  print(state);
                  return AlertDialog(
                  title: Text('Training Name',
                      style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      )),
                  content: CustomTextField(
                    controller: _controller,
                    contentPadding: const EdgeInsets.all(12.0),
                    isDense: false,
                    suffixIcon: Icons.add,
                    isEraseable: true,
                    suffixIconColor: ConstantColors.gradientSecond.withOpacity(
                        0.8),
                    suffixIconSize: 20,
                    hintText: 'Enter Trainig Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ConstantColors.gradientSecond.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ConstantColors.gradientSecond.withOpacity(0.8),
                      ),
                    ),
                    onChange: (query) {},
                  ),
                  actions: [
                    TextButton(
                      child: Text('CANCEL',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: Text('Submit',
                          style: TextStyle(
                            color: Color(0xff3A9090),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      onPressed: () {
                        Map valueMap = json.decode(Storage.getValue(
                            "user_info"));
                        final Workout workout = Workout(
                            exercises: [],
                            name: _controller.text,
                            userId: valueMap["id"],
                            coverImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
                            createdDate: "",
                            startTime: "",
                            updatedDate: "",
                            trainer: Trainer());
                        context.read<WorkOutBloc>().add(
                            AddWorkout(workout: workout));
                        Navigator.pop(context);
                        // context.read<WorkOutBloc>().add(GetWorkout());
                      },
                    ),
                  ],
                );
                }
            ),
          );
        });
  }


  Future<void> _loaderDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Loading ...',
                  style: TextStyle(
                    color: Color(0xff3A9090),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
              content: CircularProgressIndicator(),
              actions: [
                TextButton(
                  child: Text('CANCEL',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
          );
        });
  }

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
                onPressed: () => _displayTextInputDialog(context),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ])
        ],
        leading: GestureDetector(
          onTap: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => Training_program1()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child:BlocProvider<WorkOutBloc>(
          create: (_) => WorkOutBloc(
            workoutRepository:
            RepositoryProvider.of<WorkoutRepository>(context),
          )..add(const GetWorkout()),
          child: BlocConsumer<WorkOutBloc, WorkOutState>(
            listener: (context , state){},
            builder: (context , state){

              if(state.isSuccess)
                {
                  return state.myWorkOut.isEmpty? addProgramWidget(mediaData, context) :
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      Expanded(
                          child:ListView.builder(
                            itemCount: state.myWorkOut.length,
                              itemBuilder: (context , index){
                            return _programWidget(mediaData , state.myWorkOut[index] , context);
                          })
                      ),
                    ],
                  );
                }
              if(state.isLoading)
                {
                  return Center(child: CircularProgressIndicator());
                }

              if(state.isFailure)
                {
                  return  const Text("Error in Loading",
                      style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ));
                }




              return addProgramWidget(mediaData, context);
            },

          ),
        ),
      ),
    );
  }

  Widget _programWidget(Size mediaData , Workout workout , BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
          child: GestureDetector(
            onTap: (){
              Storage.setValue("workoutId", workout.id);
              Navigator.push(context, MaterialPageRoute(builder: (_)=> MyTrainingPrograms(workout: workout,)));
            },
            child: Container(
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
                    workout.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  Text(
                    "${workout.exercises.length} Excercises",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white,),

              iconSize: 40.0,
              onSelected: (String str){
                if(str == "Delete")
                  {
                    context.read<WorkOutBloc>().add(DeleteWorkout(workoutId: workout.id));

                    print("hello ${workout.id}");
                  }
              },
              itemBuilder: (BuildContext context) {
                return {'Delete'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }

  Center addProgramWidget(Size mediaData, BuildContext context) {
    return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/NoExcerciseAdded-mdpi.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Get Started",
                      style: TextStyle(
                        color: Color(0xff3A9090),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "and create an excercise program",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20,),
                  CustomColoredButtonSmall(
                      mediaData: mediaData,
                      onTap: () => _displayTextInputDialog(context),
                      label: 'Create'),
                ],
              ),
            );
  }
}
