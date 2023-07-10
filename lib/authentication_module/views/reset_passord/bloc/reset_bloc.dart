part of 'bloc.dart';


class ResetBloc extends Bloc<ResetEvent, ResetState> {
  UserRepository _userRepository;
  bool isLogin = false;

  ResetBloc({
    required UserRepository userRepository,
  })
      : _userRepository = userRepository,
        super(ResetState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<Submitted>(_onSubmitted);
    on<SendEmailForResetPassword>(_sendEmailForPasswordReset);

  }

  void toggleValue(bool value){
    state.isEmailSent = value;
    emit(state);
  }
  
  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<ResetState> emit) async {
    emit(
        state.update(
            isEmailValid:  Validators.isValidEmail(event.email) ));
  }
  
  Future<void> _onSubmitted(
      Submitted event, Emitter<ResetState> emit) async {
    emit(
        state.update(
            isEmailValid:Validators.isValidEmail(event.email),
        ));
  }
  
  

  Future<void> _sendEmailForPasswordReset(
      SendEmailForResetPassword event, Emitter<ResetState> emit) async {
    try {

      toggleValue(true);

      await _userRepository.resetPassword(event.email).then((value) {
        if(value=="true"){
          toggleValue(false);
          emit( ResetState.success());
        }
      });

    } catch (_) {
      emit(ResetState.failure());
    }
  }


}
