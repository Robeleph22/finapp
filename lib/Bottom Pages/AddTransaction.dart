import 'package:finapp/DataBase/DataBase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../Drawer Pages/About.dart';
import '../Drawer Pages/ProfilePage.dart';
import '../Drawer Pages/SettingPage.dart';
import '../Pages/HelloPage.dart';
import '../Provider/ChangeThemeButton.dart';
import '../Utility/AddAlertDialog.dart';
import '../Utility/TransactionList.dart';
import '../auth/signinwithgoogle.dart';


class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _amount = TextEditingController();
  final _controller = TextEditingController();

  final _myBox = Hive.box('mybox');
  AppDataBase db = AppDataBase();

  @override
  void initState() {
    if(_myBox.get("TRANSACTIONLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  void saveTransaction(){
    setState(() {
      db.AddTransactionList.add([_controller.text,_amount.text]);

    });
    Navigator.of(context).pop();
    db.UpdateData();
  }

  void Add_Trsnsaction(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          NameController: _controller,
          AmountController: _amount,
          onAdd: saveTransaction,
          onCancel: () => Navigator.of(context).pop(),
        );
      },);
    db.UpdateData();
  }

  void DeleteTransaction(int index){
    setState(() {
      db.AddTransactionList.removeAt(index);

    });
    db.UpdateData();
  }

  void Go_back_to_main(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:
      AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blueGrey.shade900,
        title: Center(child: Text('Transaction',style: TextStyle(color: Colors.white),)),
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
                    "${FirebaseAuth.instance.currentUser?.displayName}",style: GoogleFonts.bebasNeue(fontSize: 30, color: Theme.of(context).textTheme.caption?.color)
                ),
                accountEmail: Text(
                    "${FirebaseAuth.instance.currentUser?.email}",style:TextStyle(fontSize: 16,
                    color: Colors.cyan[200])
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
              Divider(color: Colors.green,),

            ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: Add_Trsnsaction,
        child: ImageIcon(AssetImage('Icons/add.png'),color: Theme.of(context).bottomAppBarColor),
      ),


      body:ListView.builder(
        itemCount: db.AddTransactionList.length,
        itemBuilder: (context, index){
          return TransactionList(
              TransactionName: db.AddTransactionList[index][0],
              TransactionAmount: db.AddTransactionList[index][1],
              DeleteList: (context) => DeleteTransaction(index),
          );
      }
        // children: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 35.0),
        //     child: Row(
        //       children: [
        //         Text("Welcome Back,  Robel Ephrem",
        //           style: GoogleFonts.bebasNeue(fontSize: 25,
        //               color: Theme.of(context).textTheme.caption?.color),
        //         ),
        //       ],
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
        //     child: Container(
        //         height: 100,
        //         width: 350,
        //         decoration: BoxDecoration(
        //             color: Colors.deepPurpleAccent,
        //             borderRadius: BorderRadius.circular(15)
        //         ),
        //         child: Center(
        //           child: Row(
        //             children: [
        //               SizedBox(
        //                   height: 60,
        //                   width: 100,
        //                   child: Image.asset('Icons/credit.png')),
        //
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 25.0),
        //                 child: Column(
        //                   children: [
        //                     SizedBox(height: 20,),
        //                     Text("Total Amount  ",
        //                         style: GoogleFonts.aBeeZee(fontSize: 18,
        //                             color: Theme.of(context).textTheme.caption?.color)),
        //
        //                     SizedBox(height: 10,),
        //
        //                     Column(
        //                       children: [
        //                         Padding(
        //                           padding: const EdgeInsets.only(right: 15.0),
        //                           child: Text("100,000.00",
        //                               style: GoogleFonts.aBeeZee(fontSize: 18,
        //                                   color: Theme.of(context).textTheme.caption?.color)),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //     ),
        //   ),
        //   TransactionList(
        //     TransactionName: 'Laptop',
        //     TransactionAmount:"100,000",
        //   ),
        //   TransactionList(
        //     TransactionName: 'Car Repair',
        //     TransactionAmount:"50,000",
        //   ),
        //   TransactionList(
        //     TransactionName: 'Plain Ticket',
        //     TransactionAmount:"40,000",
        //   ),
        //   TransactionList(
        //     TransactionName: 'Watch',
        //     TransactionAmount:"15,000",
        //   ),
        //   TransactionList(
        //     TransactionName: 'Gym',
        //     TransactionAmount:"5,000",
        //   ),

      ),
    );
  }
}
