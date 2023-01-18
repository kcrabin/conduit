import '../../domain/repository/auth_repository.dart';
import '../source/local/auth_local_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  // final InternetConnection connection;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    // required this.connection,
  });

  @override
  Future<bool> isAuthenticated() async {
    return authLocalDataSource.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    return authLocalDataSource.clearToken();
  }
}
