// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/verification_code/data/model/verfication_model.dart';
import 'package:test_data_med/features/auth/verification_code/data/verfication_remote_data_source.dart';

import '../../domin/repos/verfication_repos.dart';

class VerficationRepoImpl extends VerficationRepo {
  VerficationRomteDataSource verficationRomteDataSource;
  VerficationRepoImpl(this.verficationRomteDataSource);
  @override
  Future<Either<Failure, Verficationmodel>> verfication(
      {required String email, required String verficationCode}) async {
    try {
      final result = await verficationRomteDataSource.verfication(
        email: email,
        verficationCode: verficationCode,
      );
      if (result.status == true) {
        return Right(result);
      } else {
        return const Left(Failure.serverException);
      }
    } catch (_) {
      return const Left(Failure.serverException);
    }
  }
}
