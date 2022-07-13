import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_builder/domain/usecases/check_connection_usecase.dart';
import 'package:internet_builder/external/drivers/internet_connection_driver_impl.dart';
import 'package:modular_test/modular_test.dart';

class InternetConnectionTestModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CheckConnectionUseCaseImpl(),
        ),
        Bind(
          (i) => InternetConnectionDriverImpl(),
        ),
      ];
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    initModule(InternetConnectionTestModule());
  });

  test(
    'Testa a checagem da conexão à internet do dispositivo',
    () async {
      CheckConnectionUseCase checkConnectionUseCase =
          Modular.get<CheckConnectionUseCase>();

      var checkConnectionUseCaseResult = await checkConnectionUseCase.call();

      checkConnectionUseCaseResult.fold(
        (error) => expect(error, null),
        (success) {
          expect(success, isNotNull);
        },
      );
    },
  );
}
