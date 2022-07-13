import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../infra/drivers/internet_connection_driver.dart';
import '../errors/internet_connection_driver_errors.dart';

abstract class CheckConnectionUseCase {
  Future<
      Either<InternetConnectionDriverError,
          Stream<InternetConnectionStatus>>> call();
}

class CheckConnectionUseCaseImpl implements CheckConnectionUseCase {
  @override
  Future<
      Either<InternetConnectionDriverError,
          Stream<InternetConnectionStatus>>> call() async {
    InternetConnectionDriver connection =
        Modular.get<InternetConnectionDriver>();

    try {
      return right(await connection.checkInternetConnection());
    } catch (e) {
      return left(InternetConnectionDriverError());
    }
  }
}
