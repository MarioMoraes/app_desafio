import 'dart:convert';

import 'package:app_desafio/app/data/models/auth_user_model.dart';
import 'package:flutter/services.dart';

import './auth_user_service.dart';

class AuthUserServiceImpl implements AuthUserService {
  @override
  Future<bool> login(String email) async {
    final response = await _loadJson('auth_user.json');

    final responseAPI = jsonDecode(response)
        .map<AuthUserModel>(((e) => AuthUserModel.fromMap(e)))
        .toList();

    for (var user in responseAPI) {
      if (user.email == email) {
        return true;
      }
    }

    return false;
  }

  Future<String> _loadJson(String file) {
    return rootBundle.loadString('assets/json/$file');
  }
}
