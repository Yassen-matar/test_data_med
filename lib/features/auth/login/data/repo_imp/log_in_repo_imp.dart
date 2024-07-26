// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:test_data_med/features/auth/sign_up/data/sign_up_remote_data_source.dart';

import '../../../sign_up/domin/repos/sign_up_repos.dart';
import '../../domin/repos/log_in_repos.dart';
import '../log_in_remote_data_source.dart';
import '../model/log_in_model.dart';

class LogInRepoImpl extends LogInRepo {
  LogInRomteDataSource logInRomteDataSource;
  LogInRepoImpl(this.logInRomteDataSource);
  @override
  Future<Either<Failure, LogInModel>> logIn(
      {required String email, required String password}) async {
    try {
      final result = await logInRomteDataSource.logIn(
        email: email,
        password: password,
      );
      if (result.status == true) {
        return Right(result);
      } else {
        return const Left(Failure.serverException);
      }
    } catch (_) {
      print("-------------------failure");
      return const Left(Failure.serverException);
    }
  }
}
