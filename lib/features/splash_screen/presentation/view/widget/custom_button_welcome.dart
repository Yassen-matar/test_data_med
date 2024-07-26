import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/responsive/size_config.dart';

class CustomButtonWelcome extends StatelessWidget {
  final Color color;
  final String text;
  final String svg;
  final TextStyle? style;
  const CustomButtonWelcome(
      {super.key,
      required this.color,
      required this.text,
      required this.svg,
      this.style});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: responsive_size(300, asMaxSize: true),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(10),
        onPressed: () {},
        color: color,
        child: ListTile(
          minTileHeight: 0,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 7,
          leading: SvgPicture.asset(svg),
          title: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
