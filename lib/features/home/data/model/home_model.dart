import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_data_med/core/constant/app_image.dart';
import 'package:test_data_med/core/constant/app_svg.dart';

import '../../../../core/constant/app_color.dart';

class HomeModel {
  static List<BottomNavBar> bottomNav = [
    BottomNavBar(AppSvg.home, Colors.white, true),
    BottomNavBar(AppSvg.wallet, AppColor.iconBottomNav, false),
    BottomNavBar(AppSvg.cart, AppColor.iconBottomNav, false),
    BottomNavBar(AppSvg.user, AppColor.iconBottomNav, false),
  ];
  static List<SectionPayment> sectionPayment = [
    SectionPayment("VISA", "Master Card . 6253", "\$758964.10", AppSvg.visa),
    SectionPayment("VISA", "Master Card . 6253", "\$758964.10", AppSvg.visa),
    SectionPayment("VISA", "Master Card . 6253", "\$758964.10", AppSvg.visa),
    SectionPayment("VISA", "Master Card . 6253", "\$758964.10", AppSvg.visa)
  ];
  static List<PersoneCart> personeCart = [
    PersoneCart(
        "Johnny Bairstow", "23 December 2020", "\$54.23", AppImage.persone1, [
      const FlSpot(0, 1),
      const FlSpot(1, 1.5),
      const FlSpot(2, 1.4),
      const FlSpot(3, 3.4),
      const FlSpot(4, 2),
      const FlSpot(5, 2.2),
      const FlSpot(6, 4),
    ]),
    PersoneCart(
        "Johnny Bairstow", "23 December 2020", "\$62.54", AppImage.persone2, [
      const FlSpot(0, 3),
      const FlSpot(1, 2),
      const FlSpot(2, 5),
      const FlSpot(3, 3.1),
      const FlSpot(4, 4),
      const FlSpot(5, 3),
      const FlSpot(6, 2),
    ]),
    PersoneCart(
        "Johnny Bairstow", "23 December 2020", "\$396.84", AppImage.persone3, [
      const FlSpot(0, 3),
      const FlSpot(1, 2),
      const FlSpot(2, 5),
      const FlSpot(3, 3.1),
      const FlSpot(4, 3.5),
      const FlSpot(5, 3),
      const FlSpot(6, 4),
    ]),
    PersoneCart(
        "Johnny Bairstow", "23 December 2020", "\$45.21", AppImage.persone4, [
      const FlSpot(0, 3),
      const FlSpot(1, 2),
      const FlSpot(2, 5),
      const FlSpot(3, 3.1),
      const FlSpot(4, 4),
      const FlSpot(5, 3),
      const FlSpot(6, 4),
    ]),
  ];
}

class SectionPayment {
  String name;
  String type;
  String salary;
  String imagePath;
  SectionPayment(this.name, this.type, this.salary, this.imagePath);
}

class BottomNavBar {
  String iconType;
  Color color;
  bool selected;
  BottomNavBar(this.iconType, this.color, this.selected);
}

class PersoneCart {
  String salary;
  String name;
  String date;
  String imagePath;
  List<FlSpot> spots;
  PersoneCart(this.name, this.date, this.salary, this.imagePath, this.spots);
}
