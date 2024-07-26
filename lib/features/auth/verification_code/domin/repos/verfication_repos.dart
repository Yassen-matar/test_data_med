import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:test_data_med/features/auth/verification_code/data/model/verfication_model.dart';

abstract class VerficationRepo {
  Future<Either<Failure, Verficationmodel>> verfication(
      {required String email, required String verficationCode});
}
