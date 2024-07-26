import 'package:flutter/material.dart';

SnackBar snackBarWidget(String label) => SnackBar(
      action: SnackBarAction(
          label: label, onPressed: () {}, textColor: Colors.white),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content:
          label == 'Success' ? const Text("Welcome!") : const Text('Error!'),
      duration: const Duration(seconds: 2),
    );
