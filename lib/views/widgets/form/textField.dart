import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  final Function onSavedFunc;
  final TextInputType keyboardType;
  final IconData icon;
  final Function validator;
  final Function onChangedFunc;
  final int maxLength;
  final Color labelColor;

  const CustomTextField({
    Key key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.icon,
    this.validator,
    this.onChangedFunc, 
    this.maxLength,
    this.labelColor
  });
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(

      child: maxLength != null ? TextFormField(
        style: TextStyle(fontWeight: FontWeight.w500, /*fontSize: 18.0,*/ color: Color(0xff191934)),
        cursorColor: Color(0xff191934),
        //maxLength: maxLength,
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
          //suffixIcon: Icon(this.icon, color: Color(0xff191934),),
          //labelText: this.hintText,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, /*fontSize: 18.0,*/ color: this.labelColor),
          prefixIcon: Icon(this.icon, color: Color(0xff191934)),
          //icon: Icon(Icons.person, color: Color(0xff191934)),
          border: InputBorder.none,
          hintText: this.hintText,
          //filled: true,
          //fillColor: Color.fromRGBO(255, 255, 255, 0.7), 
          //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          /*enabledBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff191934), width: 2.3, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(29)
          )*/
        ),
        validator: this.validator,
        controller: controller,
        onChanged: this.onChangedFunc,
        onSaved: this.onSavedFunc,
      )
      :
      TextFormField(
        style: TextStyle(fontWeight: FontWeight.bold, /*fontSize: 15.0,*/ color: Color(0xff191934)),
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          //labelText: this.hintText,
          prefixIcon: Icon(this.icon, color: Color(0xff191934)),
          labelStyle: TextStyle(fontWeight: FontWeight.bold, /*fontSize: 15.0,*/ color: this.labelColor),
          //filled: true,
          //fillColor: Color.fromRGBO(255, 255, 255, 0.7), 
          //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          /*enabledBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff191934), width: 2.0, style: BorderStyle.solid)
          )*/
        ),
        validator: this.validator,
        controller: controller,
        onChanged: this.onChangedFunc,
        onSaved: this.onSavedFunc,
      )
      ,
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}