import 'package:flutter/material.dart';
import 'package:virtual_wearing_app_flutter/resources/colors.dart';
import 'package:virtual_wearing_app_flutter/shared/transition/transition.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primarySwatch: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      fontFamily: 'Axiforma',
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: TransitionsBuilder(),
          TargetPlatform.iOS: TransitionsBuilder(),
        },
      ),
    );
  }
}
