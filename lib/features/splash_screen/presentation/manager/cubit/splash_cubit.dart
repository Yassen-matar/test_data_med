import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  double height = 500;
  bool changeHeightLogo = false;
  void changeHeightLogofun() {
    changeHeightLogo = true;
    emit(state);
    height = 200;
    emit(SplashChangeHeight());
  }
}
