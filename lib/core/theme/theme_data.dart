import 'package:flutter/material.dart';
import 'package:test_data_med/core/constant/app_color.dart';

class CustomThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor:
                const Color.fromARGB(255, 238, 236, 236).withOpacity(0.105))
        /*  appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.primarycolor,
          iconTheme: const IconThemeData(color: CustomColors.fieldcolor),
          actionsIconTheme:
              IconThemeData(color: CustomColors.ticket_clip_color),
          /* brightness: Brightness.light, */
          titleTextStyle: const TextTheme(
                  bodyMedium: TextStyle(color: CustomColors.primarycolor))
              .bodyMedium), */
        );
  }

  static TextStyle white30Bold = const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static TextStyle white17 = const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
  static TextStyle white18 = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  static TextStyle white20 = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  static TextStyle white18Bold = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle grey18 = const TextStyle(
    color: Colors.grey,
    fontSize: 18,
  );
  static TextStyle grey22 = const TextStyle(
    color: Colors.grey,
    fontSize: 22,
  );
  static TextStyle black18 = const TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  static TextStyle primary25 = const TextStyle(
      color: AppColor.primaryColor, fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle primary18 = const TextStyle(
    color: AppColor.primaryColor,
    fontSize: 18,
  );

  static TextStyle primary18Bold = const TextStyle(
      color: AppColor.primaryColor, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle greate35 = const TextStyle(
      color: AppColor.greateColor, fontSize: 35, fontWeight: FontWeight.bold);

  static TextStyle iconBottomNav19Bold = const TextStyle(
      color: AppColor.iconBottomNav, fontSize: 19, fontWeight: FontWeight.bold);
}
