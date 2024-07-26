import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_data_med/core/theme/theme_data.dart';
import 'package:test_data_med/features/auth/login/presentation/view/variable/variable_login.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/sign_up.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/validation.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/variable/variable_sign_up.dart';
import 'package:test_data_med/features/greate/presentation/view/greate.dart';
import 'package:test_data_med/features/widget/custom_loding.dart';
import 'package:test_data_med/features/widget/custom_text_form_feild.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/function/snack_bar.dart';
import '../../../../error/presentation/view/error.dart';
import '../../../../widget/custom_button_auth.dart';
import '../manager/cubit/login_cubit.dart';

class Login extends StatefulWidget with VariableLogin {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    widget.email.dispose();
    widget.password.dispose();
    widget.focusNodeEmail.dispose();
    widget.focusNodePassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Greate(),
            ));
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errorMsg));
          }
          if (state is LoginNoConnection) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ErrorScreen(),
            ));
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const CustomLoading();
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Log in to your account",
                        style: CustomThemeData.primary25,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: widget.formKeyLogin,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email",
                              style: CustomThemeData.black18,
                            ),
                          ),
                          CustomTextFormField(
                              focusNode: widget.focusNodeEmail,
                              hintText: "Email",
                              minPadding: 15,
                              validator: (val) =>
                                  validation(val!, "email", context),
                              mycontroller: widget.email),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Password",
                              style: CustomThemeData.black18,
                            ),
                          ),
                          CustomTextFormField(
                              focusNode: widget.focusNodePassword,
                              hintText: "Password",
                              minPadding: 15,
                              obscureText: true,
                              validator: (val) =>
                                  validation(val!, "password", context),
                              mycontroller: widget.password),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButtonAuth(
                      onPressed: () async {
                        if (widget.formKeyLogin.currentState!.validate()) {
                          await BlocProvider.of<LoginCubit>(context)
                              .logIn(widget.email.text, widget.password.text);
                        }
                        widget.focusNodeEmail.unfocus();
                        widget.focusNodePassword.unfocus();
                      },
                      text: "Log in ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    /* change value check box */
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Checkbox(
                              activeColor: AppColor.primaryColor,
                              value: BlocProvider.of<LoginCubit>(context)
                                  .isCheckBox,
                              onChanged: (value) {
                                BlocProvider.of<LoginCubit>(context)
                                    .changeValueCheckBox();
                              }),
                          Text(
                            "Remember me",
                            style: CustomThemeData.black18,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        "Forget password?",
                        style: CustomThemeData.primary18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum",
                        style: CustomThemeData.black18,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: CustomThemeData.primary18,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                          },
                          child: Text(
                            " Sign Up",
                            style: CustomThemeData.primary18Bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
