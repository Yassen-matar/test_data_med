import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:test_data_med/features/auth/sign_up/domin/use_case/sign_up_use_case.dart';

import '../../../../../../core/function/check_internet.dart';
import '../../../../../../core/server/enum.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpUseCase signUpUseCase;
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());
  bool isCheckBox = false;
  void changeValueCheckBox() {
    isCheckBox = isCheckBox == false ? true : false;
    emit(SignUpChangeValue());
  }

  signUp(String email, String password) async {
    emit(SignUpLoding());
    if (await checkConnection()) {
      final Either<Failure, SignUpModel> result =
          await signUpUseCase.call(email: email, password: password);
      result.fold((failure) => emit(SignUpFailure(failure.name)),
          (user) => emit(SignUpSuccess()));
    } else {
      emit(SignUpNoConnection());
    }
  }
}
