import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/dropdownField.dart';
import 'package:babycare_flutter_app/views/widgets/form/passwordField.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';

import '../main.dart';


void main(){
  runApp(MaterialApp(
   // title: '',
    home: Confidentiality(),
    debugShowCheckedModeBanner: false,
  ));

}

class Confidentiality extends StatefulWidget {
  @override
  _ConfidentialityState createState() => _ConfidentialityState();
}

class _ConfidentialityState extends State<Confidentiality> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(DemoLocalizations.of(context).trans('politique_confidentiality'), style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

}