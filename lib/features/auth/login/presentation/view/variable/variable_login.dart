import 'package:flutter/material.dart';

mixin VariableLogin {
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode focusNodeEmail = FocusNode();

  FocusNode focusNodePassword = FocusNode();
}
