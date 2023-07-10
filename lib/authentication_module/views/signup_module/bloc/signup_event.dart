part of 'bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent() : super();
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({required this.email}) : super();

  @override
  String toString() => 'EmailChanged { email :$email }';

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({required this.password}) : super();

  @override
  List<Object?> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;

  const Submitted({required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class RegisterWithCredentialsPressed extends RegisterEvent {
 final UserModel userModel;

  const RegisterWithCredentialsPressed(
      {required this.userModel})
      : super();

  @override
  List<Object?> get props => [userModel];


}


