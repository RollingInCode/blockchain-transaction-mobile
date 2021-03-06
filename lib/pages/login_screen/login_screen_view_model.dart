import 'dart:convert';

import '../../main.dart';

import 'package:blockchain_app/pages/home_page/home_screen.dart';
import 'package:blockchain_app/pages/pass_reset/forgot_password.dart';
import 'package:blockchain_app/pages/register_screen/register_screen.dart';
import 'package:blockchain_app/pages/utilities/get_api.dart';
import 'package:blockchain_app/pages/utilities/get_lb_data.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';
import 'package:blockchain_app/pages/run_sequence/home_page2.dart';
import 'package:blockchain_app/pages/utilities/results_runs.dart';
import 'package:blockchain_app/pages/utilities/results.dart';
import 'package:blockchain_app/pages/login_screen/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreenViewModel{
  LoginScreenState? state;

  LoginScreenViewModel(state){
    this.state = state;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();

  String message = '', newMessageText = '';
  String loginName = '', password = '';
  String firstName = '', lastName = '';
  late Map<String, dynamic> decodedToken;

  changeText() {
    state!.setState(() {
      message = newMessageText;
    });
  }

  Future<void> onLoginTap() async {


    loginName = nameController.text; // loginName = username textfield
    password = pwdController.text; // password = password textfield

    newMessageText = "";
    changeText();
    String payload = '{"Username":"' + loginName.trim() + '","Password":"' + password.trim() + '"}';  // login + password to be sent to api


    print(payload);

    var jsonObject;


    try
    {
      var ret = await GetAPI.login(loginName, password);
      jsonObject = json.decode(ret);
      print(ret);
      var accessToken = jsonObject["token"];
      var jwt = accessToken["accessToken"];
      await storage.write(key: "jwt", value: jwt);

      decodedToken = JwtDecoder.decode(ret);
      GlobalData.userId = decodedToken["userId"];
      GlobalData.firstName = decodedToken["firstName"];
      GlobalData.lastName = decodedToken["lastName"];
      firstName = GlobalData.firstName!;
      lastName = GlobalData.lastName!;

      getFullName(firstName, lastName);
      GlobalData.userName = loginName;


    }catch(e)
    {
      print(e);
      newMessageText = "Incorrect Login/Password";
      changeText();
      return;
    }

    try {
      nameController.clear();
      pwdController.clear();
      // await Leaderboard.getTotalData();
      // await Leaderboard.getRunData();
      // await Leaderboard.getLeaderboardData();

      Get.offAll(() => HomeScreen());

    }catch(e) {
      print(e);
    }
  }

  void onRegisterTap(){
    Get.offAll(() => RegisterScreen());
  }

  void onForgotPwdTap(){
    Get.to(() => Forgot());
  }

  void getFullName (String firstName, String lastName) {
    GlobalData.fullName = firstName + ' ' + lastName;

  }








}