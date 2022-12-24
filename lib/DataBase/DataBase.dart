import 'package:hive/hive.dart';

class AppDataBase {
  List AddTransactionList = [];
  final myBox = Hive.box("mybox");

  void createInitialData() {
    AddTransactionList = [
      [
        "Transaction","0.00",
      ],
    ];
  }

  void loadData() {
    AddTransactionList = myBox.get("TRANSACTIONLIST");
  }

  void UpdateData() {
    myBox.put("TRANSACTIONLIST", AddTransactionList);
  }
}
