part of 'bloc.dart';


class LoginState{
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool isLogin = false;


  LoginState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.isLogin,
  });


  bool get isFormValid => isEmailValid && isPasswordValid;


  factory LoginState.empty() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isLogin: false
    );
  }


  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isLogin: false,
    );
  }


  factory LoginState.failure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isLogin: false
    );
  }


  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isLogin: true
    );
  }


  LoginState copyWith({
   required bool isEmailValid,
   required bool isPasswordValid,
   required bool isSubmitEnabled,
  required  bool isSubmitting,
  required  bool isSuccess,
   required bool isFailure,
    required bool isLogin,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ,
      isPasswordValid: isPasswordValid ,
      isSubmitting: isSubmitting ,
      isSuccess: isSuccess,
      isFailure: isFailure,
      isLogin: isLogin,
    );
  }


  LoginState update({
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
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isLogin: $isLogin
    }''';
  }



}