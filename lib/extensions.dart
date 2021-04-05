import 'package:flutter/material.dart';

String getCurrentTimeOfDay() {
  //TODO calculate
  return 'Good evening';
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}

void hideKeyboard({BuildContext context}) {
  if (context == null) {
    FocusManager.instance.primaryFocus?.unfocus();
  } else {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

void navigateTo(BuildContext context, WidgetBuilder builder) {
  Navigator.of(context)
      .push<dynamic>(MaterialPageRoute<dynamic>(builder: builder));
}
