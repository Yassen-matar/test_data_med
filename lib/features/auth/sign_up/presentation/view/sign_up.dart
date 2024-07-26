import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_data_med/core/theme/theme_data.dart';
import 'package:test_data_med/features/auth/login/presentation/view/log_in.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/validation.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/variable/variable_sign_up.dart';
import 'package:test_data_med/features/widget/custom_loding.dart';
import 'package:test_data_med/features/widget/custom_text_form_feild.dart';
import 'package:test_data_med/global.dart' as globals;
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/function/snack_bar.dart';
import '../../../../error/presentation/view/error.dart';
import '../../../../widget/custom_button_auth.dart';
import '../../../verification_code/presentation/view/verification_code.dart';

class SignUp extends StatefulWidget with VariableSignUp {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    widget.userName.dispose();
    widget.number.dispose();
    globals.email.dispose();
    widget.password.dispose();
    widget.confirmPassword.dispose();
    widget.focusNodeUsername.dispose();
    widget.focusNodeNumber.dispose();
    widget.focusNodeEmail.dispose();
    widget.focusNodePassword.dispose();
    widget.focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => VerificationCodeSignUp(),
            ));
          }
          if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errMessage));
          }
          if (state is SignUpNoConnection) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ErrorScreen(),
            ));
          }
        },
        builder: (context, state) {
          if (state is SignUpLoding) {
            return const CustomLoading();
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Sign Up your account",
                        style: CustomThemeData.primary25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: widget.formKeySignUp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: CustomThemeData.black18,
                          ),
                          CustomTextFormField(
                            hintText: "User Name",
                            focusNode: widget.focusNodeUsername,
                            mycontroller: widget.userName,
                            validator: (val) =>
                                validation(val!, "userName", context),
                          ),
                          Text(
                            "Number",
                            style: CustomThemeData.black18,
                          ),
                          CustomTextFormField(
                              focusNode: widget.focusNodeNumber,
                              hintText: "Number",
                              iconData: Text(
                                "09",
                                style: CustomThemeData.black18
                                    .copyWith(fontSize: 17),
                              ),
                              validator: (val) =>
                                  validation(val!, "phone", context),
                              obscureText: true,
                              mycontroller: widget.number),
                          Text(
                            "Email",
                            style: CustomThemeData.black18,
                          ),
                          CustomTextFormField(
                              focusNode: widget.focusNodeEmail,
                              hintText: "Email",
                              validator: (val) =>
                                  validation(val!, "email", context),
                              mycontroller: globals.email),
                          Text(
                            "Password",
                            style: CustomThemeData.black18,
                          ),
                          CustomTextFormField(
                              focusNode: widget.focusNodePassword,
                              hintText: "Password",
                              obscureText: true,
                              validator: (val) =>
                                  validation(val!, "password", context),
                              mycontroller: widget.password),
                          Text(
                            "Confirm Password",
                            style: CustomThemeData.black18,
                          ),
                          CustomTextFormField(
                              hintText: "Confirm Password",
                              obscureText: true,
                              validator: (val) => validation(
                                  val!,
                                  "confirmPassword",
                                  password: widget.password.text,
                                  context),
                              focusNode: widget.focusNodeConfirmPassword,
                              mycontroller: widget.confirmPassword),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                      onPressed: () async {
                        if (widget.formKeySignUp.currentState!.validate()) {
                          await BlocProvider.of<SignUpCubit>(context)
                              .signUp(globals.email.text, widget.password.text);
                        }
                        widget.focusNodeUsername.unfocus();
                        widget.focusNodeNumber.unfocus();
                        widget.focusNodeEmail.unfocus();
                        widget.focusNodePassword.unfocus();
                        widget.focusNodeConfirmPassword.unfocus();
                      },
                      text: "Sign Up",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /* change value check box */
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: BlocProvider.of<SignUpCubit>(context)
                                .isCheckBox,
                            onChanged: (value) {
                              BlocProvider.of<SignUpCubit>(context)
                                  .changeValueCheckBox();
                            }),
                        Text(
                          "Remember me",
                          style: CustomThemeData.black18,
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Already have an account?",
                          style: CustomThemeData.primary18,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                          },
                          child: Text(
                            " Log In",
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
