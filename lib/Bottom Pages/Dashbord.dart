import 'package:finapp/Chart/LCharts.dart';
import 'package:finapp/Drawer%20Pages/About.dart';
import 'package:finapp/Drawer%20Pages/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer Pages/SettingPage.dart';
import '../Provider/ChangeThemeButton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:
      AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blueGrey.shade900,
        title: Center(child: Text('Home Page',style: TextStyle(color: Colors.white))),
      ),
      drawer: Drawer(
        child: Container(
          color:Colors.grey.shade900,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(currentAccountPicture: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('Icons/man.png'),
                  ),
                ),
              ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900
                ),
                accountName: Text(
                  'Robel Ephrem',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),
                ),
                accountEmail: Text(
                  'robelephrem2@gmail.com',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).iconTheme.color),
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
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),

              Divider(color: Colors.green,),

              ListTile(
                leading: ChangeThemeButtonWidget(),
                title: Text('Dark Mode',style: TextStyle(fontSize: 18,color: Colors.white)),
              ),
              Divider(color: Colors.green,),

            ],

          ),
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 35.0),
              child: Row(
                children: [
                  Text("Welcome Back,  Robel Ephrem",
                    style: GoogleFonts.bebasNeue(fontSize: 25,
                        color: Theme.of(context).textTheme.caption?.color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60,
                          width: 100,
                          child: Image.asset('Icons/credit.png')),

                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("Total Amount  ",
                                style: GoogleFonts.aBeeZee(fontSize: 18,
                                    color: Colors.white)),

                            SizedBox(height: 10,),

                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text("100,000.00",
                                      style: GoogleFonts.aBeeZee(fontSize: 18,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(right: 55.0),
              child: Text("This Month Top 5 Highest Expense",
                  style: GoogleFonts.bebasNeue(fontSize: 25,
                      color: Theme.of(context).textTheme.caption?.color)),
            ),

            SizedBox(height: 15,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80,width: 80,
                                child: Image.asset('Icons/programming.png')),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('Icons/dollar.png')),
                                SizedBox(width: 5,),
                                Text("100,000",style: TextStyle(color: Colors.white))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80,width: 80,
                                child: Image.asset('Icons/technician.png')),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('Icons/dollar.png')),
                                SizedBox(width: 5,),
                                Text("50,000",style: TextStyle(color: Colors.white))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80,width: 80,
                                child: Image.asset('Icons/plane-ticket.png')),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('Icons/dollar.png')),
                                SizedBox(width: 5,),
                                Text("40,000",style: TextStyle(color: Colors.white))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80,width: 80,
                                child: Image.asset('Icons/wristwatch.png')),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('Icons/dollar.png')),
                                SizedBox(width: 5,),
                                Text("15,000",style: TextStyle(color: Colors.white))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 80,width: 80,
                                child: Image.asset('Icons/gym.png')),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('Icons/dollar.png')),
                                SizedBox(width: 5,),
                                Text("5,000",style: TextStyle(color: Colors.white))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),


            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text("Monthly Expense By Chart",
                  style: GoogleFonts.bebasNeue(fontSize: 25,
                      color: Theme.of(context).textTheme.caption?.color)),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 350,
                width: 350,
                child: Lcharts(),
              ),
            ),
            SizedBox(height: 30,),



            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}