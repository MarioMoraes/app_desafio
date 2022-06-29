import 'package:app_desafio/app/data/repositories/dogs/dogs_repository.dart';
import 'package:app_desafio/app/data/repositories/dogs/dogs_repository_impl.dart';
import 'package:app_desafio/app/data/services/dogs/dogs_service.dart';
import 'package:app_desafio/app/data/services/dogs/dogs_service_impl.dart';
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
        Bind.lazySingleton<DogsRepository>(
            (i) => DogsRepositoryImpl(dogsService: i())),
        Bind.lazySingleton<DogsService>((i) => DogsServiceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home/', module: HomeModule()),
      ];
}
