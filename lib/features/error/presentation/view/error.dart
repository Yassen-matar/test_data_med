import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_data_med/core/constant/app_color.dart';

import '../../../../core/constant/app_svg.dart';
import '../../../../core/theme/theme_data.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.errorColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0, right: 0, child: SvgPicture.asset(AppSvg.error1)),
            Positioned(top: 0, left: 0, child: SvgPicture.asset(AppSvg.error2)),
            Positioned(
                top: (height * 13) / 100,
                left: (width * 30) / 100,
                child: SvgPicture.asset(AppSvg.error3)),
            Positioned(
                left: (width * 15) / 100,
                top: (height * 19) / 100,
                child: SvgPicture.asset(AppSvg.error)),
            Positioned(
                bottom: (height * 10) / 100,
                right: (width * 25) / 100,
                child: SvgPicture.asset(AppSvg.error4)),
            Positioned(
                bottom: 0, left: 0, child: SvgPicture.asset(AppSvg.error5)),
            Positioned(
              top: (height * 50) / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Oops!",
                    style: CustomThemeData.white18Bold.copyWith(fontSize: 50),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "Something went wrong!",
                      style: CustomThemeData.white18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColor.errorButtonGradient2,
                            AppColor.errorButtonGradient1,
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Back to Homepage",
                          style: CustomThemeData.white17,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
