import 'package:flutter/material.dart';

import '../../core/constant/app_color.dart';
import '../../core/theme/theme_data.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.opacityPrimayr,
              AppColor.primaryColor,
            ],
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: CustomThemeData.white18,
          ),
        ));
  }
}
