

import 'country.dart';

class User{


  String id;
  String telephone;
  String state;
  String actication_code;
  String name;
  String gender;
  String birthdate;
  String password;
  String subcription_step;
  String token;
  Country country;

  User(
      this.id,
      this.telephone,
      this.state,
      this.actication_code,
      this.name,
      this.gender,
      this.birthdate,
      this.password,
      this.subcription_step,
      this.token,
      this.country);
}