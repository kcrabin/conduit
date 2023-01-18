import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> clearToken();

  Future<bool> isAuthenticated();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final StorageService _secureStorage;

  AuthLocalDataSourceImpl(this._secureStorage);

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(StorageConstants.accessToken);
  }

  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await _secureStorage.get(StorageConstants.accessToken);
    return accessToken != null;
  }
}
