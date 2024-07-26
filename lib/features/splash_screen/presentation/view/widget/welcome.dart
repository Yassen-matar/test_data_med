import 'package:flutter/material.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/sign_up.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_svg.dart';
import '../../../../../core/responsive/size_config.dart';
import '../../../../../core/theme/theme_data.dart';
import 'custom_button_welcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Lorem ipsum",
            style: CustomThemeData.white30Bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: SizedBox(
            width: responsive_size(300, asMaxSize: true),
            child: Text(
              "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              textAlign: TextAlign.center,
              style: CustomThemeData.white17,
            ),
          ),
        ),
        CustomButtonWelcome(
          color: AppColor.blueFacebook,
          text: "Sign Up With Facebook",
          svg: AppSvg.facebook,
          style: CustomThemeData.white18,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButtonWelcome(
            color: Colors.white,
            text: "Sign Up With Google",
            svg: AppSvg.google,
            style: CustomThemeData.grey18),
        const SizedBox(
          height: 35,
        ),
        Wrap(
          children: [
            Text(
              "Already have an account?",
              style: CustomThemeData.white18,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SignUp(),
                ));
              },
              child: Text(
                " Sign In",
                style: CustomThemeData.white18Bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
