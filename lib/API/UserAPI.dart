import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final Baseurl = '10.0.2.2';
  User.fromUser();

  int? userId;
  String? email;
  String? userName;
  String? password;

  User({this.userId, this.email, this.userName, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    email = json['Email'];
    userName = json['UserName'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Email'] = this.email;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    return data;

  }
    Future<List<User>> getUsers()async {
      http.Response response = await http.get(Uri.https(Baseurl,"/User"));
      if(response.statusCode == 200){
        var ddd=jsonDecode(response.body);
        var s = (ddd as List).map((data) {return User.fromJson(data);}).toList();
        return s;
      }
      throw Error();
    }

  Future<User> getStore(String id)async {

    http.Response response = await http.get(Uri.https(Baseurl, "/User/$id"));
    var ddd=jsonDecode(response.body);
    var s =  User.fromJson(ddd);
    return s;
  }

  Future<User> createUser(User user)async {
    http.Response response = await http.post(Uri.https(Baseurl, "/User/CreateUser"),body: jsonEncode(user));
    var ddd=jsonDecode(response.body);
    var s =  User.fromJson(ddd);
    return s;
  }


  Future<User> updateUser(User user)async {
    http.Response response = await http.patch(Uri.https(Baseurl, "/User/UpdateUser"),body: jsonEncode(user));
    var ddd=jsonDecode(response.body);
    var s =  User.fromJson(ddd);
    return s;
  }

  Future<User> deleteUser(User id)async {
    http.Response response = await http.delete(Uri.https(Baseurl, "/User/DeleteUser/$id"));
    var ddd=jsonDecode(response.body);
    var s =  User.fromJson(ddd);
    return s;
  }
}





