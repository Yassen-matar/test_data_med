import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/login/data/model/log_in_model.dart';

import '../repos/log_in_repos.dart';

class LogInUseCase {
  final LogInRepo logInRepo;
  LogInUseCase(this.logInRepo);

  Future<Either<Failure, LogInModel>> call(
      {required String email, required String password}) async {
    return await logInRepo.logIn(email: email, password: password);
  }
}
