// ignore_for_file: constant_identifier_names

import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository_websocket.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository_mock.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository.dart';
import 'package:flutter_mvc_template/app/shared/helpers/enums/environment_enum.dart';

class EnvironmentConfig {
  static const WSS_BASE_URL = String.fromEnvironment('WSS_BASE_URL');
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static BitcoinRepository getUserRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return BitcoinRepositoryMock();
    } else {
      return BitcoinRepositoryWebsocket(
        WSS_BASE_URL,
      );
    }
  }
}
