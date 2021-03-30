import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      indicatorColor: Colors.blue,
      buttonColor: Color(0xff3B3B3B),
      hintColor: Colors.grey,
      highlightColor: Color(0xff372901),
      hoverColor: Color(0xff3A3A3B),
      focusColor: Colors.blue,
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Color(0xff3B3B3B)
      ),
      cardColor: Color(0xff1d1d1d),
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Color(0xff0f0909),
        elevation: 0.0,
      )
    );
  }
}