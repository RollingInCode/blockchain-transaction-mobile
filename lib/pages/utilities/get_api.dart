import 'dart:developer';

import 'package:blockchain_app/pages/utilities/global_data.dart';

import '../../main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bcrypt/flutter_bcrypt.dart';







class GetAPI{

  //WORKING
  static Future<String> login(String login, String password) async {
    storage.deleteAll();
    var res = await http.post(
        Uri.parse('$SERVER_IP/login'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Username': '$login',
          'Password': '$password'}),

    );
    print(res);
    if(res.statusCode == 200) return res.body;
    return 'null';
  }

  // WORKING
  // in: email, firstname, lastname, login, password
  // out: 'error' or 'all good'

  static Future<int> register(String email, String firstname, String lastname, String login, String password, String companyAddress, String companyName, String position, bool seller) async {
    var res = await http.post(
        Uri.parse('$SERVER_IP/registerMobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Email': '$email',
          'RepFirstName': '$firstname',
          'RepLastName': '$lastname',
          'Username': '$login',
          'Password': '$password',
          'BusinessAddress': '$companyAddress',
          'CompanyName': '$companyName',
          'Position': '$position',
          'isSeller': '$seller'}),

    );
    return res.statusCode;
  }


  //WORKING
  static Future<http.Response> editUser({String firstname = '', String lastname = '', String email = '', String companyName = '', String companyAddress = '', String position = ''}) async {
    var jwt = await storage.read(key: "jwt");
    String userId = GlobalData.userId;
    String existingEmail = GlobalData.email;

    print("$userId $firstname  $lastname $existingEmail");


    var res = await http.put(
        Uri.parse('$SERVER_IP/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': '$userId',
          'RepFirstName': '$firstname',
          'RepLastName': '$lastname',
          'BusinessAddress': '$companyAddress',
          'CompanyName': '$companyName',
          'Position': '$position',
          'Email': '$existingEmail',
          'token': '$jwt'})


    );

    /// Debug errors here
    // print('checkpoint');
    // print(res.statusCode);
    // return res;



   if(res.statusCode == 200){
     return res;

    }
    return res;
  }

  static Future<http.Response> editPassword( String oldPass, String newPass) async {
    var jwt = await storage.read(key: "jwt");
    String userId = '-1';
    userId = GlobalData.userId;




    var res = await http.post(
        Uri.parse('$SERVER_IP/ResetPassword/${GlobalData.userId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'existing_password': '$oldPass',
          'new_password': '$newPass',
          'jwtToken': '$jwt'})

    );
    if(res.statusCode == 200){
      return res;

    }
    return res;
  }



  //working
  static Future<void> verify (String pin) async {
    await http.put(
        Uri.parse('https://blkchn-trxn-verif.herokuapp.com/api/verifyMobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'token': '$pin',
          })

    );


  }

  //WORKING
  // in: userId, search or -1, search
  static Future<http.Response> searchUsers({String search = ''}) async {
    var jwt = await storage.read(key: "jwt");
    var res;

      res = await http.post(
          Uri.parse('$SERVER_IP/searchusers'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'search' : '$search',
            'jwtToken' : '$jwt',
          })
      );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }
  //working
  static Future<http.Response> deleteUsers() async {
    var jwt = await storage.read(key: "jwt");
    var res;
    String userId = '-1';
    userId = GlobalData.userId;
    res = await http.post(
        Uri.parse('$SERVER_IP/deleteuser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }


  //WORKING
  static Future<http.Response> sendPasswordEmail(String email) async {
    var res;
    print(email);
    res = await http.post(
        Uri.parse('$SERVER_IP/passResetEmailMobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email' : '$email',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }
  //NOT WORKING
  static Future<http.Response> passwordreset(String passkey, String pass) async {
    var res;

    res = await http.post(
        Uri.parse('$SERVER_IP/resetPasswordMobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'token' : '$passkey',
          'newPass' : '$pass',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> addRun() async { // need to grab refreshed jwt token
    var res;
    var jwt = await storage.read(key: "jwt");



    double pace = 0.0;
    String hi = '';

    String userId = GlobalData.userId;

    res = await http.post(
        Uri.parse('$SERVER_IP/addrun'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userId' : '$userId',
          'pace' : pace,
          'coordinates' : '$hi',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      print(res.body);
      return res;

    }
    return res;
  }
  static Future<http.Response> deleteRun(int runNumber) async {
    var res;
    var jwt = await storage.read(key: "jwt");
    String run = 'Run $runNumber';

    res = await http.post(
        Uri.parse('$SERVER_IP/deleterun'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'run' : '$run',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> searchRun({String search = ''}) async {
    var res;
    var jwt = await storage.read(key: "jwt");
    String userId = GlobalData.userId;
    res = await http.post(
        Uri.parse('$SERVER_IP/searchruns'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'search' : '$search',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> addfriend(int userId_toadd) async {
    var res;
    var jwt = await storage.read(key: "jwt");
    String userId = GlobalData.userId;


    res = await http.post(
        Uri.parse('$SERVER_IP/addfriend'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'userId_toadd' : '$userId_toadd',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }


  static Future<http.Response> searchFriends() async {
    var res;
    String userId = GlobalData.userId;

    res = await http.post(
        Uri.parse('$SERVER_IP/searchfriendsleaderboard'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'search' : '',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> listfriend() async {
    var res;
    String userId = GlobalData.userId;
    var jwt = await storage.read(key: "jwt");

    res = await http.post(
        Uri.parse('$SERVER_IP/listfriends'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> removefriend(int userId_toremove) async {
    var res;
    var jwt = await storage.read(key: "jwt");
    String userId = GlobalData.userId;


    res = await http.post(
        Uri.parse('$SERVER_IP/removefriend'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'userId_toremove' : '$userId_toremove',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }

  static Future<http.Response> listfriends() async {
    var res;
    var jwt = await storage.read(key: "jwt");
    String userId = GlobalData.userId;


    res = await http.post(
        Uri.parse('$SERVER_IP/listfriends'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId' : '$userId',
          'jwtToken' : '$jwt',
        })
    );

    if(res.statusCode == 200){
      print(res.statusCode);
      return res;

    }
    return res;
  }




}



