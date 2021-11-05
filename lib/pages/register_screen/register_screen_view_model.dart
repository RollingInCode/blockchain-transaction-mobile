import 'dart:convert';

import 'package:blockchain_app/pages/login_screen/login_screen.dart';
import 'package:blockchain_app/pages/register_screen/register_screen.dart';
import 'package:blockchain_app/pages/run_sequence/verify_user.dart';
import 'package:blockchain_app/pages/utilities/get_api.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RegisterScreenViewModel{
  RegisterScreenState? state;

  RegisterScreenViewModel(state){
    this.state = state;
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController cnController = TextEditingController();
  TextEditingController pController = TextEditingController();

  FocusNode userNameFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode companyNameFocus = FocusNode();
  FocusNode companyAddressFocus = FocusNode();
  FocusNode positionFocus = FocusNode();

  String email = '';
  String login = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String companyAddress = '';
  String companyName = '';
  String position = '';

  var jsonObject;



  late Map<String, dynamic> decodedToken;

  Future<void> onRegisterTap() async {
    email = emailController.text;
    login = userNameController.text;
    password = pwdController.text;
    firstName = firstNameController.text;
    lastName = lastNameController.text;
    companyAddress = addController.text;
    companyName = cnController.text;
    position = pController.text;



    try{
      int ret = await GetAPI.register(email, firstName, lastName, login, password, companyAddress, companyName, position);
      GlobalData.userName = login;
      GlobalData.lastName = lastName;
      GlobalData.firstName = firstName;
      GlobalData.email = email;
      GlobalData.companyAddress = companyAddress;
      GlobalData.companyName = companyName;
      GlobalData.position = position;
      if(ret == 200) {
        print('Register Successful');

      }
      else print('Error $ret');

    }
    catch(e){
      print(e);
      return;
    }



    try {
      Get.to(() => Verify());
    }catch(e){
      print(e);
    }
  }

  void onCancelTap(){
    try {
      emailController.clear();
      userNameController.clear();
      pwdController.clear();
      firstNameController.clear();
      lastNameController.clear();
      cnController.clear();
      addController.clear();
      pController.clear();
      Get.offAll(() => LoginScreen());
    }catch(e){
      print(e);
    }
  }


}