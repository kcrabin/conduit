import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> clearToken();

  Future<bool> isAuthenticated();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  AuthLocalDataSourceImpl(this._secureStorage);

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: 'token');
  }

  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await _secureStorage.read(key: 'token');
    return accessToken != null;
  }
}
