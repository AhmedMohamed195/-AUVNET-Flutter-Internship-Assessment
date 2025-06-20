abstract class AuthRepository {
  Future<void> signIn({required String email, required String password});
  Future<void> resetPassword({required String email});
  Future<void> signUp({required String email, required String password});
  
}
