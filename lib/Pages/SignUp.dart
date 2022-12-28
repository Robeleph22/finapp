
import 'package:finapp/API/AuthAPI.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../API/UserAPI.dart';
import '../Utility/SqureTile.dart';
import '../auth/signinwithgoogle.dart';
import 'HomePage.dart';
import 'SigninPage.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _username = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    _lastnamecontroller.dispose();
    _firstnamecontroller.dispose();
    _username.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }


  Future signup() async{
    var users = await  Auth.fromUser().signUp(User(email: _emailcontroller.text,password: _passwordcontroller.text,userName: _username.text,));
    print(users.userName);
    print(users.email);
    print(users.userId);
    Navigator.pop(context);
    }

  Future addUserDetails
      ( String firstname, String lastname, String username, String email)async{
    //TODO
    print(
        firstname + lastname + username + email
    );


  }
  bool PasswordConfirmed(){
    if(
    _passwordcontroller.text.trim() == _confirmpasswordcontroller.text.trim()){
      return true;
    }else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Signup") ,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        // leading: Container(),
      ),
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
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
                          controller: _firstnamecontroller,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,color: Theme.of(context).bottomAppBarColor),
                            border: InputBorder.none,
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Last Name

                  SizedBox(height: 25,),

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

                        color:Theme.of(context).backgroundColor,
                        border: Border.all(color: Colors.blueGrey.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          controller: _lastnamecontroller,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,color: Theme.of(context).bottomAppBarColor),
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25,),

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

                        color:Theme.of(context).backgroundColor,
                        border: Border.all(color: Colors.blueGrey.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          controller: _username,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,color: Theme.of(context).bottomAppBarColor),
                            border: InputBorder.none,
                            hintText: "User Name",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 25,),
                  // Email

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
                              controller: _emailcontroller,
                              decoration: InputDecoration(

                                icon: Icon(Icons.email,color: Theme.of(context).bottomAppBarColor),
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                              )
                          )
                      ),
                    ),
                  ),
                  //Password
                  SizedBox(height: 25),


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
                  //Confirm Password
                  SizedBox(height: 25,),


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
                        color:Theme.of(context).backgroundColor,
                        border: Border.all(color: Colors.blueGrey.shade900),
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                          controller: _confirmpasswordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock,color: Theme.of(context).bottomAppBarColor),
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),

                          ),
                        ),
                      ),
                    ),
                  ),

                  //Signup
                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signup,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color:Colors.blueGrey.shade900,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                            child: Text(
                              "Signup",
                              style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),

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

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagePath: "Icons/google.png", onTap: () async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },)
                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "If a member! ",style: TextStyle(fontSize: 18,color: Theme.of(context).textTheme.caption?.color)),
                            TextSpan(text: "Login Now",style: TextStyle(fontSize: 18,color: Colors.greenAccent),recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))),
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
      ),
    );
  }
}
