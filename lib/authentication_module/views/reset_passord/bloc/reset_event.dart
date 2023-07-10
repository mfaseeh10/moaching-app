part of 'bloc.dart';

abstract class ResetEvent extends Equatable {
  const ResetEvent() : super();
}

class EmailChanged extends ResetEvent {
  final String email;

  const EmailChanged({required this.email}) : super();

  @override
  String toString() => 'EmailChanged { email :$email }';

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}



class Submitted extends ResetEvent {
  final String email;

  const Submitted({required this.email})
      : super();


  @override
  List<Object?> get props => [email];

  @override
  String toString() {
    return 'Submitted { email: $email }';
  }
}




class SendEmailForResetPassword extends ResetEvent {
  final String email;

  const SendEmailForResetPassword({required this.email})
      : super();

  @override
  List<Object?> get props => [email];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email }';
  }
}