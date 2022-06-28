import 'package:app_desafio/app/modules/home/controller/home_controller.dart';
import 'package:app_desafio/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => HomeController(dogsRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => HomePage(homeController: Modular.get())),
      ];
}
