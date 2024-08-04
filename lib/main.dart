import 'package:flutter/material.dart';
import 'package:test_data_med/core/function/provider_bloc.dart';
import 'package:test_data_med/core/theme/theme_data.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_data_med/features/bloc_observer/bloc_observer.dart';
import 'package:test_data_med/features/google_map/presentation/view/google_map.dart';

import 'package:test_data_med/features/splash_screen/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(context),
      child: MaterialApp(
        home: const GoogleMapPage(),
        theme: CustomThemeData.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
