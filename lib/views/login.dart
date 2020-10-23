
// Page d'authentification
import 'dart:io';
import 'package:babycare_flutter_app/views/widgets/form/button.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/form/passwordField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _loginFormKey = GlobalKey<FormState>();
  final _passwordRecoveryFormKey = GlobalKey<FormState>();

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _idNumberController = new TextEditingController();

  TextEditingController _phoneDialogController = new TextEditingController();

  String userPassword;
  bool _autovalidate = false;
  bool _autovalidate2 = false;
  bool isChecked = true;
  bool _buttonState = true;
  bool _button2State = true;
  String _language = 'default';

  @override
  void initState() {
    super.initState();
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    }
    on SocketException catch (_) {
      print('not connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery
        .of(context)
        .size
        .height / 100;
    final wv = MediaQuery
        .of(context)
        .size
        .width / 100;
    return Container(
      /*decoration: BoxDecoration(
          color: Color(0xff191934),
          image: DecorationImage(
            image: AssetImage('assets/icons/souscription/fond_decran.png'),
            fit: BoxFit.cover,
          )
      ),*/
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            //SizedBox(height: hv*10),
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
                      height: hv * 30,
                      child: SizedBox(child:
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 90.0, right: 90.0),
                        child: Image.asset('assets/icons/souscription/logo23.png', width: wv * 30,  /*
                      height: hv*10,*/),
                      )),
                    )
                ),
                /*Column(
                children: <Widget>[
                  SizedBox(child: Image.asset('assets/images/logo.png'), width: wv*30,),
                ],
              ),*/
              ],
            ),


            SizedBox(height: hv * 0.5),
            Center(child: Column(
              children: <Widget>[
                Text("Connexion", style: TextStyle(fontSize: 45.0,
                  color: Color(0xff191934),
                  fontFamily: 'Montez',
                  //fontWeight: FontWeight.w800,
                ))
              ],
            )),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                autovalidate: _autovalidate,
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[

                    // Champ de texte du numéro
                    CustomTextField(
                      maxLength: 9,
                      hintText: 'Entrez votre numéro de téléphone',
                      controller: _phoneController,
                      emptyValidatorText: 'Entrez votre numéro de téléphone',
                      keyboardType: TextInputType.phone,
                      validator: _phoneFieldValidator,
                      icon: Icons.phone,
                      labelColor: Colors.black45,
                    ),
                    // Champ de texte du mot de passe
                    CustomPasswordField(
                      hintText: 'Entrez votre mot de passe',
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: 'Entrez votre mot de passe',
                      validator: _passwordFieldValidator,
                      color: Colors.black45,
                    ),

                    SizedBox(height: hv * 1.0,),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 190.0, right: 10.0),
                          child: InkWell(onTap: _forgotPassword,
                              child: Text("Mot de passe oublié",
                                style: TextStyle(color: Color(0xffff0000),
                                    //fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0),)),
                        ),

                      ],
                    ),

                    SizedBox(height: 30),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 200.0),
                          child: InkWell(onTap: _registerClicked,
                              child: Text("Inscrivez-vous !",
                                style: TextStyle(color: Color(0xff191934),
                                    //fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0),)),
                        ),

                      ],
                    ),

                    SizedBox(height: 10),
                    // Bouton de soumission

                    _buttonState ?

                    /*Column(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: TextFieldContainer(
                            child: TextField()
                          ),
                          )
                        ],
                      ),*/

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: CustomButton(
                            color: Color(0xff191934),
                            text: 'Valider',
                            textColor: Colors.white,
                            onPressed: () async {
                              //authentication(context);
                            },
                          ),
                        ),
                        SizedBox(height: 3),
                        /*Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: CustomButton(
                          color: Color(0xff039BE5),
                          text: 'SOUSCRIPTION',
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/autoRegister');
                            //Navigator.pushNamed(context, '/renewSubscription');
                          },
                        ),
                      ),*/
                      ],
                    )

                        : Theme(child: CircularProgressIndicator(
                      backgroundColor: Color(0xff039BE5).withOpacity(0.1),),
                      data: ThemeData(
                          accentColor: Color(0xff039BE5).withOpacity(0.6)),),
                    SizedBox(height: 20.0),
                    Center(
                      child: InkWell(onTap: _confidentiality,
                          child: Text("Politique de confidentialité",
                            style: TextStyle(color: Color(0xffff0000),
                                //fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0),)),
                    ),
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

  authentication(BuildContext context) async {
    setState(() {
      _autovalidate = true;
    });


    //REDIRECTION VERS LA PAGE D'ACCUEIL
    if (_loginFormKey.currentState.validate()) {

      setState(() {
        _buttonState = false;
      });

      // Test pour m'assurer que les valeurs sont bien recupérées
      print("Phone number: ${_phoneController
          .text} \nPassword: ${_passwordController.text}");

      setState(() {
        _buttonState = true;
      });

    }
  }

  //Fonction qui gère les Mots de passe oublié

  _forgotPassword() {
    Navigator.pushNamed(context, '/home');
  }

// Fonction d'authentification

  _passwordRecovery(BuildContext context) async {
    setState(() {
      _autovalidate2 = true;
    });

    if (_passwordRecoveryFormKey.currentState.validate()) {
      print("Phone number: ${_phoneDialogController.text} \nNumber: ${_idNumberController.text}\nId Type: 1");

      setState(() {
        _button2State = true;
      });
    }
    else {
      setState(() {
        _autovalidate2 = true;
      });
    }
  }

  _registerClicked(){
    Navigator.pushNamed(context, '/register');
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
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{13}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return 'Phone number must be 13 characters long';
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


  void _confidentiality() {
    Navigator.pushNamed(context, '/register_step_final');
  }
  /*
  void _confidentiality() {
    Navigator.pushNamed(context, '/activation');
  }
   */
}

/*class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xff191934),
        borderRadius: BorderRadius.circular(29),
      ),
    );
  }
}*/
