
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:babycare_flutter_app/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {


  /*----------------------------------------------------------UDA SERVICE-------------------------------------------------------*/
  //Service d'Authentification
  static dynamic login({ @required String phone, @required String password, @required String secret }) async {

    try {
      String myUrl = Endpoints.baseUrl + Endpoints.login;
      final response = await http.post(myUrl,
          headers: {
            'Accept': 'application/json'
          },
          body: {
            "phone" : "$phone",
            "password" : "$password",
            "secret" : "$secret"
          });
      /*var data = json.decode(response.body);
    _save(data["access_token"]);*/
      return response;

    }on TimeoutException catch (_) {
      // A timeout occurred.
      return "Temps écroulé";
    } on SocketException catch (_) {
      // Other exception
      return "Pas de connexion internet";
    }
  }






  /*----------------------------------------------------------SAVE AND PHONE NUMBER-------------------------------------------------------*/
  static savePhone(String tel) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'phone';
    final value = tel;
    prefs.setString(key, value);
  }

  //pas encore utilisé
  static removePhone() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'phone';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
/*----------------------------------------------------------END-------------------------------------------------------*/


}