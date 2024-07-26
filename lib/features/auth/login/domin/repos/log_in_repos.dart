import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';

import '../../data/model/log_in_model.dart';

abstract class LogInRepo {
  Future<Either<Failure, LogInModel>> logIn(
      {required String email, required String password});
}
