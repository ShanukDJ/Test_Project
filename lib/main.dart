import 'package:flutter/material.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/themes/custom_theme.dart';
import 'package:test_project/themes/themes.dart';


void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.of(context),
        home: Home());
  }
}


