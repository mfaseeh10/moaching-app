part of 'bloc.dart';

// class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   AuthBloc({required this.userRepository}) : super(Unauthenticated()) {
//     on<AppStarted>(_onAppStart);
//     on<LoggedIn>(_onLoggedIn);
//     on<LoggedOut>(_onLogOut);
//   }
//
//   final UserRepository userRepository;
//
//   Future<void> _onAppStart(
//       AppStarted event, Emitter<AuthenticationState> emit) async {
//     try {
//       final isSignedIn = await userRepository.isSignedIn();
//       if (isSignedIn) {
//         final name = await userRepository.getUser();
//         emit(Authenticated(displayName: name.toString()));
//       } else {
//         emit(Unauthenticated());
//       }
//     } catch (_) {
//       emit(Unauthenticated());
//     }
//   }
//
//   Future<void> _onLoggedIn(
//       LoggedIn event, Emitter<AuthenticationState> emit) async {
//     final name = await userRepository.getUser();
//     emit(Authenticated(displayName: name.toString()));
//   }
//
//   Future<void> _onLogOut(
//       LoggedOut event, Emitter<AuthenticationState> emit) async {
//
//     await userRepository.signOut();
//     emit(Unauthenticated());
//   }
//
//
// }
