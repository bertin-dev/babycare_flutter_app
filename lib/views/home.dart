import 'dart:convert';

import 'package:babycare_flutter_app/views/widgets/homeCommands.dart';
import 'package:babycare_flutter_app/views/widgets/homeCommandsBadge.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var userData;
  var role = "";
  var etat = "";
  var _isVisible;

  @override
  void initState() {
    _isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv = MediaQuery.of(context).size.width / 100;

    return Scaffold(

      body: ListView(children: <Widget>[

        Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              /*decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/bg3.png'),
                        fit: BoxFit.cover,
                      )
                  ),*/
                child: SizedBox(
                  height: hv * 40,

                  child: SizedBox(child:
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 90.0, right: 90.0),
                    child: Center(child: Column(
                      children: <Widget>[
                        Text("Bienvenue", style: TextStyle(fontSize: 45.0,
                          color: Color(0xff191934),
                          fontFamily: 'Montez',
                          //fontWeight: FontWeight.w800,
                        )),
                        SizedBox(height: 10.0,),
                        Text("Uda", style: TextStyle(fontSize: 80.0,
                          color: Color(0xffe8551b),
                          fontWeight: FontWeight.bold,
                        )),
                        Text("Poser le bon geste au bon moment c'est sauver une vie", style: TextStyle(fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                        ), textAlign: TextAlign.center,),
                        SizedBox(height: 10.0,),
                      ],
                    )),
                  ),),
                ),
            ),
          ],
        ),


        SizedBox(height: hv * 1),

        Container(
          margin: const EdgeInsets.only(left:20.0, right: 20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: Column(children: <Widget>[
                  HomeCommands(
                      label: "Prendre en charge une urgence",
                      function: () {
                        Navigator.pushNamed(context, '/withraw');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/social-care.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommands(
                      label: "Prendre un rendez-vous",
                      function: () {
                        Navigator.pushNamed(context, '/reload');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/video-chat.png', width: 45.0,
                        height: 45.0,))
                  ),
                ],),
              ),
              Expanded(
                child: Column(children: <Widget>[
                  HomeCommands(
                      label: "Signaler une urgence",
                      function: () {
                        Navigator.pushNamed(context, '/payInvoice');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/siren.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommands(
                      label: "Ma Santé en main",
                      function: () {
                        Navigator.pushNamed(context, '/debit');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/heart.png', width: 45.0,
                        height: 45.0,))
                  ),

                ],),
              ),
              Expanded(
                child: Column(children: <Widget>[
                  HomeCommandsBadge(
                      label: "Mon médecin traitant",
                      function: () {
                        Navigator.pushNamed(context, '/verifyAccount');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/doctor.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommandsBadge(
                      label: "Forum",
                      function: () {
                        Navigator.pushNamed(context, '/qr');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/forum.png', width: 45.0,
                        height: 45.0,))
                  ),
                ],
                ),
              ),






            ],),
        ),

        SizedBox(height: 30.0)

      ],),

    );
  }


}