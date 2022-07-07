import 'package:app_desafio/app/data/repositories/breeds/breeds_repository.dart';
import 'package:app_desafio/app/data/repositories/breeds/breeds_repository_impl.dart';
import 'package:app_desafio/app/data/services/breeds/breeds_service.dart';
import 'package:app_desafio/app/data/services/breeds/breeds_service_impl.dart';
import 'package:app_desafio/app/modules/home/home_module.dart';
import 'package:app_desafio/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/auth/auth_user_repository.dart';
import 'data/repositories/auth/auth_user_repository_impl.dart';
import 'data/services/auth/auth_user_service.dart';
import 'data/services/auth/auth_user_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AuthUserService>((i) => AuthUserServiceImpl()),
        Bind.lazySingleton<AuthUserRepository>(
            (i) => AuthUserRepositoryImpl(authUserService: i())),
        Bind.lazySingleton<BreedsRepository>(
            (i) => BreedsRepositoryImpl(service: i())),
        Bind.lazySingleton<BreedsService>((i) => BreedsServiceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
