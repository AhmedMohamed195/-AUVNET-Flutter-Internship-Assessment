// // ignore_for_file: unused_local_variable

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_state.dart';

// part 'sign_in_event.dart';

// class SignInBloc extends Bloc<SignInEvent, SignInState> {
//   SignInBloc() : super(SignInInitial()) {
//     // Login Event
//     on<SignInButtonPressed>((event, emit) async {
//       emit(SignInLoading());

//       try {
//         final credential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(
//           email: event.email,
//           password: event.password,
//         );

//         final isVerified =
//             FirebaseAuth.instance.currentUser?.emailVerified ?? false;

//         if (isVerified) {
//           emit(SignInSuccess());
//         } else {
//           emit(SignInFailure('Please verify your email.'));
//         }
//       } on FirebaseAuthException catch (e) {
//         String errorMessage = "An unexpected error occurred.";

//         if (e.code == 'user-not-found') {
//           errorMessage = "No user found for that email.";
//         } else if (e.code == 'wrong-password') {
//           errorMessage = "Wrong password provided for that user.";
//         } else if (e.code == 'invalid-credential') {
//           errorMessage = "Invalid email or password.";
//         } else if (e.code == 'invalid-email') {
//           errorMessage = "Invalid email format.";
//         } else if (e.code == 'user-disabled') {
//           errorMessage = "This account has been disabled.";
//         } else if (e.code == 'too-many-requests') {
//           errorMessage = "Too many attempts. Try again later.";
//         }

//         emit(SignInFailure(errorMessage));
//       } catch (e) {
//         emit(SignInFailure("There was an error connecting to the server."));
//       }
//     });

//     // Reset Password Event
//     on<ResetPasswordRequested>((event, emit) async {
//       emit(SignInLoading());

//       try {
//         await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
//         emit(ResetPasswordSuccess());
//       } on FirebaseAuthException catch (e) {
//         String errorMessage = "Error sending reset email.";

//         if (e.code == 'user-not-found') {
//           errorMessage = "No user found with this email.";
//         } else if (e.code == 'invalid-email') {
//           errorMessage = "Invalid email address.";
//         }

//         emit(ResetPasswordFailure(errorMessage));
//       } catch (e) {
//         emit(ResetPasswordFailure("Unexpected error occurred."));
//       }
//     });
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';
import '../../../domain/usecase/sign_in_usecase.dart';
import '../../../domain/usecase/reset_password_usecase.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  SignInBloc({
    required this.signInUseCase,
    required this.resetPasswordUseCase,
  }) : super(SignInInitial()) {

    on<SignInRequested>((event, emit) async {
      emit(SignInLoading());
      try {
        await signInUseCase(
          email: event.email,
          password: event.password,
        );
        emit(SignInSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SignInFailure(_mapFirebaseError(e.code)));
      } catch (_) {
        emit(SignInFailure("There was an error connecting to the server."));
      }
    });

 
    on<PasswordResetRequested>((event, emit) async {
      emit(SignInLoading());
      try {
        await resetPasswordUseCase(email: event.email);
        emit(PasswordResetSuccess());
      } on FirebaseAuthException catch (e) {
        emit(PasswordResetFailure(_mapFirebaseError(e.code)));
      } catch (_) {
        emit(PasswordResetFailure("Unexpected error occurred."));
      }
    });
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
        return "No user found for that email.";
      case 'wrong-password':
        return "Wrong password provided for that user.";
      case 'invalid-credential':
        return "Invalid email or password.";
      case 'invalid-email':
        return "Invalid email format.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'too-many-requests':
        return "Too many attempts. Try again later.";
      case 'email-not-verified':
        return "Please verify your email.";
      default:
        return "An unexpected error occurred.";
    }
  }
}
