import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Drawer Pages/About.dart';
import '../Drawer Pages/ProfilePage.dart';
import '../Drawer Pages/SettingPage.dart';
import '../Pages/HelloPage.dart';
import '../Provider/ChangeThemeButton.dart';
import '../auth/signinwithgoogle.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:
      AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blueGrey.shade900,
        title: Center(child: Text('Add Income',style: TextStyle(color: Colors.white))),
      ),
      drawer: Drawer(
        child: Container(
          color:Colors.grey.shade900,
          child: ListView(
            children: [
              SizedBox(height: 180,
                child: UserAccountsDrawerHeader(currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,

                  ),
                  accountName: Text(
                      "${FirebaseAuth.instance.currentUser?.displayName}",style: GoogleFonts.bebasNeue(fontSize: 30, color: Theme.of(context).textTheme.caption?.color)
                  ),
                  accountEmail: Text(
                    "${FirebaseAuth.instance.currentUser?.email}",style:TextStyle(fontSize: 16,
                      color: Colors.cyan[200]),),


                ),
              ),
              ListTile(
                leading: ImageIcon(AssetImage('Icons/user.png'),color: Theme.of(context).iconTheme.color,),
                title: Text('Profile',style: TextStyle(fontSize: 18,color: Colors.white),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
              Divider(color: Colors.green,),

              ListTile(
                leading: ImageIcon(AssetImage('Icons/setting.png'),color: Theme.of(context).iconTheme.color,),
                title: Text('Settings',style: TextStyle(fontSize: 18,color: Colors.white),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
                },
              ),
              Divider(color: Colors.green,),


              ListTile(
                leading: ImageIcon(AssetImage('Icons/information.png'),color: Theme.of(context).iconTheme.color,),
                title: Text('About',style: TextStyle(fontSize: 18,color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
                },
              ),

              Divider(color: Colors.green),


              ListTile(
                leading: ImageIcon(AssetImage('Icons/sign-out.png'),color: Theme.of(context).iconTheme.color,),
                title: Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.white),),
                onTap: () async {
                  await FirebaseServices().SignOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage()));
                  FirebaseAuth.instance.signOut();
                },
              ),

              Divider(color: Colors.green,),

              ListTile(
                leading: ChangeThemeButtonWidget(),
                title: Text('Dark Mode',style: TextStyle(fontSize: 18,color: Colors.white)),
              ),

            ],

          ),
        ),
      ),

      //Body

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.network('https://assets8.lottiefiles.com/packages/lf20_qxemgrnw.json',height: 250,width: 300),

              Text('By Adding Your  Income You Can Manage Your Expense ',style: TextStyle(
            fontSize: 23,
            color: Theme.of(context).textTheme.caption?.color,
          ),textAlign: TextAlign.center,),

              SizedBox(height: 25,),

              SizedBox(height: 50,width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],

                      color:Theme.of(context).backgroundColor,
                      border: Border.all(color: Colors.blueGrey.shade900),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        decoration: InputDecoration(
                           icon: SizedBox(
                             height: 35,
                               width: 35,
                               child: Image.asset('Icons/dollar.png')),
                          // icon: Icon(Icons.lock,color: Theme.of(context).iconTheme.color),
                          border: InputBorder.none,
                          hintText: "100,000.00",
                          hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),

              SizedBox(height: 50,width: 300,
                child: ElevatedButton(onPressed: () {

                },
                    child: Text('Add Income',style: TextStyle(
                      fontSize: 20,
                      color:Colors.white,
                    )),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.shade900,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
