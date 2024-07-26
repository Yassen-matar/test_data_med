import 'package:flutter/material.dart';
import 'package:test_data_med/core/function/provider_bloc.dart';
import 'package:test_data_med/core/theme/theme_data.dart';
import 'package:test_data_med/features/auth/login/presentation/view/log_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_data_med/features/error/presentation/view/error.dart';
import 'package:test_data_med/features/home/presentation/view/home.dart';
import 'package:test_data_med/features/splash_screen/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(context),
      child: MaterialApp(
        home: const SplashScreen(),
        theme: CustomThemeData.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
