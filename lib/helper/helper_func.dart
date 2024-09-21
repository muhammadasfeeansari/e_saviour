import 'package:flutter/material.dart';

// show error massage to a user
void displayErrorMassage(String massage, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(massage),
    ),
  );
}
