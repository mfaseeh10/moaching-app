part of 'bloc.dart';


abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent() : super();
}

class SearchExercise extends ExerciseEvent
{
  final String? query;
  SearchExercise({required this.query});

  @override

  List<Object?> get props => [query];
}


class AddExercise extends ExerciseEvent
{

  final Exercise exercise;
  final WorkoutTempo workoutTempo;
  final String notes;
  final int raps , sets;

  AddExercise({ required this.exercise ,required this.workoutTempo , required this.notes ,required this.sets ,required this.raps});

  @override

  List<Object?> get props => [exercise,workoutTempo,notes];
}
