import 'package:shared_preferences/shared_preferences.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String?> getUser() async {
    try {
      final SharedPreferences instance = await SharedPreferences.getInstance();
      return instance.getString('user');
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> saveUser(String user) async {
    try {
      final SharedPreferences instance = await SharedPreferences.getInstance();
      await instance.setString('user', user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> remove() async {
    try {
      final SharedPreferences instance = await SharedPreferences.getInstance();
      await instance.remove('user');
      return true;
    } catch (e) {
      return false;
    }
  }
}
