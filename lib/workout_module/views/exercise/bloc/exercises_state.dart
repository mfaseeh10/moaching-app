part of'bloc.dart';

@immutable
abstract class ExerciseState extends Equatable
{
  int sets = 0, reps=0;

}

class InitialExercise implements ExerciseState
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement reps
  int get reps => 0;

  @override
  // TODO: implement sets
  int get sets => 0;

  @override
  // TODO: implement stringify
  bool? get stringify => false;

  @override
  set reps(int _reps) {
    // TODO: implement reps
  }

  @override
  set sets(int _sets) {
    // TODO: implement sets
  }

}
class LoadedExercise implements ExerciseState
{

  final Workout workout;
  @override
  // TODO: implement reps
  int get reps => 0;

  @override
  // TODO: implement sets
  int get sets => 0;

  @override
  // TODO: implement stringify
  bool? get stringify => false;

  LoadedExercise({required this.workout });
  @override
  List<Object?> get props => [ workout];

  @override
  set reps(int _reps) {
    // TODO: implement reps
  }

  @override
  set sets(int _sets) {
    // TODO: implement sets
  }

}

class LoadingExercise implements ExerciseState
{
  @override
  // TODO: implement reps
  int get reps => 0;

  @override
  // TODO: implement sets
  int get sets => 0;

  @override
  // TODO: implement stringify
  bool? get stringify => false;
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  set reps(int _reps) {
    // TODO: implement reps
  }

  @override
  set sets(int _sets) {
    // TODO: implement sets
  }

}
class SearchLoadedExercise implements ExerciseState
{

  @override
  // TODO: implement reps
  int get reps => 0;

  @override
  // TODO: implement sets
  int get sets => 0;

  @override
  // TODO: implement stringify
  bool? get stringify => false;
  List<Exercise> searchExercise;


  SearchLoadedExercise({required this.searchExercise , });

  SearchLoadedExercise copyWith({
    List<Exercise>? searchExercises,
    final Workout?  workouts
  })=>SearchLoadedExercise(searchExercise: searchExercises ??searchExercise );


  @override
  // TODO: implement props
  List<Object?> get props => [searchExercise];

  @override
  set reps(int _reps) {
    // TODO: implement reps
  }

  @override
  set sets(int _sets) {
    // TODO: implement sets
  }

}



class FailureExercise implements ExerciseState
{
  @override
  // TODO: implement reps
  int get reps => 0;

  @override
  // TODO: implement sets
  int get sets => 0;

  @override
  // TODO: implement stringify
  bool? get stringify => false;
  final String error;
  FailureExercise({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];

  @override
  set reps(int _reps) {
    // TODO: implement reps
  }

  @override
  set sets(int _sets) {
    // TODO: implement sets
  }

}