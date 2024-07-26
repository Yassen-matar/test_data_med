import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_data_med/core/constant/app_color.dart';
import 'package:test_data_med/core/constant/app_svg.dart';
import 'package:test_data_med/core/theme/theme_data.dart';

import '../../../home/presentation/view/home.dart';

class Greate extends StatelessWidget {
  const Greate({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: (height * 15) / 100,
              left: (width * 36) / 100,
              child: SvgPicture.asset(AppSvg.true2)),
          Positioned(
              left: (width * 25) / 100,
              top: (height * 19) / 100,
              child: SvgPicture.asset(AppSvg.true1)),
          Positioned(
              left: (width * 40) / 100,
              top: (height * 26) / 100,
              child: SvgPicture.asset(AppSvg.trueLogo)),
          Positioned(
              bottom: (height * 60) / 100,
              left: (width * 18) / 100,
              child: SvgPicture.asset(AppSvg.true3)),
          Positioned(
              bottom: (height * 51) / 100,
              right: (width * 25) / 100,
              child: SvgPicture.asset(AppSvg.true3)),
          Positioned(
            top: (height * 58) / 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congrats!",
                  style: CustomThemeData.greate35.copyWith(fontSize: 50),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 60),
                  alignment: Alignment.center,
                  width: 150,
                  child: Text(
                    "Account Registed Successfully",
                    style: CustomThemeData.grey18,
                    textAlign: TextAlign.center,
                  ),
                ),
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  color: AppColor.greateColor,
                  child: Text(
                    "Great!",
                    style: CustomThemeData.white20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
