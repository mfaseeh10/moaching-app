import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/workout_module/views/exercise/model/model.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_pause_3.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_1.dart';
import 'package:moaching_app/workout_module/views/exercise/view/add_exercise.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_4.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_5.dart';
import 'package:moaching_app/workout_module/views/exercise/view/excise_detail_screen.dart';

import '../../../../constants/static_data.dart';


class ExerciseCard extends StatelessWidget {
  final Exercise exc;
  final Size mediaData;
  final VoidCallback? onTap;

  const ExerciseCard({
    Key? key,
    required this.mediaData,
    required this.exc,
    this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ExerciseDetailScreen(exercise: exc,)));
      },
      trailing: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> AddExerciseScreen(exercise: exc,)));
      },icon: Icon(Icons.menu),),
      title: Text(exc.name,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold)),
      leading: Container(
        height: 200,
        width: mediaData.width * 0.3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1594737625785-a6cbdabd333c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                fit: BoxFit.cover)),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Image.asset('images/Play.png'),
          Text(
            "${exc.category}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: ConstantColors.textColor.withOpacity(0.5),
            ),
          ),

        ],
      ),


    );
  }
}

//
// Card(
// clipBehavior: Clip.antiAlias,
// child: Row(
// children: [
// Expanded(
// flex: 6,

// Spacer(
// flex: 1,
// ),
// Expanded(
// flex: 8,
// child: Container(
// padding: const EdgeInsets.only(top: 5),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[

// SizedBox(
// height: 5,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: <Widget>[
// Image.asset('images/Play.png'),
// ],
// ),
// SizedBox(
// height: 5,
// ),
//
// Row(
// children: <Widget>[

// ],
// ),
//
// ],
// ),
// ),
// ),
// ]),
// ),