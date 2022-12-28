import 'package:flutter/material.dart';

import '../API/UserAPI.dart';
import '../Pages/HomePage.dart';
import 'About.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  DeleteUserAccount() async {
    await  User.fromUser().deleteUser(User());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Profile") ,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        // leading: Container(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
            child: Text("Account Details", style: TextStyle(
              color: Colors.greenAccent, fontSize: 22,
            ),),
          ),

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text("User Name" ),//TODO
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.mail),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text("User Email" ),//TODO
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.person),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        children: [
                          Text("Change User Name"),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ],
                      ),//TODO,

                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.lock),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        children: [
                          Text("Change Password"),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ],
                      ),//TODO,

                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 350,),


          SizedBox(height: 50,width: 350,
            child: ElevatedButton(onPressed: () async {
              await DeleteUserAccount();
            },
                child: Text('Delete Account',style: TextStyle(
                  fontSize: 25,
                  color:Colors.red,
                )),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.shade900,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                )
            ),
          )

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //     child: GestureDetector(
          //         onTap: () {
          //           DeleteUserAccount;
          //         },
          //       child: Container(
          //         height: 50,
          //         width: 350,
          //         decoration: BoxDecoration(
          //           color: Colors.blueGrey.shade900,
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("Delete Account",style: TextStyle(fontSize: 22,color: Colors.red), )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),

        ],
      ),
    );
  }
}
