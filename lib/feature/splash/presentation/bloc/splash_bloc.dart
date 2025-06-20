import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FirebaseAuth _auth;

  SplashBloc(this._auth) : super(SplashInitial()) {
    on<CheckAuthEvent>((event, emit) async {
      emit(SplashLoading());
      final user = _auth.currentUser;
      if (user != null && user.emailVerified) {
        emit(SplashNavigateToHome());
      } else {
        emit(SplashNavigateToOnboarding());
      }
    });
  }
}
