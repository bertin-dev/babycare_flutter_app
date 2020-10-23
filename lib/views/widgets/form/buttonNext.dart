import 'package:flutter/material.dart';

class CustomButtonNext extends StatelessWidget {
  final Function onPressed;
  final Color textColor;
  final String text;
  final Color color;

  const CustomButtonNext({
    @required this.onPressed,
    @required this.text,
    @required this.textColor,
    @required this.color
  });
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: this.onPressed,
        elevation: 5.0,
        textColor: this.textColor,
        color: this.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.text, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            SizedBox( width: 30.0,),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white, size: 14.0,)
          ],
        )
      ),
    );
  }
}