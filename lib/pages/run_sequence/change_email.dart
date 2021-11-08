import 'dart:convert';

import 'package:blockchain_app/pages/utilities/asset_res.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//WORK IN PROGRESS

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    // dispose controller when page is disposed
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
          ),

          Positioned(
            top: 0,
            left: 0,
            child: Stack(
              alignment: AlignmentDirectional(0, 0),
              children: [
                Container(
                  height: Get.height / 4,
                  width: Get.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      AssetRes.backGroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Blockchain Transaction",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Constantia",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.only(top: Get.height / 4.8, left: 20, right: 20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 80),
                  Center(
                    child: Text(
                      "Edit Email",
                      style: TextStyle(
                          color: Color(0xFF4695A2),
                          fontSize: 31,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 80),
                  Text(
                    "    Enter New Email",
                    style: TextStyle(color: Color(0xFF5B5B5B), fontSize: 13),
                  ),
                  SizedBox(height: 10),
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
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Color(0xFF4695A2))),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        String email = emailController.text;
                        GlobalData.email = email;
                      },
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
                            "Change",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: (Get.height / 3)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back,color: Colors.white,size: 27,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
