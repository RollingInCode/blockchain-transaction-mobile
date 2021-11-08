import 'package:blockchain_app/pages/run_sequence/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterFieldBox extends StatelessWidget {
  late TextEditingController userNameController;
  late TextEditingController pwdController;
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController cnController;
  late TextEditingController addController;
  late TextEditingController pController;
  late TextEditingController sellerController;

  late FocusNode userNameFocus;
  late FocusNode pwdFocus;
  late FocusNode emailFocus;
  late FocusNode firstNameFocus;
  late FocusNode lastNameFocus;
  late FocusNode companyNameFocus;
  late FocusNode companyAddressFocus;
  late FocusNode positionFocus;
  late FocusNode sellerFocus;

  late VoidCallback cancelTap;
  late VoidCallback registerTap;
  late VoidCallback optionBuyerTap;
  late VoidCallback optionSellerTap;

  RegisterFieldBox({
    required this.emailController,
    required this.cancelTap,
    required this.optionBuyerTap,
    required this.optionSellerTap,
    required this.pwdController,
    required this.pwdFocus,
    required this.emailFocus,
    required this.firstNameController,
    required this.registerTap,
    required this.firstNameFocus,
    required this.lastNameController,
    required this.lastNameFocus,
    required this.userNameController,
    required this.userNameFocus,
    required this.cnController,
    required this.companyNameFocus,
    required this.addController,
    required this.companyAddressFocus,
    required this.pController,
    required this.positionFocus,
    required this.sellerController,
    required this.sellerFocus,
  });
  double sideLength = 50;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height / 4.8, left: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4695A2).withOpacity(0.5),
            offset: Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          Text(
            "Register",
            style: TextStyle(
                color: Color(0xFF4695A2),
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: emailFocus,
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: userNameFocus,
                controller: userNameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: pwdFocus,
                controller: pwdController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: firstNameFocus,
                controller: firstNameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Rep First Name",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: lastNameFocus,
                controller: lastNameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Rep Last Name",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: positionFocus,
                controller: pController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Position/Job",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: companyNameFocus,
                controller: cnController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Company Name",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ]),
            child: Center(
              child: TextField(
                focusNode: companyAddressFocus,
                controller: addController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Company Address",
                    hintStyle: TextStyle(color: Color(0xFF4695A2))),
              ),
            ),
          ),
          SizedBox(height: 30),


          /// reserved for seller radio buttons
          Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 0),
                      blurRadius: 3,
                    ),
                  ]),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: AnimatedContainer(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Color(0xFF4297FE),
                          Color(0xFF76DDFF),
                        ]),
                      ),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                      child: Material(
                        color: Colors.yellow,
                        child: InkWell(
                          onTap: optionSellerTap,
                          child: Center(
                            child: Text(
                              "Seller",
                              style: TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),

                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: optionBuyerTap,

                    child: AnimatedContainer(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                      child: Material(
                        color: Colors.yellow,
                        child: InkWell(
                          onTap: optionBuyerTap,
                          child: Center(
                            child: Text(
                              "Buyer",
                              style: TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),

                        ),
                      ),
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          /// end of Seller, Buyer selection
          // regular buttons

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: registerTap,
                child: Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [
                      Color(0xFF4297FE),
                      Color(0xFF76DDFF),
                    ]),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white,fontSize: 15),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: cancelTap,
                child: Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xFF7AB2BB),fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }


}
