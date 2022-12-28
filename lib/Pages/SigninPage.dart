
import 'package:finapp/API/UserAPI.dart';
import 'package:finapp/DataBase/DataBase.dart';
import 'package:finapp/Pages/HomePage.dart';
import 'package:finapp/Utility/SqureTile.dart';
import 'package:finapp/auth/signinwithgoogle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API/AuthAPI.dart';
import 'ForgetPasswordpage.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signin() async{
   var token = await  Auth.fromUser().authSignIn(Auth(email: _emailcontroller.text,password: _passwordcontroller.text));
   print(token);
   if(token != "errorrr"){
     AppDataBase.setToken(token);
     //AppDataBase.authbox.delete("token");
     //print(AppDataBase.getToken());
     Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));
   }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Login") ,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor:Colors.blueGrey.shade900,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25,),

                // SizedBox(height: 100,width: 100,
                //     child: Image.asset("Icons/lock.png")),
                Text(
                     "Welcome Back",
                      style: TextStyle(fontSize: 30,
                        color: Theme.of(context).textTheme.caption?.color
                      ),
                ),

                SizedBox(height: 40,),

                //Email textfiled

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],

                      color: Theme.of(context).backgroundColor ,
                      border: Border.all(color:  Colors.blueGrey.shade900),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email,color: Theme.of(context).bottomAppBarColor),
                          border: InputBorder.none,
                          hintText: "Email",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        ),
                      ),
                    ),
                  ),
                ),

                //Password TexField

                SizedBox(height: 30,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],

                      color: Theme.of(context).backgroundColor,
                      border: Border.all(color: Colors.blueGrey.shade900),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        controller: _passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(

                          icon: Icon(Icons.lock,color: Theme.of(context).bottomAppBarColor),
                          border: InputBorder.none,
                          hintText: "Password",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context)
                          {
                            return ForgetPasswordpage();
                          },
                          ),
                          );
                },
                        child: Text('Forget Password ?',
                            style: TextStyle(fontSize: 18,color: Colors.greenAccent)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 35,),

                //signin
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(height: 55,width: 350,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      onPressed: () async {
                        await signin();
                      },
                      child: Text('Signin',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),
                      ),

                    ),
                  ),
                ),

                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(thickness: 1,color: Colors.greenAccent)
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Or Continue With",style: TextStyle(fontSize: 18),),
                      ),
                      Expanded(child: Divider(thickness: 1,color: Colors.greenAccent)
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: "Icons/google.png", onTap: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },)
                  ],
                ),


                //Register now
                SizedBox(height: 35,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "If not a member ",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color)),
                        TextSpan(text: " Register Now",style: TextStyle(fontSize: 20,color: Colors.greenAccent),recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()))),
                        // Navigator.push(context,                MaterialPageRoute(builder: (context) => const LoginPage()));
                      ]
                    )
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
