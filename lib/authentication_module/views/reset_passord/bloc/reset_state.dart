part of 'bloc.dart';


class ResetState{
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool isEmailSent = false;


  ResetState({
    required this.isEmailValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.isEmailSent,
  });




  factory ResetState.empty() {
    return ResetState(
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isEmailSent: false
    );
  }


  factory ResetState.loading() {
    return ResetState(
      isEmailValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isEmailSent: false,
    );
  }


  factory ResetState.failure() {
    return ResetState(
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        isEmailSent: false
    );
  }


  factory ResetState.success() {
    return ResetState(
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        isEmailSent: true
    );
  }


  ResetState copyWith({
    required bool isEmailValid,
    required bool isPasswordValid,
    required bool isSubmitEnabled,
    required  bool isSubmitting,
    required  bool isSuccess,
    required bool isFailure,
    required bool isLogin,
  }) {
    return ResetState(
      isEmailValid: isEmailValid ,
      isSubmitting: isSubmitting ,
      isSuccess: isSuccess,
      isFailure: isFailure,
      isEmailSent: isLogin,
    );
  }


  ResetState update({
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return copyWith(
        isEmailValid: isEmailValid?? true,
        isPasswordValid: isPasswordValid?? true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSubmitEnabled: false,
        isLogin: false
    );
  }


  @override
  String toString() {
    return '''ResetState {
      isEmailValid: $isEmailValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isLogin: $isEmailSent
    }''';
  }



}