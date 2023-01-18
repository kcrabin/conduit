import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  final String _token = 'token';

  Future setToken(String token) async {
    await _secureStorage.write(
      key: _token,
      value: token,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _token);
  }

  Future deleteToken()async{
    
  }

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
}
