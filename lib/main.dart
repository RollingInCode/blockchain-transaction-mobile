import 'package:blockchain_app/pages/pass_reset/forgot_password.dart';
import 'package:blockchain_app/pages/run_sequence/change_email.dart';
import 'package:blockchain_app/pages/run_sequence/change_name.dart';
import 'package:blockchain_app/pages/run_sequence/change_pass.dart';
import 'package:blockchain_app/pages/run_sequence/change_username.dart';
import 'package:blockchain_app/pages/run_sequence/register_page.dart';
import 'package:blockchain_app/pages/run_sequence/settings.dart';
import 'package:blockchain_app/pages/run_sequence/user_profile.dart';
import 'package:blockchain_app/pages/run_sequence/verify_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';

import 'pages/home_page/home_screen.dart';

import 'pages/login_screen/login_screen.dart';


const SERVER_IP = 'https://blkchn-trxn-verif.herokuapp.com/api';
final storage = FlutterSecureStorage();

void main() => runApp(GetMaterialApp(
  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) => LoginScreen(),
    '/register': (context) => Register(),
    '/forgot_password' : (context) => Forgot(),
    '/home_page' : (context) => HomeScreen(),
    '/verify_user' : (context) => Verify(),
    '/user_profile': (context) => User(),
    '/settings': (context) => Settings(),
    '/change_email': (context) => ChangeEmail(),
    '/change_name': (context) => ChangeName(),
    '/change_pass': (context) => ChangePass(),
    '/change_username': (context) => ChangeUserName(),

  },

));
