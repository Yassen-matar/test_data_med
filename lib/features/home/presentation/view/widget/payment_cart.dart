import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/theme/theme_data.dart';
import '../../../data/model/home_model.dart';

class PaymentCart extends StatelessWidget {
  const PaymentCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...HomeModel.sectionPayment.map(
            (e) => Container(
                margin: const EdgeInsets.only(right: 10, top: 35),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greateColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(e.imagePath),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(e.name),
                        Text(
                          e.type,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      e.salary,
                      overflow: TextOverflow.ellipsis,
                      style: CustomThemeData.primary18.copyWith(
                          color: AppColor.greateColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
