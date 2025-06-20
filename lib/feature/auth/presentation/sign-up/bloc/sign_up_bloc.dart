import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/bloc/sign_up_event.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/bloc/sign_up_state.dart';
import '../../../domain/usecase/sign_up_usecase.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpLoading());

      if (event.password != event.confirmPassword) {
        emit(SignUpFailure("Passwords do not match."));
        return;
      }

      try {
        await signUpUseCase(email: event.email, password: event.password);
        emit(SignUpSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignUpFailure('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          emit(SignUpFailure('The account already exists for that email.'));
        } else {
          emit(SignUpFailure('An unexpected error occurred.'));
        }
      } catch (e) {
        emit(SignUpFailure('There was an error connecting to the server.'));
      }
    });
  }
}
