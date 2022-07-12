import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_builder/domain/usecases/check_connection_usecase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test(
    'Test the device connection check interface',
    () async {
      CheckConnectionUseCase checkConnectionUseCase =
          CheckConnectionUseCaseImpl();

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
