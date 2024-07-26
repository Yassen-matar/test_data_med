import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../data/model/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  changeIconBottomNav(BottomNavBar e) {
    int checkTrue =
        HomeModel.bottomNav.indexWhere((fruit) => fruit.selected == true);
    if (checkTrue != -1) {
      HomeModel.bottomNav[checkTrue].selected = false;
      HomeModel.bottomNav[checkTrue].color = AppColor.iconBottomNav;
      e.selected = true;
      e.color = Colors.white;
    }
    emit(HomeChangeIconBottomNav());
  }
}
