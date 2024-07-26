import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/verification_code/data/model/verfication_model.dart';
import 'package:test_data_med/features/auth/verification_code/domin/repos/verfication_repos.dart';

class VerficationUseCase {
  final VerficationRepo verficationRepo;
  VerficationUseCase(this.verficationRepo);

  Future<Either<Failure, Verficationmodel>> call(
      {required String email, required String verficationCode}) async {
    return await verficationRepo.verfication(
        email: email, verficationCode: verficationCode);
  }
}
