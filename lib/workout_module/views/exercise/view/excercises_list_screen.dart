import 'package:flutter/material.dart';
import 'package:moaching_app/custom_widget/custom_navigation_bar.dart';
import 'package:moaching_app/workout_module/utils/style.dart';
import 'package:moaching_app/workout_module/views/exercise/bloc/bloc.dart';
import 'package:moaching_app/workout_module/views/exercise/repository/exercise_repository.dart';
import 'package:moaching_app/workout_module/views/training_program/widgets/categories_slider.dart';
import 'package:moaching_app/workout_module/views/training_program/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../training_program/widgets/excerciseCard.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Excercises",
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DietPlanScreenTwo()));
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
      body: BlocProvider(
        create: (_) => ExerciseBloc(
            exerciseRepository:
                RepositoryProvider.of<ExerciseRepository>(context))..add(SearchExercise(query: "")),
        child: BlocConsumer<ExerciseBloc, ExerciseState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(state is LoadingExercise)
              {
                return Center(child: CircularProgressIndicator(),);
              }
            if (state is SearchLoadedExercise) {

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SearchField(
                      onChange: (query){

                        context
                            .read<ExerciseBloc>().clearExersice();
                        context
                            .read<ExerciseBloc>().add(SearchExercise(query: controller.text));

                      },
                      controller: controller,
                      onTap: () {
                        context
                            .read<ExerciseBloc>()
                            .add(SearchExercise(query: controller.text));
                      },
                    ),
                  ),
                  CategoriesSlider(exercise: state.searchExercise,),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: state.searchExercise.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20 , right: 20),
                          child: ExerciseCard(
                            exc: state.searchExercise[index],
                            mediaData: mediaData,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SearchField(
                onChange: (query){

                  context
                      .read<ExerciseBloc>().clearExersice();
                  context
                      .read<ExerciseBloc>().add(SearchExercise(query: controller.text));

                },
                controller: controller,
                onTap: () {
                  context
                      .read<ExerciseBloc>()
                      .add(SearchExercise(query: controller.text));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
