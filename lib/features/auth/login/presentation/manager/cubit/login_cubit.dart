import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:test_data_med/features/auth/login/data/model/log_in_model.dart';
import 'package:test_data_med/features/auth/login/domin/use_case/log_in_use_case.dart';

import '../../../../../../core/function/check_internet.dart';
import '../../../../../../core/server/enum.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LogInUseCase logInUseCase;
  LoginCubit(this.logInUseCase) : super(LoginInitial());
  bool isCheckBox = false;
  changeValueCheckBox() {
    isCheckBox = isCheckBox == false ? true : false;
    emit(LoginChangeValue());
  }

  logIn(String email, String password) async {
    emit(LoginLoading());
    if (await checkConnection()) {
      final Either<Failure, LogInModel> result =
          await logInUseCase.call(email: email, password: password);
      result.fold((failure) => emit(LoginFailure(failure.name)),
          (user) => emit(LoginSuccess(user.data!.user!)));
    } else {
      emit(LoginNoConnection());
    }
  }
}
