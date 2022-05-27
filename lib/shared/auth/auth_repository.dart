abstract class AuthRepository {
  Future<String?> getUser();
  Future<bool> saveUser(String user);
  Future<bool> remove();
}
