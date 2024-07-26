import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkConnection() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    return true;
  } else {
    return false;
  }
}
