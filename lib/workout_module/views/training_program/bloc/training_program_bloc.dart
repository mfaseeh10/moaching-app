part of'bloc.dart';



class WorkOutBloc extends Bloc<WorkOutEvent, WorkOutState> {
  WorkoutRepository _workoutRepository;

  WorkOutBloc({
    required WorkoutRepository workoutRepository,
  })  : _workoutRepository = workoutRepository , super(WorkOutState.empty()){
    on<AddWorkout>(_onAddWorkOut);
    on<GetWorkout>(_onGetWorkOut);
    on<DeleteWorkout>(_onDeleteWorkout);
    on<GetCurrentWorkout>(_oGetCurrentWorkout);

  }


  void toggleValue(bool value){
    state.isLoading = value;
    emit(state);
  }


  Future<void> _oGetCurrentWorkout(GetCurrentWorkout event , Emitter<WorkOutState> emit)async
  {
    try {
      List<Workout> workouts = [];
      emit(WorkOutState.loading());
      Workout workout =  await _workoutRepository.getWorkoutById(workoutId: event.workoutId);
      workouts.add(workout);
      emit(WorkOutState.success(workout: workouts));

    } catch (_) {
      print(_.toString());
      emit(WorkOutState.failure());
    }
  }


  Future<void> _onDeleteWorkout(DeleteWorkout event , Emitter<WorkOutState> emit)async
  {
    try {
      await _workoutRepository.deleteWorkout(event.workoutId);
      emit(WorkOutState.loading());
      Map valueMap = json.decode(Storage.getValue("user_info"));
      List<Workout> workout =  await _workoutRepository.getWorkoutByUser(valueMap["id"]);

      emit(state.update(isSuccess: true, isFailure: false, isLoading: false, myWorkOut: workout));

    } catch (_) {
      print(_.toString());
      emit(WorkOutState.failure());
    }
  }

  Future<void> _onGetWorkOut(GetWorkout event , Emitter<WorkOutState> emit)async
  {
    try {
      Map valueMap = json.decode(Storage.getValue("user_info"));
      List<Workout> workout =  await _workoutRepository.getWorkoutByUser(valueMap["id"]);

        emit(WorkOutState.success(workout: workout));

    } catch (_) {
      print(_.toString());
      emit(WorkOutState.failure());
    }
  }

  Future<void> _onAddWorkOut(
      AddWorkout event, Emitter<WorkOutState> emit) async {
    try {
     await _workoutRepository.createWorkout(event.workout);
     emit(state.update(isSuccess: false, isFailure: false, isLoading: true, myWorkOut: []));
     Map valueMap = json.decode(Storage.getValue("user_info"));
     List<Workout> workout =  await _workoutRepository.getWorkoutByUser(valueMap["id"]);
     emit(state.update(isSuccess: true, isFailure: false, isLoading: false, myWorkOut: workout));

    } catch (_) {
      emit(WorkOutState.failure());
    }
  }
}

