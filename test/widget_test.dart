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
    test('First name is returned from login', () async {
      String username = '';
      var res = await GetAPI.login('franfranfran', 'frank');
      var jsonObject = json.decode(res);
      // var accessToken = jsonObject["token"];
      // var jwt = accessToken["accessToken"];
      // var decodedToken = JwtDecoder.decode(res);
      username = jsonObject["username"];
      expect(username, 'franfranfran');
    });

    test('name is returned from login', () async {
      var firstName = "";
      var res = await GetAPI.login('franfranfran', 'frank');
      var jsonObject = json.decode(res);
      // var accessToken = jsonObject["token"];
      // var jwt = accessToken["token"];
      // var decodedToken = JwtDecoder.decode(accessToken);
      firstName = jsonObject["name"];

      expect(firstName, "mrfranz");
    });

    test('email is returned from login', () async {
      var email = '';
      var res = await GetAPI.login('franfranfran', 'frank');
      var jsonObject = json.decode(res);
      // var accessToken = jsonObject["token"];
      // var jwt = accessToken["accessToken"];
      // var decodedToken = JwtDecoder.decode(res);
      email = jsonObject["email"];
      expect(email, 'franklyngonzalez94@gmail.com');
    });
  });
}
