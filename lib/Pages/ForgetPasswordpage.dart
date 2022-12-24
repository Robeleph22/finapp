import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordpage extends StatefulWidget {
  const ForgetPasswordpage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordpage> createState() => _ForgetPasswordpageState();
}

class _ForgetPasswordpageState extends State<ForgetPasswordpage> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }
  Future PasswordReset() async{
    try{
      await FirebaseAuth.instance.
      sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text('Password Reset Link Sent to Your Email!Please Check Your Email'),
            );
          });
    }on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text("Forget Password") ,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor:Colors.blueGrey.shade900,
        elevation: 0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("Forgot Your Password No Problem",style: TextStyle(fontSize: 30,color: Theme.of(context).textTheme.caption?.color),),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Just Enter Your Email And We Will Send A Link To Rest Your Password',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color),),
          ),
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

                color:Theme.of(context).backgroundColor,
                border: Border.all(color: Colors.blueGrey.shade900),
                borderRadius: BorderRadius.circular(12),

              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined,color: Theme.of(context).bottomAppBarColor),
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: PasswordReset,
              child: SizedBox(
                width: 300,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color:Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
