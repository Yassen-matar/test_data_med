part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpChangeValue extends SignUpState {}

final class SignUpLoding extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure(this.errMessage);
}

final class SignUpNoConnection extends SignUpState {}
