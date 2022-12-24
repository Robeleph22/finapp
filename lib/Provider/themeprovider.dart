import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode= isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.grey[800],
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white),
    bottomAppBarColor: Colors.white,
    textTheme: TextTheme(caption: TextStyle(color: Colors.white)),
    backgroundColor: Colors.grey[900],
    bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor: Colors.black),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white70,
      primaryColor: Colors.black,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Colors.white),
      bottomAppBarColor: Colors.black,
      textTheme: TextTheme(caption: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor: Colors.brown[50]),
  );
}