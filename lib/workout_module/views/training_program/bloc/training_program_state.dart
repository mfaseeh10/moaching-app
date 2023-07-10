part of'bloc.dart';



class WorkOutState{
  final bool isSuccess;
   bool isLoading;
  final bool isFailure;
   final List<Workout> myWorkOut;


  WorkOutState({
    required this.isSuccess,
    required this.isFailure,
    this.isLoading = false,
    required this.myWorkOut,


  });


  factory WorkOutState.empty() {
    return WorkOutState(
      isSuccess: false,
      isFailure: false,
      isLoading: false,
      myWorkOut: []
    );
  }


  factory WorkOutState.loading() {
    return WorkOutState(
      isSuccess: false,
      isFailure: false,
      isLoading: true,
      myWorkOut: []
    );
  }


  factory WorkOutState.failure() {
    return WorkOutState(
      isSuccess: false,
      isFailure: true,
      isLoading: false,
      myWorkOut: []
    );
  }


  factory WorkOutState.success({required List<Workout> workout}) {
    return WorkOutState(
      isSuccess: true,
      isFailure: false,
      isLoading: false,
      myWorkOut: workout

    );
  }


  WorkOutState copyWith({
    required  bool isSuccess,
    required bool isFailure,
    required bool isLoading,
    required List<Workout> myWorkOut
  }) {
    return WorkOutState(
      isSuccess: isSuccess,
      isFailure: isFailure,
      isLoading: isLoading,
      myWorkOut: myWorkOut

    );
  }

  WorkOutState update({
    required  bool isSuccess,
    required bool isFailure,
    required bool isLoading,
    required List<Workout> myWorkOut
  }) {
    return copyWith(
        isSuccess: isSuccess,
        isFailure: isFailure,
        isLoading: isLoading,
        myWorkOut: myWorkOut
    );
  }


  @override
  String toString() {
    return '''WorkoutState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isLoading: $isLoading,
    }''';
  }



}