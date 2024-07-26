import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/theme/theme_data.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Incoming Transactions",
            style: CustomThemeData.grey22.copyWith(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "See All",
                style: CustomThemeData.primary18.copyWith(fontSize: 15),
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.greateColor,
                    size: 15,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
