import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeCommandsBadge extends StatelessWidget {

  final String label;
  final Widget icon;
  final Function function;

  const HomeCommandsBadge({Key key, this.label, this.icon, this.function}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 40.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(360),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: new Offset(1.0, 1.0),
                blurRadius: 1.0,
                spreadRadius: 1.0)
            ],
            ),

            margin: EdgeInsets.only(bottom: 10),
            child: Badge(
              child: InkWell(onTap: function, highlightColor: Color(0xff039BE5).withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: icon,
                ),
              ),
              badgeContent: Text("3", style: TextStyle(color: Colors.white),),
              badgeColor: Colors.red,
              animationType: BadgeAnimationType.scale,
              shape: BadgeShape.circle,
            )
          ),
          Text(label, style: TextStyle(fontSize: 12.0, color: Colors.black87, fontWeight: FontWeight.bold),  textAlign: TextAlign.center,),


        ],
      ),
    );
  }
}