import 'package:app_desafio/app/modules/login/controller/login_controller.dart';
import 'package:app_desafio/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton((i) => LoginController(authUserRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) =>
                LoginPage(loginController: Modular.get())),
      ];
}
