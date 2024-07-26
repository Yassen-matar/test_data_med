import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_data_med/features/auth/login/data/log_in_remote_data_source.dart';
import 'package:test_data_med/features/auth/login/data/repo_imp/log_in_repo_imp.dart';
import 'package:test_data_med/features/auth/login/domin/use_case/log_in_use_case.dart';
import 'package:test_data_med/features/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:test_data_med/features/auth/sign_up/data/repo_imp/sign_up_repo_imp.dart';
import 'package:test_data_med/features/auth/sign_up/data/sign_up_remote_data_source.dart';
import 'package:test_data_med/features/auth/sign_up/domin/repos/sign_up_repos.dart';
import 'package:test_data_med/features/auth/sign_up/domin/use_case/sign_up_use_case.dart';
import 'package:test_data_med/features/auth/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:test_data_med/features/home/presentation/manager/cubit/home_cubit.dart';

import '../../features/auth/verification_code/data/repo_imp/verfication_repo_imp.dart';
import '../../features/auth/verification_code/data/verfication_remote_data_source.dart';
import '../../features/auth/verification_code/domin/use_case/verification_use_case.dart';
import '../../features/auth/verification_code/presentation/manager/cubit/verfication_code_cubit.dart';
import '../../features/splash_screen/presentation/manager/cubit/splash_cubit.dart';

providers(context) {
  return [
    BlocProvider(
      create: (context) {
        return SplashCubit();
      },
    ),
    BlocProvider(
      create: (context) {
        return SignUpCubit(
            SignUpUseCase(SignUpRepoImpl(SignUpRomteDataSourceImpl())));
      },
    ),
    BlocProvider(
      create: (context) {
        return VerficationCodeCubit(VerficationUseCase(
            VerficationRepoImpl(VerficationRomteDataSourceImpl())));
      },
    ),
    BlocProvider(
      create: (context) {
        return LoginCubit(
            LogInUseCase(LogInRepoImpl(LogInRomteDataSourceImpl())));
      },
    ),
    BlocProvider(
      create: (context) {
        return HomeCubit();
      },
    ),
  ];
}
