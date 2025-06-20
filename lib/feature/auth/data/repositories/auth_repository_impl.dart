import 'package:simple_e_commerce_app/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:simple_e_commerce_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signIn({required String email, required String password}) {
    return remoteDataSource.signIn(email, password);
  }

  @override
  Future<void> resetPassword({required String email}) {
    return remoteDataSource.resetPassword(email);
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    return remoteDataSource.signUp(email, password);
  }
}
