part of'bloc.dart';


abstract class WorkOutEvent extends Equatable {
  const WorkOutEvent() : super();
}

class AddWorkout extends WorkOutEvent {

  final Workout workout;

  AddWorkout({required this.workout});

  @override
  // TODO: implement props
  List<Object?> get props => [workout];
}

class GetWorkout extends WorkOutEvent {
  const GetWorkout();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class GetCurrentWorkout extends WorkOutEvent {
  final String workoutId;
  const GetCurrentWorkout({required this.workoutId});

  @override
  // TODO: implement props
  List<Object?> get props => [workoutId];
}

class DeleteWorkout extends WorkOutEvent {
  final String workoutId;
  const DeleteWorkout({required this.workoutId});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}



