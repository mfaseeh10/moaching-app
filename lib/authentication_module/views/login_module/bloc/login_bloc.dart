part of 'bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  bool isLogin = false;

  LoginBloc({
    required UserRepository userRepository,
  })
      : _userRepository = userRepository,
        super(LoginState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
    on<LoginWithFaceBookPressed>(_onLoginWithFacebookPressed);
    on<LoginWithCredentialsPressed>(_onLoginWithCredentialsPressed);
  }

  void toggleValue(bool value){
    state.isLogin = value;
    emit(state);
  }
  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<LoginState> emit) async {
    emit(
        state.update(
        isEmailValid:  Validators.isValidEmail(event.email) ));
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.update(isPasswordValid:Validators.isValidPassword(event.password) ));
  }

  Future<void> _onSubmitted(
      Submitted event, Emitter<LoginState> emit) async {
    emit(
        state.update(
            isEmailValid:Validators.isValidEmail(event.email),
            isPasswordValid: Validators.isValidPassword(event.password)
    ));
  }

  Future<void> _onLoginWithFacebookPressed(
      LoginWithFaceBookPressed event, Emitter<LoginState> emit) async {

    try {
      await _userRepository.faceBookLogin();
      emit( LoginState.success());
    } catch (_) {
      emit(LoginState.failure());
    }

  }

  Future<void> _onLoginWithApplePressed(
      LoginWithApplePressed event, Emitter<LoginState> emit) async {

    try {
      emit(LoginState.success());
      await _userRepository.appleLogin();
      emit( LoginState.success());
    } catch (_) {
      emit(LoginState.failure());
    }
  }

  Future<void> _onLoginWithCredentialsPressed(
      LoginWithCredentialsPressed event, Emitter<LoginState> emit) async {
    try {

      toggleValue(true);

      await _userRepository.signInWithCredentials(email:event.email,password: event.password).then((value) {
        if(value=="true"){
          toggleValue(false);
          emit( LoginState.success());
        }
      });

    } catch (_) {
      emit(LoginState.failure());
    }
  }


}
