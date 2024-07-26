// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'package:test_data_med/features/auth/verification_code/data/model/verfication_model.dart';

import '../../../../core/server/config.dart';

abstract class VerficationRomteDataSource {
  Future<Verficationmodel> verfication(
      {required String email, required String verficationCode});
}

class VerficationRomteDataSourceImpl extends VerficationRomteDataSource {
  int maxAttempts = 8;
  int timeout = 30;
  @override
  Future<Verficationmodel> verfication(
      {required String email, required String verficationCode}) async {
    print(email);
    final r = RetryOptions(maxAttempts: maxAttempts);
    http.Response response = await r.retry(
      () => http.post(
        Uri.parse(
          ConfigApi.verifyCodeSignUp,
        ),
        body: {
          "email": email,
          "verification_code": verficationCode,
        },
      ).timeout(
        Duration(seconds: timeout),
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Verficationmodel.fromJson(
        json.decode(response.body),
      );
    } else {
      print("Failed to Verfication ");
      throw Exception("Failed to  Verfication ");
    }
  }
}
