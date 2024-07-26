bool isEmailValid(String email) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

bool phoneNumberValidator(String val) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(val);
}

validation(
  String val,
  String type,
  context, {
  String? password,
  int? max,
  int? min,
}) {
  if (val.isEmpty) {
    return "please enter data";
  }

  if (type == 'email') {
    if (!isEmailValid(val)) {
      return "plaese Enter a correct email";
    }
  }
  if (type == "confirmPassword") {
    if (val != password) {
      return "please enter correct password";
    }
  }
  if (type == "password") {
    if (val.length < 8) {
      return "please enter more character";
    }
  }
  if (type == 'phone') {
    if (!phoneNumberValidator(val)) {
      return "please enter correct phone";
    }
  }

/*   if (val.isEmpty && type != "email") {
    return AppLocalizations.of(context)!.noData;
  } */

  // if (val.length < min) {
  //   return "It can't be smaller than $min";
  // }

  // if (val.length > max) {
  //   return "It can't be bigger than $max";
  // }
}
