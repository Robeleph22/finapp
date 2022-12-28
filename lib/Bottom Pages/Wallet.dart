import 'package:finapp/DataBase/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../Drawer Pages/About.dart';
import '../Drawer Pages/ProfilePage.dart';
import '../Drawer Pages/SettingPage.dart';
import '../Pages/HelloPage.dart';
import '../Provider/ChangeThemeButton.dart';
import '../Utility/AddCatagoryAlertDialog.dart';
import '../Utility/AddTransactionAlertDialog.dart';
import '../Utility/CatagoryList.dart';
import '../Utility/TransactionList.dart';
import '../auth/signinwithgoogle.dart';


class AddCatagory extends StatefulWidget {
  const AddCatagory({Key? key}) : super(key: key);

  @override
  State<AddCatagory> createState() => _AddCatagoryState();
}

class _AddCatagoryState extends State<AddCatagory> {
  final _transaction = TextEditingController();
  final _catname = TextEditingController();
  final _icons = TextEditingController();
  final _myBox = Hive.box('MyBOx');
  AppDataBase db = AppDataBase();

  @override
  void initState() {
    if(_myBox.get("CATAGORYLIST") == null){
      db.createInitialDataCatagory();
    }else{
      db.loadDataCatagory();
    }
    super.initState();
  }

  void saveTransaction(){
    setState(() {
      db.AddCatagoryList.add([_catname.text,_icons.text,_transaction.text]);
    });
    Navigator.of(context).pop();
    db.UpdateDataCatagory();
  }

  void Add_Trsnsaction(){
    showDialog(
      context: context,
      builder: (context) {
        return CatagoryDialogBox(
          CatagoryNameController: _catname,
          IconController: _icons,
          TransactionController: _transaction,
          onAdd: saveTransaction,
          onCancel: () => Navigator.of(context).pop(),
        );
      },);
    db.UpdateDataCatagory();
  }

  void DeleteTransaction(int index){
    setState(() {
      db.AddCatagoryList.removeAt(index);
    });
    db.UpdateDataCatagory();
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
        title: Center(child: Text('Catagory',style: TextStyle(color: Colors.white),)),
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
          itemCount: db.AddCatagoryList.length,
          itemBuilder: (context, index){
            return CatagoryList(
              CatagoryName: db.AddCatagoryList[index][0],
              Icon: db.AddCatagoryList[index][2],
              TransactionType: db.AddCatagoryList[index][1],
              DeleteList: (context) => DeleteTransaction(index),
            );
          }
      ),
    );
  }
}
