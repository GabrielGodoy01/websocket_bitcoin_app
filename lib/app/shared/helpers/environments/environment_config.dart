// ignore_for_file: constant_identifier_names

import 'package:flutter_mvc_template/app/repositories/user/dio_user_repository.dart';
import 'package:flutter_mvc_template/app/repositories/user/mock_user_repository.dart';
import 'package:flutter_mvc_template/app/repositories/user/user_repository.dart';
import 'package:flutter_mvc_template/app/shared/helpers/enums/environment_enum.dart';

class EnvironmentConfig {
  static const MSS_BASE_URL = String.fromEnvironment('MSS_BASE_URL');
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static UserRepository getUserRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.DEV,
    );
    if (value == EnvironmentEnum.DEV) {
      return MockUserRepository();
    } else {
      return DioUserRepository();
    }
  }
}
