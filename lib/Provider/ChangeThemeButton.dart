import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themeprovider.dart';
import 'package:finapp/main.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(value: themeProvider.isDarkMode,activeColor: Colors.green,
      onChanged: (value) {
      final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
      },);
  }
}
