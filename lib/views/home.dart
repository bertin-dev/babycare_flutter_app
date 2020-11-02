import 'dart:convert';

import 'package:babycare_flutter_app/views/widgets/homeCommands.dart';
import 'package:babycare_flutter_app/views/widgets/homeCommandsBadge.dart';
import 'package:flutter/material.dart';

import '../main.dart';

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
                  height: hv * 50,

                  child: SizedBox(child:
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 1.0, left: 20.0, right: 20.0),
                    child: Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(DemoLocalizations.of(context).trans('bienvenue'), style: TextStyle(fontSize: 45.0,
                          color: Color(0xff191934),
                          fontFamily: 'Montez',
                          //fontWeight: FontWeight.w800,
                        )),
                        SizedBox(height: 10.0,),
                        Text(DemoLocalizations.of(context).trans('uda'), style: TextStyle(fontSize: 80.0,
                          color: Color(0xffe8551b),
                          fontWeight: FontWeight.bold,
                        )),
                        Text(DemoLocalizations.of(context).trans('titre_accueil'), style: TextStyle(fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                        ), textAlign: TextAlign.center,),
                        SizedBox(height: 1.0,),
                      ],
                    )),
                  ),),
                ),
            ),
          ],
        ),


        //SizedBox(height: hv * 1),

        Container(
          margin: const EdgeInsets.only(left:20.0, right: 20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: Column(children: <Widget>[
                  HomeCommands(
                      label: DemoLocalizations.of(context).trans('prendre_en_charge_une_urgence'),
                      function: () {
                        Navigator.pushNamed(context, '/withraw');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/social-care.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommands(
                      label: DemoLocalizations.of(context).trans('prendre_un_rendez_vous'),
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
                      label: DemoLocalizations.of(context).trans('signaler_une_urgence'),
                      function: () {
                        Navigator.pushNamed(context, '/payInvoice');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/siren.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommands(
                      label: DemoLocalizations.of(context).trans('ma_sante_en_main'),
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
                      label: DemoLocalizations.of(context).trans('mon_medecin_traitant'),
                      function: () {
                        Navigator.pushNamed(context, '/verifyAccount');
                      },
                      icon: SizedBox(child: Image.asset(
                        'assets/icons/souscription/doctor.png', width: 45.0,
                        height: 45.0,))
                  ),
                  HomeCommandsBadge(
                      label: DemoLocalizations.of(context).trans('forum'),
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