import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_data_med/core/constant/app_color.dart';
import 'package:test_data_med/core/constant/app_svg.dart';
import 'package:test_data_med/core/responsive/size_config.dart';
import 'package:test_data_med/features/splash_screen/presentation/view/widget/welcome.dart';
import '../manager/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.splash1,
            AppColor.splash2,
          ],
        ),
      ),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    /*   mainAxisAlignment: MainAxisAlignment.end, */
                    children: [
                      Center(
                          child: BlocProvider.of<SplashCubit>(context)
                                      .changeHeightLogo ==
                                  true
                              ? SvgPicture.asset(
                                  AppSvg.splashLogo2,
                                )
                                  .animate()
                                  .swap(
                                      duration: 700.ms,
                                      /*  delay: 300.ms, */
                                      builder: (_, __) => AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            height:
                                                BlocProvider.of<SplashCubit>(
                                                        context)
                                                    .height,
                                            child: SvgPicture.asset(
                                              AppSvg.splashLogo,
                                              /*   height: 200, */
                                            ).animate().flipH(
                                                alignment: Alignment.center),
                                          ))
                                  .move(
                                    delay: 1000.milliseconds,
                                    begin: const Offset(0, 200),
                                    end: const Offset(0, 20),
                                  )
                              : SvgPicture.asset(AppSvg.splashLogo)
                                  .animate()
                                  .swap(
                                      duration: 1.seconds,
                                      delay: 800.ms,
                                      builder: (_, __) => SvgPicture.asset(
                                            AppSvg.splashLogo2,
                                          ).animate().flipH())
                                  .move(
                                      begin: const Offset(0, -500),
                                      end: const Offset(0, 200),
                                      delay: 800.ms,
                                      curve: Curves.easeInOutBack,
                                      duration: 800.ms)
                                  .callback(
                                      delay: 1500.milliseconds,
                                      callback: (s) =>
                                          BlocProvider.of<SplashCubit>(context)
                                              .changeHeightLogofun())
                                  .animate()),
                      const Welcome()
                          .animate()
                          .fadeIn(delay: 3000.ms, duration: 3000.ms)
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
