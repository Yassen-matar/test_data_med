part of 'verfication_code_cubit.dart';

sealed class VerficationCodeState {}

final class VerficationCodeInitial extends VerficationCodeState {}

final class VerficationCodeLoding extends VerficationCodeState {}

final class VerficationCodeSuccess extends VerficationCodeState {}

final class VerficationCodeFailure extends VerficationCodeState {
  String errorMsg;
  VerficationCodeFailure(this.errorMsg);
}
