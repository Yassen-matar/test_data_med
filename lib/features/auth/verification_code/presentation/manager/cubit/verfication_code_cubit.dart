import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/server/enum.dart';
import '../../../data/model/verfication_model.dart';
import '../../../domin/use_case/verification_use_case.dart';

part 'verfication_code_state.dart';

class VerficationCodeCubit extends Cubit<VerficationCodeState> {
  VerficationUseCase verficationCodeUseCase;
  VerficationCodeCubit(this.verficationCodeUseCase)
      : super(VerficationCodeInitial());

  verficationCode(String email, String verficationCode) async {
    emit(VerficationCodeLoding());
    final Either<Failure, Verficationmodel> result =
        await verficationCodeUseCase.call(
            email: email, verficationCode: verficationCode);
    result.fold((failure) => emit(VerficationCodeFailure(failure.name)),
        (user) => emit(VerficationCodeSuccess()));
  }
}
