

import 'package:finapp/DataBase/DataBase.dart';
import 'package:flutter/material.dart';
import '../Pages/HelloPage.dart';
import '../Pages/HomePage.dart';
import '../Pages/SigninPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
        var user = AppDataBase.getToken();
        if (user == null) {
          return const HelloPage();
        }
        return HomePage();
    }
    );
  }
}
