// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:blockchain_app/pages/utilities/get_api.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';
//import 'package:blockchain_app/utilities/get_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
//import 'package:flutter_bcrypt/flutter_bcrypt.dart';

import 'package:blockchain_app/main.dart';

void main() {
  group('Test Login', () {
    // test('First name is returned from login', () async {
    //   String firstName = '';
    //   var res = await GetAPI.login('frankblockchain', 'frankblockchain');
    //   var jsonObject = json.decode(res);
    //   var accessToken = jsonObject["token"];
    //   var jwt = accessToken["accessToken"];
    //   var decodedToken = JwtDecoder.decode(res);
    //   firstName = decodedToken["firstName"];
    //   expect(firstName, 'Frank');
    // });

    test('UserId is returned from login', () async {
      var userId = "-1";
      var res = await GetAPI.login('frankblockchain', 'frankblockchain');
      var jsonObject = json.decode(res);
      var accessToken = jsonObject["token"];
      // var jwt = accessToken["token"];

      var decodedToken = JwtDecoder.decode(accessToken);
      userId = decodedToken["id"];

      expect(userId, "6142877dbe3c8b00165a5a28");
    });

    // test('UserId is returned from login', () async {
    //   var lastName = '';
    //   var res = await GetAPI.login('frankblockchain', 'frankblockchain');
    //   var jsonObject = json.decode(res);
    //   var accessToken = jsonObject["token"];
    //   var jwt = accessToken["accessToken"];
    //   var decodedToken = JwtDecoder.decode(res);
    //   lastName = decodedToken["lastName"];
    //   expect(lastName, 'Gonzalez');
    // });
  });
}
