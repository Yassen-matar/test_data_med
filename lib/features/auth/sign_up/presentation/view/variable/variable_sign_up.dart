import 'package:flutter/material.dart';

mixin VariableSignUp {
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController number = TextEditingController();
  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeNumber = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();
}
