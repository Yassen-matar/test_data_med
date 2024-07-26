import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/function/chart_cart_persone.dart';
import '../../../../../core/theme/theme_data.dart';
import '../../../data/model/home_model.dart';

class CartPersone extends StatelessWidget {
  IconData icon;
  IconData iconPlusOrSub;
  List<Color> gradient;
  Color iconColor;
  CartPersone({
    required this.icon,
    required this.iconPlusOrSub,
    required this.gradient,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...HomeModel.personeCart.map(
            (e) => Container(
                height: 250,
                /*   width: 187, */
                margin: const EdgeInsets.only(right: 10, top: 20),
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 250, 250),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 150,
                          child: chartCartPersone(e.spots, 200.0, gradient)),
                    ),
                    Positioned(bottom: 10, left: 20, child: Text(e.date)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(e.imagePath),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icon,
                                    color: iconColor,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      Padding(
                                        padding: iconPlusOrSub == Icons.minimize
                                            ? EdgeInsets.zero
                                            : const EdgeInsets.only(top: 3),
                                        child: Icon(
                                          iconPlusOrSub,
                                          color: iconColor,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          e.salary,
                                          style: CustomThemeData
                                              .iconBottomNav19Bold
                                              .copyWith(color: iconColor),
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Form",
                                  style: CustomThemeData.grey18
                                      .copyWith(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                  width: 80,
                                  child: Text(
                                    e.name,
                                    style: CustomThemeData.black18
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
