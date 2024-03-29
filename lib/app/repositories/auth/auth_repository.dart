import '../../models/models.dart';

abstract class AuthRepository {
  Future<void> register(String name, String email, String password);
  Future<AuthModel> login(String email, String password);
}
