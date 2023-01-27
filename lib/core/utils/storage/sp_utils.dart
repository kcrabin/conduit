import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  Future setString(String key, String value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString(key, value);
  }

  Future getString(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
