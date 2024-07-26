import 'package:flutter/material.dart';
import 'package:test_data_med/core/constant/app_color.dart';

Future<void> showPreLoader(
  context,
) async {
  return showDialog<void>(
    context: context,
    useSafeArea: false,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.primaryColor,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircleBorder(),
        content: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(10),
          child: const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          )),
        ),
      );
    },
  );
}
