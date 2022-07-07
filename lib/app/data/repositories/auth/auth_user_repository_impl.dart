import './auth_user_repository.dart';
import '../../services/auth/auth_user_service.dart';

class AuthUserRepositoryImpl implements AuthUserRepository {
  final AuthUserService _authUserService;

  AuthUserRepositoryImpl({
    required AuthUserService authUserService,
  }) : _authUserService = authUserService;

  @override
  Future<bool> login(String email) async => await _authUserService.login(email);
}
