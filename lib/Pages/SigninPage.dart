
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text, password: _passwordcontroller.text);
    }on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
    Navigator.pop(context);
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
                SizedBox(height: 35,),
                Center(
                  child: Text(
                       "Welcome Back",
                        style: TextStyle(fontSize: 50,
                          color: Theme.of(context).textTheme.caption?.color
                        ),
                  ),
                ),



                //Email TexField

                SizedBox(height: 30,),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 4,
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

                SizedBox(height: 15,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 4,
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
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        child: Text('Forget Password',
                            style: TextStyle(fontSize: 18,color: Colors.green)),
                      ),
                    ],
                  ),
                ),

                //Signin

                SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(height: 55,width: 350,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      onPressed: () {
                        signin();
                      },
                      child: Text('Signin',
                        style: TextStyle(color: Colors.white,
                            fontSize: 20),
                      ),

                    ),
                  ),
                ),

                //Register now

                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "If not a member ",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color)),
                        TextSpan(text: "Register Now",style: TextStyle(fontSize: 20,color: Colors.green),recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()))),
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
