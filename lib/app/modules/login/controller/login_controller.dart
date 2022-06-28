import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth/auth_user_repository.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthUserRepository _authUserRepository;

  LoginController({required AuthUserRepository authUserRepository})
      : _authUserRepository = authUserRepository,
        super(LoginStateInitial());

  Future<void> signIn(String email) async {
    try {
      emit(LoginStateLoading());
      var logged = await _authUserRepository.login(email);
      emit(LoginStateLoaded(logged: logged));
    } catch (e, s) {
      log('Erro Ao Realizar Login', error: e, stackTrace: s);
      emit(LoginStateError());
    }
  }
}
