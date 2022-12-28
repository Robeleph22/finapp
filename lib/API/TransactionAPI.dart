import 'dart:convert';
import 'package:http/http.dart' as http;

class Transaction {
  final Baseurl = 'api.sweaven.dev';
  Transaction.fromUser();

  int? transactionId;
  int? amount;
  String? dateTime;
  String? note;
  int? catagoryId;

  Transaction(
      {this.transactionId,
        this.amount,
        this.dateTime,
        this.note,
        this.catagoryId});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionId = json['TransactionId'];
    amount = json['Amount'];
    dateTime = json['DateTime'];
    note = json['Note'];
    catagoryId = json['CatagoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionId'] = this.transactionId;
    data['Amount'] = this.amount;
    data['DateTime'] = this.dateTime;
    data['Note'] = this.note;
    data['CatagoryId'] = this.catagoryId;
    return data;
  }

  Future<List<Transaction>> getTransaction()async {
    http.Response response = await http.get(Uri.https(Baseurl,"/Transaction"));
    if(response.statusCode == 200){
      var ddd=jsonDecode(response.body);
      var s = (ddd as List).map((data) {return Transaction.fromJson(data);}).toList();
      return s;
    }
    throw Error();
  }

  Future<Transaction> getStore(String id)async {

    http.Response response = await http.get(Uri.https(Baseurl, "/Transaction/$id"));
    var ddd=jsonDecode(response.body);
    var s =  Transaction.fromJson(ddd);
    return s;
  }

  Future<Transaction> createTransaction(Transaction transaction)async {
    http.Response response = await http.post(Uri.https(Baseurl, "/Transaction/CreateTransaction"),body: jsonEncode(transaction));
    var ddd=jsonDecode(response.body);
    var s =  Transaction.fromJson(ddd);
    return s;
  }



  Future<Transaction> updateTransaction(Transaction transaction)async {
    http.Response response = await http.patch(Uri.https(Baseurl, "/Transaction/UpdateTransaction"),body: jsonEncode(transaction));
    var ddd=jsonDecode(response.body);
    var s =  Transaction.fromJson(ddd);
    return s;
  }

  Future<Transaction> deleteTransaction(Transaction id)async {
    http.Response response = await http.delete(Uri.https(Baseurl, "/Transaction/DeleteTransaction/$id"));
    var ddd=jsonDecode(response.body);
    var s =  Transaction.fromJson(ddd);
    return s;
  }

}