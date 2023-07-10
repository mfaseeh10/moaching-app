part of 'bloc.dart';


class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseRepository _exerciseRepository;
  List<Exercise>  searchedExercise = [];
  int sets = 0, reps=0;


  ExerciseBloc({
    required ExerciseRepository exerciseRepository,
  })  : _exerciseRepository = exerciseRepository , super(InitialExercise()){
    on<SearchExercise>(_onSearchExercise);
    on<AddExercise>(_onAddExercise);

  }

  void updateState()
  {
    emit(state);
  }


  void increaseSets( )
  {
    if(sets<=30)
      {
        sets++;
        state.sets = sets;
      }

    emit(state);
  }
  void decreaseSets( )
  {
    if(sets>=1)
      {
        sets--;
        state.sets--;
      }

    emit(state);
  }
  void increaseRaps( )
  {
    if(reps<=30)
      {
        reps++;
        state.reps= reps;
      }

    emit(state);
  }
  void decreaseRaps( )
  {
    if(reps>=1)
      {
        reps--;
        state.reps--;
      }

    emit(state);
  }


  void clearExersice()
  {
    searchedExercise.clear();
  }
  Future<void> _onAddExercise(
      AddExercise event, Emitter<ExerciseState> emit) async {
    try {
      List<Sets> workoutList = [];
      print(state.sets);
      for(int i = 0 ; i < 2 ; i++)
      {
        Sets workout = Sets(reps: state.reps, weight:0.0, breaks: 25.0);
        workoutList.add(workout);
      }

      WorkoutExercise ex = WorkoutExercise(
          name: event.exercise.name, sets: workoutList,
          category: 0, youtubeLink: event.exercise.youtubeLink,
          notes: event.notes, equipment:event.exercise.equipments ,
          exerciseKey: event.exercise.key, intensity: "",
          options: [], primaryMuscle: event.exercise.targets.first.key,
          tempo:event.workoutTempo , time: "", exerciseId: '', exerciseType: 0, state: 0, exerciseEnded: '', exerciseStarted: '');

      Workout workout = await WorkoutRepository().getWorkoutById(workoutId:   await Storage.getValue("workoutId"));


      workout.exercises.add(ex);

      await WorkoutRepository().updateWorkout(workout);
      Workout updatedWorkout = await WorkoutRepository().getWorkoutById(workoutId: await Storage.getValue("workoutId"));
      emit( LoadedExercise(workout: updatedWorkout));
    } catch (e) {
      print(e.toString());
      emit( FailureExercise(error: e.toString()));
    }
  }

  Future<void> _onSearchExercise(
      SearchExercise event, Emitter<ExerciseState> emit) async {
    try {

      searchedExercise = await _exerciseRepository.searchExercise(event.query!);
      emit( SearchLoadedExercise(searchExercise: searchedExercise));
    } catch (e) {
      emit( FailureExercise(error: e.toString()));
    }
  }
}
