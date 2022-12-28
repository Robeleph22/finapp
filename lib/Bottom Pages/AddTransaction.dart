import 'package:finapp/DataBase/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../Drawer Pages/About.dart';
import '../Drawer Pages/ProfilePage.dart';
import '../Drawer Pages/SettingPage.dart';
import '../Pages/HelloPage.dart';
import '../Provider/ChangeThemeButton.dart';
import '../Utility/AddTransactionAlertDialog.dart';
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
      db.createInitialDataTransaction();
    }else{
      db.loadDataTransaction();
    }
    super.initState();
  }

  void saveTransaction(){
    setState(() {
      db.AddTransactionList.add([_controller.text,_amount.text]);
    });
    Navigator.of(context).pop();
    db.UpdateDataTransaction();
  }

  void Add_Trsnsaction(){
    showDialog(
      context: context,
      builder: (context) {
        return TransactionDialogBox(
          NameController: _controller,
          AmountController: _amount,
          onAdd: saveTransaction,
          onCancel: () => Navigator.of(context).pop(),
        );
      },);
    db.UpdateDataTransaction();
  }

  void DeleteTransaction(int index){
    setState(() {
      db.AddTransactionList.removeAt(index);

    });
    db.UpdateDataTransaction();
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
            SizedBox(height: 180,
              child: UserAccountsDrawerHeader(currentAccountPicture: Icon(Icons.abc),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),
                accountName: Text(
                    "",style: GoogleFonts.bebasNeue(fontSize: 30, color: Theme.of(context).textTheme.caption?.color)
                ),
                accountEmail: Text(
                  "",style:TextStyle(fontSize: 16,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
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
      ),
    );
  }
}
