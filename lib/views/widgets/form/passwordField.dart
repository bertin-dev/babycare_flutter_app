import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  final Function onSavedFunc;
  final TextInputType keyboardType;
  final Function validator;
  final Color color;

  const CustomPasswordField({
    Key key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.validator, 
    this.color
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child:
      TextFormField(
        //maxLength: 5,
        //obscureText: passwordVisible,
        style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xff191934)),
        keyboardType: this.widget.keyboardType,
        decoration: InputDecoration(
          //labelText: this.widget.hintText,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, /*fontSize: 18.0,*/ color: widget.color),
          hintText: this.widget.hintText,
          border: InputBorder.none,
          //hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.grey),
          //filled: true,
          //fillColor: Color.fromRGBO(255, 255, 255, 0.8),
          //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          /*enabledBorder:UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff191934), width: 2.3, style: BorderStyle.solid)
      ),*/
          prefixIcon: Icon(Icons.lock, color: Color(0xff191934)),
          suffixIcon: IconButton( padding: EdgeInsets.all(0.0),
            icon: Icon(
              // Based on passwordVisible state choose the icon
                //passwordVisible ? Icons.visibility : Icons.visibility_off, color: Color(0xff191934),
              passwordVisible ? null : null, color: Color(0xff191934),
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
        validator: this.widget.validator,
        controller: widget.controller,
        onSaved: this.widget.onSavedFunc,)
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
        color: Color(0xffDCDCDC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}