import 'package:firebase_auth/firebase_auth.dart';

class CheckAuthUseCase {
  final FirebaseAuth _auth;

  CheckAuthUseCase(this._auth);

  Future<bool> call() async {
    final user = _auth.currentUser;
    return user != null && user.emailVerified;
  }
}
