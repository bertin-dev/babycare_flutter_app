

import 'package:babycare_flutter_app/models/user.dart';

class ResponseUser{

  bool success;
  User user;
  String detail;
  String exectime;

  ResponseUser(this.success, this.user, this.detail, this.exectime);
}