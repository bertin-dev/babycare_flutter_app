import 'package:flutter/material.dart';

// Widget : Menu glissant

class CustomDropDownField extends StatefulWidget {
  final String label;
  final String hintText;
  final Function onChangedFunc;
  final String value;
  final List<DropdownMenuItem<String>> items;

  const CustomDropDownField({Key key, this.label, this.hintText, this.onChangedFunc, this.value, this.items}) : super(key: key);


  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    final wv =MediaQuery.of(context).size.width/100;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(child: Text(widget.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff191934)),),),
          ),
          Expanded(
            child: ButtonTheme(alignedDropdown: true,
              child: DropdownButton<String>(
                isExpanded: true,
                /* underline: Container(margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              color: Color(0xff191934),
                            ),
                            child: SizedBox(height: 2.3,),
                    ),*/
                icon: Icon(Icons.arrow_drop_down, color: Color(0xff191934)),
                items: widget.items,
                onChanged: widget.onChangedFunc,
                hint: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(widget.hintText),
                ),
                value: widget.value,
              ),
            ),
          ),
        ],
      ),
          );
  }
}


/*

class CustomDropDownField extends StatefulWidget {
  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text("Genre", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white.withOpacity(0.8)),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 0.0, right: 10.0, left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.8),
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(MdiIcons.arrowDownCircle, color: Colors.blue[300],),
                              ),
                            items: [
                              DropdownMenuItem<String>(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text('Male'),
                                ),
                                value: 'male',
                              ),
                              DropdownMenuItem<String>(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text('Female'),
                                ),
                                value: 'female',
                              )
                            ],
                            onChanged: (String value) {
                              setState(() {
                                _value = value;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text('Choisir le sexe '),
                            ),
                            value: _value,
                    ),
                          ),
                        ),
                      ),
                    ],);
  }
}

*/