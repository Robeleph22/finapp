
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Pages/HelloPage.dart';
import '../Pages/HomePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?> (
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var user = snapshot.data;
          if (user == null) {
            return HelloPage();
          }
          return HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
