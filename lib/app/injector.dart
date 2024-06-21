import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket.dart';
import 'package:flutter_mvc_template/app/shared/helpers/environments/environment_config.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<BitcoinController>(BitcoinController.new);
  injector.add<IBitcoinWebsocket>(
    () => EnvironmentConfig.getUserRepo(),
  );
  injector.commit();
}
