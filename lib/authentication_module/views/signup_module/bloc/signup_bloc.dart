part of 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository _userRepository;

  bool isSignin = false;


  void toggleValue(bool value){
    state.isSignin = value;
    emit(state);
  }

  RegisterBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(RegisterState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
    on<RegisterWithCredentialsPressed>(_onRegisterWithCredentialsPressed);
  }

  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<RegisterState> emit) async {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.update(
        isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _onSubmitted(
      Submitted event, Emitter<RegisterState> emit) async {
    emit(state.update(
        isEmailValid: Validators.isValidEmail(event.email),
        isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _onRegisterWithCredentialsPressed(
      RegisterWithCredentialsPressed event, Emitter<RegisterState> emit) async {

    try {
      toggleValue(true);

    final response =  await _userRepository.createUser(event.userModel);
      toggleValue(false);
      if(response == "true")
        {
          emit(RegisterState.success());
        }

      emit(RegisterState.failure());


    } catch (_) {
      emit(RegisterState.failure());
    }
  }
}
