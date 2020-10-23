import 'dart:async';

import 'package:flutter/material.dart';

//Page de chargement

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            (){
          Navigator.pushNamed(context, '/intro');
        }
    )
    ;
  }

  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv =MediaQuery.of(context).size.width/100;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff191934)
          /*image: DecorationImage(
            image: AssetImage('assets/icons/souscription/logo3.png'),
            fit: BoxFit.cover,
          )*/
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(child: Image.asset('assets/icons/souscription/logo1.png'), width: wv*40,),
                //SizedBox(height: hv*3,),
                //Text('Uda', style:TextStyle(fontSize: 60.0, color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                Text("Your Doctor Assistance's", style:TextStyle(fontSize: 17.0, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600))
              ],
            ),

          ],
        ),
      ),
    );
  }
}