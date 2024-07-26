part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChangeValue extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  User user;
  LoginSuccess(this.user);
}

final class LoginFailure extends LoginState {
  String errorMsg;
  LoginFailure(this.errorMsg);
}

final class LoginNoConnection extends LoginState {}
