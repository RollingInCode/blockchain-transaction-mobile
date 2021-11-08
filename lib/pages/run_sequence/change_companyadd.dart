import 'dart:convert';

import 'package:blockchain_app/pages/run_sequence/settings.dart';

import '../../main.dart';
import 'package:blockchain_app/pages/home_page/home_screen.dart';
import 'package:blockchain_app/pages/utilities/asset_res.dart';
import 'package:blockchain_app/pages/utilities/get_api.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home_page2.dart';

//WORK IN PROGRESS

class ChangeCompanyAddress extends StatefulWidget {
  const ChangeCompanyAddress({Key? key}) : super(key: key);

  @override
  _ChangeCompanyAddressState createState() => _ChangeCompanyAddressState();
}

class _ChangeCompanyAddressState extends State<ChangeCompanyAddress> {

  final addController = TextEditingController();



  @override
  void dispose(){ // dispose controller when page is disposed
    addController.dispose();
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
              alignment: AlignmentDirectional(0,0),
              children: [
                Container(
                  height: Get.height/4,
                  width: Get.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(AssetRes.backGroundImage,fit: BoxFit.cover,),
                  ),
                ),
                Text("Blockchain Transaction",style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: "Constantia",fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          //Text("Free Runner",style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: "Constantia",fontWeight: FontWeight.w500),),
          SingleChildScrollView(
            child: Container(
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
                    "Edit Company Address",
                    style: TextStyle(
                        color: Color(0xFF4695A2),
                        fontSize: 31,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 80),
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
                        controller: addController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "Enter company address",
                            hintStyle: TextStyle(color: Color(0xFF4695A2))),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      String companyAddress = addController.text;

                      GlobalData.companyAddress = '$companyAddress';
                      if(GlobalData.companyAddress != null){

                        try{
                          var ret = await GetAPI.editUser(companyAddress: companyAddress);

                          var jsonObject = json.decode(ret.body);
                          print('tryandcatch');
                          if(ret.statusCode == 200){
                            GlobalData.companyAddress = companyAddress;
                          }
                          else{
                            print('fail');
                          }
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Settings()));
                        } catch(e)
                        {
                          print(e);
                        }
                      }
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
                          "Apply",
                          style: TextStyle(color: Colors.white,fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: (Get.height/4)),
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
