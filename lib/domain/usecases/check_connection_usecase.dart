import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../external/drivers/internet_connection_driver_impl.dart';
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
    InternetConnectionDriver connection = InternetConnectionDriverImpl();

    try {
      return right(await connection.checkInternetConnection());
    } catch (e) {
      return left(InternetConnectionDriverError());
    }
  }
}
