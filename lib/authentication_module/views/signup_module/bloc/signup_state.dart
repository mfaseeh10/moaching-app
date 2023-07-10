part of 'bloc.dart';

class RegisterState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool isSignin = false;


  RegisterState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.isSignin
  });

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory RegisterState.empty() {
    return RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isSignin: false
    );
  }

  factory RegisterState.loading() {
    return RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isSignin: false
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isSignin: false
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isSignin: true
    );
  }

  RegisterState copyWith({
    required bool isEmailValid,
    required bool isPasswordValid,
    required bool isSubmitEnabled,
    required bool isSubmitting,
    required bool isSuccess,
    required bool isFailure,
    required bool isSignin,
  }) {
    return RegisterState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
      isSignin: isSignin
    );
  }

  RegisterState update({
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid ?? true,
      isPasswordValid: isPasswordValid ?? true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isSubmitEnabled: false,
      isSignin: false
    );
  }

  @override
  String toString() {
    return '''RegisterState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
