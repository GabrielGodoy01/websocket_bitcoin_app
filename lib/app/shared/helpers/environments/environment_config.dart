// ignore_for_file: constant_identifier_names

import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket_impl.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket_mock.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket.dart';
import 'package:flutter_mvc_template/app/shared/helpers/enums/environment_enum.dart';

class EnvironmentConfig {
  static const WSS_BASE_URL = String.fromEnvironment('WSS_BASE_URL');
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static IBitcoinWebsocket getUserRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return BitcoinWebsocketMock();
    } else {
      return BitcoinWebsocketImpl(
        WSS_BASE_URL,
      );
    }
  }
}
