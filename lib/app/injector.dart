import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository.dart';
import 'package:flutter_mvc_template/app/shared/helpers/environments/environment_config.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.addLazySingleton<BitcoinController>(BitcoinController.new);
  injector.addLazySingleton<BitcoinRepository>(
    () => EnvironmentConfig.getUserRepo(),
  );
  injector.commit();
}
