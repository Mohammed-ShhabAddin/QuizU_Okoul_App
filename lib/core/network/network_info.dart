import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // final InternetConnectionChecker connectionChecker;
  // final SimpleConnectionChecker connectionChecker;
  final DataConnectionChecker connectionChecker;
  NetworkInfoImpl({required this.connectionChecker});

  @override
  // Future<bool> get isConnected async => await connectionChecker.hasConnection;
  Future<bool> get isConnected async =>
      await DataConnectionChecker().hasConnection;
  //bool result =
  // Future<bool> get isConnected async =>
  //     await SimpleConnectionChecker.isConnectedToInternet();
}
