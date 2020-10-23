import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Color textColor;
  final String text;
  final Color color;

  const CustomButton({
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
        child: Padding(
          padding: const EdgeInsets.only(top:12.0, bottom: 12.0),
          child: Text(this.text, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}