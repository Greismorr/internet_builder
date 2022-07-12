import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../infra/drivers/internet_connection_driver.dart';

class InternetConnectionDriverImpl implements InternetConnectionDriver {
  @override
  Future<Stream<InternetConnectionStatus>> checkInternetConnection() async {
    return InternetConnectionChecker().onStatusChange;
  }
}
