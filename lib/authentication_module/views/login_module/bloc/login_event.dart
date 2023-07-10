part of 'bloc.dart';


abstract class LoginEvent extends Equatable {
 const LoginEvent() : super();
}

class EmailChanged extends LoginEvent {
  final String email;

 const EmailChanged({required this.email}) : super();

  @override
  String toString() => 'EmailChanged { email :$email }';

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

 const PasswordChanged({required this.password}) : super();


  @override
  List<Object?> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  const Submitted({required this.email, required this.password})
      : super();


  @override
  List<Object?> get props => [email,password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class LoginWithFaceBookPressed extends LoginEvent {
  @override
  String toString() => 'LoginWithFaceBookPressed';

  @override
  List<Object?> get props => [];
}

class LoginWithApplePressed extends LoginEvent {
  @override
  String toString() => 'LoginWithApplePressed';

  @override
  List<Object?> get props => [];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

 const LoginWithCredentialsPressed({required this.email, required this.password})
      : super();

  @override
  List<Object?> get props => [email,password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}

