import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _userIdKey = 'userId';
  static const String _roleIdKey = 'roleId';

  static Future<void> saveUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, userId);
  }

  static Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userIdKey);
  }

  static Future<void> saveRoleId(int roleId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_roleIdKey, roleId);
  }

  static Future<int?> getRoleId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_roleIdKey);
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_roleIdKey);
  }
}
