import 'package:flutter/material.dart';

void SnackbarWidget(
    {required String textToShow,
    required int durationInMilliseconds,
    Color? backgroundColor,
    required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      showCloseIcon: true,
      content: Text(textToShow),
      duration: Duration(milliseconds: durationInMilliseconds),
    ),
  );
}
