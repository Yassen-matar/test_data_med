// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:test_data_med/features/auth/sign_up/data/sign_up_remote_data_source.dart';

import '../../domin/repos/sign_up_repos.dart';

class SignUpRepoImpl extends SignUpRepo {
  SignUpRomteDataSource signUpRomteDataSource;
  SignUpRepoImpl(this.signUpRomteDataSource);
  @override
  Future<Either<Failure, SignUpModel>> signUp(
      {required String email, required String password}) async {
    try {
      final result = await signUpRomteDataSource.signUp(
        email: email,
        password: password,
      );
      if (result.status == true) {
        return Right(result);
      } else {
        return const Left(Failure.TheeAccountHasBeenCreatedBefore);
      }
    } catch (_) {
      return const Left(Failure.serverException);
    }
  }
}
