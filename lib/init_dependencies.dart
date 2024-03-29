import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:injectable/injectable.dart';
import 'init_dependencies.config.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  configureDependencies();

  serviceLocator.registerFactory(() => const FlutterSecureStorage());
  serviceLocator.registerFactory(() => InternetConnection());
}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
void configureDependencies() => $initGetIt(serviceLocator);
