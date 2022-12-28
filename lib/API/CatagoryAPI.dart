import 'dart:convert';
import 'package:finapp/DataBase/DataBase.dart';
import 'package:http/http.dart' as http;

class Catagory {
  final Baseurl = 'api.sweaven.dev';
  Catagory.fromUser();

  int? catagoryId;
  String? title;
  bool? type;
  String? icon;
  int? userId;

  Catagory({this.catagoryId, this.title, this.type, this.icon, this.userId});

  Catagory.fromJson(Map<String, dynamic> json) {
    catagoryId = json['CatagoryId'];
    title = json['Title'];
    type = json['Type'];
    icon = json['Icon'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CatagoryId'] = this.catagoryId;
    data['Title'] = this.title;
    data['Type'] = this.type;
    data['Icon'] = this.icon;
    data['UserId'] = this.userId;
    return data;
  }
  Future<List<Catagory>> getAllCatagory(Catagory catagory)async {
    http.Response response = await http.get(Uri.https(Baseurl,"/Catagory/GetAllCatagory"),);
    if(response.statusCode == 200){
      var ddd=jsonDecode(response.body);
      var s = (ddd as List).map((data) {return Catagory.fromJson(data);}).toList();
      return s;
    }
    throw Error();
  }

  Future<Catagory> getCatagorybyid(Catagory id) async{
    http.Response response = await http.get(Uri.https(Baseurl, "/Catagory/GetCatagoryById/$id"));
    var ddd=jsonDecode(response.body);
    var s =  Catagory.fromJson(ddd);
    return s;
  }
  Future<Catagory> createCatagory(Catagory catagory)async {
    http.Response response = await http.post(Uri.https(Baseurl, "/Catagory/CreateCatagory"),body: jsonEncode(catagory));
    var ddd=jsonDecode(response.body);
    var s =  Catagory.fromJson(ddd);
    return s;
  }

  Future<Catagory> updateCatagory(Catagory catagory)async {
    http.Response response = await http.patch(Uri.https(Baseurl, "/Catagory/UpdateCatagory"),body: jsonEncode(catagory));
    var ddd=jsonDecode(response.body);
    var s =  Catagory.fromJson(ddd);
    return s;
  }

  Future<Catagory> deleteCatagory(Catagory id)async {
    http.Response response = await http.delete(Uri.https(Baseurl, "/Catagory/DeleteCatagory/$id"),
      headers: {
        'Authorization': 'Bearer ${AppDataBase.getToken()}',
      },
    );
    var ddd=jsonDecode(response.body);
    var s =  Catagory.fromJson(ddd);
    return s;

  }

}
