import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpModel>> signUp(
      {required String email, required String password});
}
