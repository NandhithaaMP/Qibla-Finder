import 'package:flutter/material.dart';

class MyTheme{
  static final darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    colorScheme:const ColorScheme.dark()
  );

  static final lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light()
  );
}