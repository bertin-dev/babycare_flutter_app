import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {

  final String imageLink;
  final String title;
  final String message;
  final Color colorBg;
  final String imageBg;

  const IntroView({Key key, this.imageLink, this.title, this.message, this.colorBg, this.imageBg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv =MediaQuery.of(context).size.width/100;
    return Container(
      child: Scaffold(
        backgroundColor: colorBg,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 50,),
            Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.only(top: 40.0, right: 50, left: 50),
                    //padding: EdgeInsets.symmetric(horizontal: 1.0),
                    margin: EdgeInsets.only(left: 50.0, right: 50.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(imageBg),
                          //fit: BoxFit.cover,
                          scale: 1.5,
                        ),
                    ),

                      child: SizedBox(
                        height: hv * 50,
                        child: SizedBox(child:
                        Padding(
                          padding: const EdgeInsets.only(left: 90.0, right: 90.0),
                          child: Image.asset(imageLink, width: wv*60,  /*
                      height: hv*10,*/),
                        )),
                      )

                  ),
                ],
              ),
            ),
            SizedBox(height: 1,),
            Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 0, right: 40, left: 40),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: hv*5,),
                      Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),

                      SizedBox(height: hv*1.3,),

                      Container(
                        padding: EdgeInsets.only(top: 12.0, bottom: 12, left: 18, right: 12),
                        decoration: BoxDecoration(
                            //color: Colors.red.withOpacity(0.12)
                        ),
                        child: Text(message,
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: hv*2,),
                      /*CustomButton(
                      color: Colors.red, text: buttonLabel, textColor: Colors.white,
                      onPressed: buttonAction,
                    ),*/

                    ],),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}