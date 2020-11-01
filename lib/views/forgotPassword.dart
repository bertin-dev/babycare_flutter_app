
import 'dart:async';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController _phoneController = new TextEditingController();
  bool _buttonState = true;
  String appBarMenuValue;
  bool _autovalidate = false;
  String userPassword;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          title: Text("Enregistrement"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value){
                setState(() {
                  appBarMenuValue = value;
                });
                Navigator.pushNamed(context, '/register_step_final');
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "apropos",
                  child: Text("A propos"),
                ),
                PopupMenuItem(
                  value: "tutoriel",
                  child: Text("tutoriel"),
                ),
                PopupMenuItem(
                  value: "moncompte",
                  child: Text("Mon compte"),
                ),
              ],
            )
          ],
        ),*/
        appBar: AppBar(
          backgroundColor: Colors.white,
          /*iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),*/
          title: Text("Sample"),
          centerTitle: true,
          elevation: 0.0,
          /*actions: <Widget>[
            new IconButton(
              icon: new Image.asset('assets/icons/souscription/fleche_gauche.png'),
              tooltip: 'Closes application',
              onPressed: () => exit(0),
            ),
          ],*/
          leading: IconButton(
            icon: Image.asset('assets/icons/souscription/fleche_gauche.png'),
            tooltip: 'OnBackPressed',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: hv*2),
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                    child: SizedBox(
                      height: hv * 20,
                      child: SizedBox(child:
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 0.0, right: 0.0),
                        child: Image.asset('assets/icons/souscription/contact.png', width: wv * 50,  /*
                      height: hv*10,*/),
                      )),
                    )
                ),
              ],
            ),

            SizedBox(height: hv * 3),


            Center(child: Column(
                children: <Widget>[
                  Container(
                    //padding: const EdgeInsets.only(left:10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(DemoLocalizations.of(context).trans('veuillez_entrer_votre'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xff191934),
                                fontWeight: FontWeight.bold)),
                            Text(DemoLocalizations.of(context).trans('numero_de'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xffe8551b),
                                fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(DemoLocalizations.of(context).trans('telephoneUppercase'), style: TextStyle(fontSize: 15.0,
                            color: Color(0xffe8551b),
                            fontWeight: FontWeight.bold)),

                        SizedBox(height: 10.0,),
                      ],
                    ),
                  )
                ]

            )),


            SizedBox(height: hv * 5),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                autovalidate: _autovalidate,
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[


                    // Champ de texte du numéro
                    CustomTextField(
                      maxLength: 9,
                      hintText: DemoLocalizations.of(context).trans('telephone'),
                      controller: _phoneController,
                      emptyValidatorText: DemoLocalizations.of(context).trans('telephone'),
                      keyboardType: TextInputType.phone,
                      validator: _phoneFieldValidator,
                      icon: Icons.phone,
                      labelColor: Colors.black45,
                    ),


                    SizedBox(height: 100.0),


                    //SizedBox(height: 100),

                    // Bouton de soumission

                    _buttonState ?

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: CustomButtonNext(
                            color: Color(0xff191934),
                            text: DemoLocalizations.of(context).trans('suivant'),
                            textColor: Colors.white,
                            onPressed: () async {
                              Navigator.pushNamed(context, '/activation_forgot_password');
                              //authentication(context);
                            },
                          ),

                        ),
                        SizedBox(height: 3),
                      ],
                    )

                        : Theme(child: CircularProgressIndicator(
                      backgroundColor: Color(0xff039BE5).withOpacity(0.1),),
                      data: ThemeData(
                          accentColor: Color(0xff039BE5).withOpacity(0.6)),),


                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  // Fonction d'authentification
  _register (BuildContext context) async {

    print("Phone: ${_phoneController.text}\n");
    setState(() {
      _autovalidate = true;
    });

    if (_registerFormKey.currentState.validate()) {
      setState(() {
        _buttonState = false;
      });

      Timer(Duration(seconds: 3),
              (){
            setState(() {
              _buttonState = true;
            });
          }
      );
      setState(() {
        _buttonState = false;
      });

      setState(() {
        _autovalidate = true;
      });
    }
  }

  // Fonction de validation du mot de passe

  String _passwordFieldValidator(String value) {
    if (value.isEmpty) {
      return "Entrez votre mot de passe";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{5,5}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the password is valid
      return null;
    }
    // The pattern of the password didn't match the regex above.
    return 'Password must be 5 characters long';
  }


  //Fonction de validation du numéro de téléphone

  String _phoneFieldValidator(String value) {
    if (value.isEmpty) {
      return "Entrez un numéro";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{9}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return 'Phone number must be 9 characters long';
  }


  //boite de dialog pour les erreurs
  void _showDialog(String response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Information'),
            content: new Text(response),
            actions: <Widget>[
              new RaisedButton(onPressed: () {
                Navigator.of(context).pop();
              })
            ],
          );
        }
    );
  }

  //boite de dialog pour les erreurs
  void _showDialogForgotPassword(String response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Information'),
            content: new Text(response),
            actions: <Widget>[
              new RaisedButton(onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/login');

              })
            ],
          );
        }
    );
  }




}