
import 'package:flutter/material.dart';
import '../Bottom Pages/AddTransaction.dart';
import '../Bottom Pages/Wallet.dart';
import '../Bottom Pages/Dashbord.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _NavigetorBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
    WelcomePage(),
    AddTransaction(),
    AddCatagory(),
  ];

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme' : 'LightTheme';
    return Scaffold(
      body:
      _pages[_selectedIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        fixedColor: Colors.greenAccent,
        iconSize: 30,
        currentIndex: _selectedIndex,
        onTap: _NavigetorBottomBar,

        items: [
          BottomNavigationBarItem(icon:

          SizedBox(height: 25,
              child: ImageIcon(AssetImage('Icons/dashboard.png'),color: Colors.greenAccent,)),label: 'Dashbored'),

          BottomNavigationBarItem(icon:

          SizedBox(height: 25,
              child: ImageIcon(AssetImage('Icons/transaction.png'),color:Colors.greenAccent,)),label: 'Transaction'),

          BottomNavigationBarItem(icon:

          SizedBox(height: 25,
              child: ImageIcon(AssetImage('Icons/category.png'),color: Colors.greenAccent,)),label: 'Category'),



        ],
      )

    );
  }
}
