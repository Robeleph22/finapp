import 'package:hive/hive.dart';

class AppDataBase {
  List AddTransactionList = [];
  final myBox = Hive.box("mybox");
  static final authbox = Hive.box("auth");

  List AddCatagoryList = [];
  final mycat = Hive.box("MyBOx");


  void createInitialDataTransaction() {
    AddTransactionList = [
      [
        "Transaction","0.00",
      ],
    ];
  }

  void createInitialDataCatagory() {
    AddTransactionList = [
      [
        "Catagory","Income/Expense",
      ],
    ];
  }

  //Transaction
  void loadDataTransaction() {
    AddTransactionList = myBox.get("TRANSACTIONLIST");
  }

  void UpdateDataTransaction() {
    myBox.put("TRANSACTIONLIST", AddTransactionList);
  }

  //Catagory

  void loadDataCatagory() {
    AddCatagoryList = myBox.get("CATAGORYLIST");
  }

  void UpdateDataCatagory() {
    myBox.put("CATAGORYLIST", AddCatagoryList);
  }

  //Token

  static void setToken(String token){
    authbox.put("token", token);
  }

  static String? getToken() {
    return authbox.get("token");
  }
}
