// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_data_med/core/constant/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final bool enableSelection;
  TextStyle hintStyle;
  final bool obscureText;
  final Widget? iconData;
  final Widget? iconPassword;
  final String hintText;
  final int maxLines;
  final bool autofocus;
  final String? Function(String?)? validator;
  final TextEditingController mycontroller;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final bool password;
  final FocusNode? focusNode;
  final void Function()? onTapText;
  final double radius;
  final double minPadding;

  CustomTextFormField({
    super.key,
    this.onTapText,
    this.maxLines = 1,
    this.keyboardType,
    this.onTap,
    this.autofocus = false,
    this.enableSelection = false,
    this.obscureText = false,
    required this.hintText,
    this.validator,
    required this.mycontroller,
    this.iconData,
    this.password = false,
    this.iconPassword,
    this.focusNode,
    this.radius = 10,
    this.minPadding = 10,
    this.hintStyle =
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 200, 223, 245),
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0)
          ],
        ),
        child: TextFormField(
            onTap: onTapText,
            autofocus: autofocus,
            autovalidateMode: AutovalidateMode.disabled,
            maxLines: maxLines, //or null
            focusNode: focusNode,
            controller: mycontroller,
            keyboardType: keyboardType,
            enableInteractiveSelection: true,
            obscuringCharacter: '*',
            obscureText: obscureText,
            //validate
            validator: validator,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hoverColor: Colors.white,
              contentPadding: EdgeInsetsDirectional.all(minPadding),
              suffixIcon: password == true
                  ? InkWell(
                      onTap: onTap,
                      child: iconPassword,
                    )
                  : iconPassword,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 25.0, top: 10, bottom: 5),
                child: iconData,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(width: 0, color: Colors.white)),

              ///error border
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
              //label
              hintText: hintText,
              hintStyle: hintStyle,
              ///////enable border
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(width: 0, color: Colors.white)),
              ////////
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(width: 0, color: Colors.white)),
            )),
      ),
    );
  }
}
