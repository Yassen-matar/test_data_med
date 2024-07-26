// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:test_data_med/features/auth/sign_up/data/model/sign_up_model.dart';

import '../../../../core/server/config.dart';

abstract class SignUpRomteDataSource {
  Future<SignUpModel> signUp({required String email, required String password});
}

class SignUpRomteDataSourceImpl extends SignUpRomteDataSource {
  int maxAttempts = 8;
  int timeout = 30;
  @override
  Future<SignUpModel> signUp(
      {required String email, required String password}) async {
    final r = RetryOptions(maxAttempts: maxAttempts);
    http.Response response = await r.retry(
      () => http.post(
        Uri.parse(
          ConfigApi.signUp,
        ),
        body: {"email": email, "password": password, 'name': email},
      ).timeout(
        Duration(seconds: timeout),
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      return SignUpModel.fromJson(
        json.decode(response.body),
      );
    } else {
      print("Failed to Sign Up ");
      throw Exception("Failed to Sign Up ");
    }
  }
}
