

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {


  //save token
  static tokenStorage({@required String access_token}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = access_token;
    prefs.setString(key, value);
  }

  //Read token
  static readAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }


  // Delete token
  static void deleteAccessToken() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}
