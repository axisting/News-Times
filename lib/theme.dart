import 'package:flutter/material.dart';
import 'package:news_times/core/constants/view_constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: ViewConstants.appBarFontSize),
      centerTitle: true, // AppBar başlığını ortaya hizala
    ),
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // ? Diğer tema ayarlarını buraya ekleyebilirsiniz
  );
}
