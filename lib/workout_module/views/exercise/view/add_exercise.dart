import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:moaching_app/utils/storage.dart';
import 'package:moaching_app/workout_module/views/exercise/bloc/bloc.dart';
import 'package:moaching_app/workout_module/views/exercise/model/exercise_detailed_model.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';
import 'package:moaching_app/workout_module/views/exercise/repository/exercise_repository.dart';
import 'package:moaching_app/workout_module/views/training_program/models/models.dart';
import 'package:moaching_app/workout_module/views/training_program/repository/repository.dart';
import 'package:moaching_app/workout_module/views/training_program/views/my_training_programs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../custom_widget/custom_navigation_bar.dart';
import '../../../../custom_widget/custom_text.dart';
import '../../../utils/style.dart';
import '../../flat_db_bench_press/flat_db_bench_pause_3.dart';

class AddExerciseScreen extends StatefulWidget {
   AddExerciseScreen({Key? key, required this.exercise }) : super(key: key);

  final Exercise exercise;

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  TextEditingController _timerController = TextEditingController();

  TextEditingController _selectController = TextEditingController();

  TextEditingController _notesController = TextEditingController();

  WorkoutTempo? workoutTempo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.clear,
          color: AppColor.black,
        ),
        title: CustomText(
          text: "Exercise Name",
          color: AppColor.appBackGroundColor,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40,
                    width: 140,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        color: AppColor.appBackGroundColor),
                    child: Text(
                      "Sets",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    )),
                Container(
                    height: 40,
                    width: 140,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: AppColor.appBackGroundColor),
                    child: Text(
                      "Reps",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            BlocProvider(
              create: (_) => ExerciseBloc(
                  exerciseRepository:
                  RepositoryProvider.of<ExerciseRepository>(context)),
              child: BlocConsumer<ExerciseBloc, ExerciseState>(
                listener: (context , state){
                  if(state is LoadedExercise)
                    {
                      const snackBar = SnackBar(
content: Text('Added Exercise !'),
);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MyTrainingPrograms(workout: state.workout,)));

                  }
                },
                builder: (context , state){

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customContainerList(hintText: "0" , state: state , context: context),
                          customContainerListReps(hintText: "0",state: state,context: context ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffd5d6d9),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              onTap: () async {
                                Picker(
                                  adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                                    const NumberPickerColumn(
                                        begin: 0, end: 60, suffix: Text(' minutes')),
                                    const NumberPickerColumn(
                                        begin: 0,
                                        end: 60,
                                        suffix: Text(' seconds'),
                                        jump: 5),
                                  ]),
                                  delimiter: <PickerDelimiter>[
                                    PickerDelimiter(
                                      child: Container(
                                        width: 30.0,
                                        alignment: Alignment.center,
                                        child: Icon(Icons.more_vert),
                                      ),
                                    )
                                  ],
                                  hideHeader: true,
                                  confirmText: 'OK',
                                  confirmTextStyle: TextStyle(
                                      inherit: false, color: Colors.red, fontSize: 22),
                                  title: const Text('Select duration'),
                                  selectedTextStyle: TextStyle(color: Colors.blue),
                                  onConfirm: (Picker picker, List<int> value) {
                                    Duration _duration = Duration(
                                        minutes: picker.getSelectedValues()[0],
                                        seconds: picker.getSelectedValues()[1]);
                                    _timerController.text =
                                        _duration.toString().substring(0, 7);
                                  },
                                ).showDialog(context);
                              },
                              readOnly: true,
                              controller: _timerController,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Pause",
                                  contentPadding: const EdgeInsets.only(left: 15),
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20,right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffd5d6d9),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(

                              onTap: () async {
                                Picker(
                                  adapter:   NumberPickerAdapter(data: <NumberPickerColumn>[
                                    const NumberPickerColumn(begin: 0, end: 19),
                                    const NumberPickerColumn(begin: 0, end: 19),
                                    const NumberPickerColumn(begin: 0, end: 19),
                                    const NumberPickerColumn(begin: 0, end: 19),
                                  ]),
                                  delimiter: <PickerDelimiter>[
                                    PickerDelimiter(
                                      child: Container(
                                        width: 30.0,
                                        alignment: Alignment.center,
                                        child: Icon(Icons.more_vert),
                                      ),
                                    )
                                  ],
                                  hideHeader: true,
                                  confirmText: 'OK',
                                  confirmTextStyle: TextStyle(
                                      inherit: false, color: Colors.red, fontSize: 22),
                                  title: const Text('Select duration'),
                                  selectedTextStyle: TextStyle(color: Colors.blue),
                                  onConfirm: (Picker picker, List<int> value) {
                                    _selectController.text =
                                        picker.getSelectedValues()[0].toString() +
                                            ":" +
                                            picker.getSelectedValues()[1].toString() +
                                            ":" +
                                            picker.getSelectedValues()[2].toString() +
                                            ":" +
                                            picker.getSelectedValues()[3].toString();

                                    workoutTempo = WorkoutTempo(
                                        concentric:int.parse(picker.getSelectedValues()[0].toString()) ,
                                        eccentric:int.parse(picker.getSelectedValues()[1].toString())  ,
                                        midpoint:int.parse(picker.getSelectedValues()[2].toString()),
                                        startingPoint:int.parse(picker.getSelectedValues()[3].toString()) );
                                  },
                                ).showDialog(context);
                              },
                              readOnly: true,
                              controller: _selectController,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Time",
                                  contentPadding: const EdgeInsets.only(left: 15),
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Color(0xffd5d6d9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextFormField(
                                controller: _notesController,
                                maxLines: 200,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Note",
                                    hintStyle: TextStyle(color: Colors.black)),
                              )),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: ()=> context.read<ExerciseBloc>()..add(AddExercise(exercise: widget.exercise, notes: _notesController.text, workoutTempo: workoutTempo!,sets: 0 , raps: 0)),
                          child: Container(
                            height: 45,
                            width: 180,
                            margin: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.appBackGroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }

  customContainerList({final hintText ,required ExerciseState state,required BuildContext context } ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            print("HELLO");
            setState(() {

            });

              if(state.sets<=30 ) {
                context.read<ExerciseBloc>().increaseSets();
              }

          },
          child: Container(
              height: 35,
              width: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.appBackGroundColor),
              child: Icon(
                Icons.add,
                color: AppColor.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
                color: Color(0xffd5d6d9),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: EdgeInsets.only(left: 35),
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.read<ExerciseBloc>().sets.toString(),
                      hintStyle: TextStyle(color: Colors.black)),
                )),
          ),
        ),
        GestureDetector(
          onTap: (){

      context.read<ExerciseBloc>().decreaseSets();
    setState(() {

    });

          },
          child: Container(
              height: 35,
              width: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.appBackGroundColor),
              child: Icon(
                Icons.minimize,
                color: AppColor.white,
              )),
        )
      ],
    );
  }

  customContainerListReps({final hintText ,required ExerciseState state,required BuildContext context  } ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {

            });


                context.read<ExerciseBloc>().increaseRaps();


          },
          child: Container(
              height: 35,
              width: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.appBackGroundColor),
              child: Icon(
                Icons.add,
                color: AppColor.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
                color: Color(0xffd5d6d9),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: EdgeInsets.only(left: 35),
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.read<ExerciseBloc>().reps.toString(),
                      hintStyle: TextStyle(color: Colors.black)),
                )),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {

            });
                context.read<ExerciseBloc>().decreaseRaps();
          },
          child: Container(
              height: 35,
              width: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.appBackGroundColor),
              child: Icon(
                Icons.minimize,
                color: AppColor.white,
              )),
        )
      ],
    );
  }
}
