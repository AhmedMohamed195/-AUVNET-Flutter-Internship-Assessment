import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordUseCase {
  final FirebaseAuth firebaseAuth;

  ResetPasswordUseCase(this.firebaseAuth);

  Future<void> call({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
