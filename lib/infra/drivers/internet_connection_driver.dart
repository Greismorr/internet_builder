import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnectionDriver {
  Future<Stream<InternetConnectionStatus>> checkInternetConnection();
}
