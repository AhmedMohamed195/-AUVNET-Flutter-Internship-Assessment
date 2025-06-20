
import 'package:simple_e_commerce_app/feature/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<void> call({required String email, required String password}) {
    return repository.signUp(email: email, password: password);
  }
}
