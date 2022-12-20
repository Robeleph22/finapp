import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'SigninPage.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Image.asset("Icons/Genzebe png.png"),
            const Padding(padding: EdgeInsets.only(bottom: 10),),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                    child: Text("Hello and Welcome Genzebe App helps you with tracking the exprnce of "
                                "medium to large company's to help them manage every peney,and also "
                                "help them how much revenue the company earned in a range of time."
                        ,style: TextStyle(fontSize: 18, color:Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                    width: 230,
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Let's Get Started",style: TextStyle(fontSize: 22, fontFamily: 'Roboto',fontWeight: FontWeight.bold,color: Colors.white)),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

