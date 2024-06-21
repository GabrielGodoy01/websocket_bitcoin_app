import 'package:dartz/dartz.dart';
import 'package:flutter_mvc_template/app/models/user_model.dart';
import 'package:flutter_mvc_template/app/shared/helpers/errors/errors.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getAll();

  Future<Either<Failure, UserModel>> insert(UserModel model);

  Future<Either<Failure, UserModel>> update(UserModel model);

  Future<Either<Failure, Unit>> delete(int id);
}
