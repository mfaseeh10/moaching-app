import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_pause_3.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_1.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_4.dart';
import 'package:moaching_app/workout_module/views/flat_db_bench_press/flat_db_bench_press_5.dart';
import 'package:moaching_app/workout_module/views/training_program/views/current_training_programs.dart';
import 'package:moaching_app/workout_module/views/training_program/views/my_training_programs.dart';
import 'authentication_module/views/signup_module/view/oboarding_motivation.dart';
import 'authentication_module/views/signup_module/view/onboarding_bodyType.dart';
import 'authentication_module/views/signup_module/view/onboarding_dob.dart';
import 'authentication_module/views/signup_module/view/onboarding_height.dart';
import 'authentication_module/views/signup_module/view/onboarding_weight.dart';
import 'package:moaching_app/splash/view/splash_screen.dart';
import 'package:moaching_app/workout_module/views/exercise/repository/exercise_repository.dart';
import 'utils/storage.dart';
import 'workout_module/views/training_program/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.initialize();
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<WorkoutRepository>(
        create: (context) => WorkoutRepository()),
    RepositoryProvider<ExerciseRepository>(
        create: (context) => ExerciseRepository()),
  ], child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: TrainingResultScreen_5(),
      //CurrentTrainingProgramsScreen() OnboardingBodyTypeScreen(),
      //OnboardingMotivationScreen(),
    );
  }
}
