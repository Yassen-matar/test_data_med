import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_data_med/core/constant/app_color.dart';

import 'package:test_data_med/core/theme/theme_data.dart';
import 'package:test_data_med/features/home/data/model/home_model.dart';
import 'package:test_data_med/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:test_data_med/features/home/presentation/view/widget/payment_cart.dart';

import 'widget/cart_persone.dart';
import 'widget/see_all.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        surfaceTintColor: Colors.white.withOpacity(0.95),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Current Balance",
                      style: CustomThemeData.grey18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "\$2,85,856.20",
                      style: CustomThemeData.greate35
                          .copyWith(color: AppColor.greateColor),
                    ),
                  ),
                  const PaymentCart(),
                  const SeeAll(),
                  CartPersone(
                    iconPlusOrSub: Icons.add,
                    icon: Icons.call_received,
                    iconColor: AppColor.iconBottomNav,
                    gradient: [
                      AppColor.iconBottomNav,
                      const Color.fromARGB(255, 156, 216, 247).withOpacity(0.2)
                    ],
                  ),
                  const SeeAll(),
                  CartPersone(
                    iconPlusOrSub: Icons.minimize,
                    icon: Icons.call_made_rounded,
                    iconColor: AppColor.greateColor,
                    gradient: [
                      AppColor.greateColor,
                      AppColor.greateColor.withOpacity(0.2)
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ],
              )),
            ),
          ),
          Positioned(
            bottom: 10,
            child: SafeArea(
              child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...HomeModel.bottomNav.map((e) => Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {
                                        BlocProvider.of<HomeCubit>(context)
                                            .changeIconBottomNav(e);
                                      },
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: e.selected == true
                                            ? AppColor.greateColor
                                            : Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            e.iconType,
                                            // ignore: deprecated_member_use
                                            color: e.color,
                                            width: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          );
                        },
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
