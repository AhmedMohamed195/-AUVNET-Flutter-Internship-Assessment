import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  final FirebaseAuth firebaseAuth;

  SignInUseCase(this.firebaseAuth);

  Future<void> call({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (!(firebaseAuth.currentUser?.emailVerified ?? false)) {
      throw FirebaseAuthException(
        code: 'email-not-verified',
        message: 'Email is not verified.',
      );
    }
  }
}
