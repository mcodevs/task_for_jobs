import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
        showCloseIcon: true,
      ),
    );
}
