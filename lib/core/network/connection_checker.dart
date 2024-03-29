import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class IConnectionChecker {
  Future<bool> get isConnected;
}

@Injectable(as: IConnectionChecker)
class ConnectionChecker implements IConnectionChecker {
  final InternetConnection internetConnection;
  ConnectionChecker(this.internetConnection);

  @override
  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;
}
