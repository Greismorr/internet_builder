
import 'package:internet_builder/infra/drivers/internet_connection_driver.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionDriverProvider implements InternetConnectionDriver {
  @override
  Future<Stream<InternetConnectionStatus>> checkInternetConnection() async {
    return InternetConnectionChecker().onStatusChange;
  }
}
