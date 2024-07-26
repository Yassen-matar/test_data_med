import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:test_data_med/core/constant/app_color.dart';
import 'package:test_data_med/core/theme/theme_data.dart';
import 'package:test_data_med/features/auth/login/presentation/view/log_in.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/view/variable/variable_sign_up.dart';
import 'package:test_data_med/features/auth/verification_code/presentation/manager/cubit/verfication_code_cubit.dart';
import 'package:test_data_med/features/widget/custom_loding.dart';
import 'package:test_data_med/global.dart' as globals;
import '../../../../../core/function/snack_bar.dart';

class VerificationCodeSignUp extends StatelessWidget with VariableSignUp {
  VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<VerficationCodeCubit, VerficationCodeState>(
        listener: (context, state) {
          if (state is VerficationCodeSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Login(),
            ));
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          }
          if (state is VerficationCodeFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errorMsg));
          }
        },
        builder: (context, state) {
          if (state is VerficationCodeLoding) {
            return const CustomLoading();
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Verfication Code please",
                    style: CustomThemeData.primary25,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We have emailed you a verification code",
                    style: CustomThemeData.black18,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: AppColor.primaryColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) async {
                      await BlocProvider.of<VerficationCodeCubit>(context)
                          .verficationCode(
                              globals.email.text, verificationCode);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
