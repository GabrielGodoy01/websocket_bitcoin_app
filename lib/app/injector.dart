import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvc_template/app/repositories/user/user_repository.dart';
import 'package:flutter_mvc_template/app/shared/helpers/environments/environment_config.dart';
import 'package:flutter_mvc_template/app/shared/helpers/services/dio/dio_auth_interceptor.dart';
import 'package:flutter_mvc_template/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:flutter_mvc_template/app/shared/helpers/services/http_service.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<IHttpService>(DioHttpService.new);
  injector.addLazySingleton<Dio>(() => Dio()
    ..interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(),
    ]));
  injector
      .addLazySingleton<UserRepository>(() => EnvironmentConfig.getUserRepo());
  injector.commit();
}
