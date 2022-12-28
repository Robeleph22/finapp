import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserAPI.dart';

class Auth {
  final Baseurl = '10.0.2.2:3000';
  Auth.fromUser();

  String? email;
  String? password;

  Auth({this.email, this.password});

  Auth.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Password'] = this.password;
    return data;
  }

  Future<String> authSignIn(Auth credtials)async {

    http.Response response = await http.post(Uri.http(Baseurl, "/Auth/SignIn"),headers: {'Content-type': 'application/json'},body: jsonEncode(credtials));
    return response.body;
  }

  Future<User> signUp(User user)async {
    print(Uri.https(Baseurl, "/Auth/CreateUser"));
    http.Response response = await http.post(Uri.http(Baseurl, "/Auth/CreateUser"),headers: {'Content-type': 'application/json'},body: jsonEncode(user));
    print("hereeeeeeeeeeeeeeeeeeeeeeeee");

    print(response.body);
    print(response.reasonPhrase);
    var ddd=jsonDecode(response.body);
    var s =  User.fromJson(ddd);
    return s;
  }
  

}