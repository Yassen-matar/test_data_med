// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import '../../../../core/server/config.dart';
import 'model/log_in_model.dart';

abstract class LogInRomteDataSource {
  Future<LogInModel> logIn({required String email, required String password});
}

class LogInRomteDataSourceImpl extends LogInRomteDataSource {
  int maxAttempts = 8;
  int timeout = 30;
  @override
  Future<LogInModel> logIn(
      {required String email, required String password}) async {
    final r = RetryOptions(maxAttempts: maxAttempts);
    http.Response response = await r.retry(
      () => http.post(
        Uri.parse(
          ConfigApi.logIn,
        ),
        body: {
          "email": email,
          "password": password,
        },
      ).timeout(
        Duration(seconds: timeout),
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return LogInModel.fromJson(
        json.decode(response.body),
      );
    } else {
      print("Failed to LogIn ");
      throw Exception("Failed to LogIn ");
    }
  }
}
