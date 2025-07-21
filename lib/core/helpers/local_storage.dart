import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences sharedPreferences;
  LocalStorage._();
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  static String? get token => sharedPreferences.getString('token');
}
