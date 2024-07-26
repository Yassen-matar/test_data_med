import 'package:dartz/dartz.dart';
import 'package:test_data_med/core/server/enum.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:test_data_med/features/auth/sign_up/domin/repos/sign_up_repos.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;
  SignUpUseCase(this.signUpRepo);

  Future<Either<Failure, SignUpModel>> call(
      {required String email, required String password}) async {
    return await signUpRepo.signUp(email: email, password: password);
  }
}
