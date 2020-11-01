
// Page d'authentification
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:babycare_flutter_app/services/authService.dart';
import 'package:babycare_flutter_app/services/secureStorage.dart';
import 'package:babycare_flutter_app/views/widgets/form/button.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'widgets/form/passwordField.dart';

void main(){
  runApp(Login());
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String userPassword;
  bool _autovalidate = false;
  bool isChecked = true;
  bool _buttonState = true;

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
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    return Container(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
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
              ],
            ),


            SizedBox(height: hv * 0.5),
            Center(child: Column(
              children: <Widget>[
                Text(DemoLocalizations.of(context).trans('connexion'), style: TextStyle(fontSize: 45.0,
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
                      maxLength: 50,
                      hintText: DemoLocalizations.of(context).trans('telephone'),
                      controller: _phoneController,
                      emptyValidatorText: DemoLocalizations.of(context).trans('telephone'),
                      keyboardType: TextInputType.phone,
                      validator: _phoneFieldValidator,
                      icon: Icons.phone,
                      labelColor: Colors.black45,
                    ),
                    // Champ de texte du mot de passe
                    CustomPasswordField(
                      hintText: DemoLocalizations.of(context).trans('mdp'),
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: DemoLocalizations.of(context).trans('mdp'),
                      validator: _passwordFieldValidator,
                      color: Colors.black45,
                    ),

                    SizedBox(height: hv * 1.0,),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 190.0, right: 10.0),
                          child: InkWell(onTap: _forgotPassword,
                              child: Text(DemoLocalizations.of(context).trans('mdp_oublie'),
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
                              child: Text(DemoLocalizations.of(context).trans('inscrivez_vous'),
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

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: CustomButton(
                            color: Color(0xff191934),
                            text: DemoLocalizations.of(context).trans('valider'),
                            textColor: Colors.white,
                            onPressed: () async {
                              //Navigator.pushNamed(context, '/home');
                              authentication(context);
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
                    SizedBox(height: 20.0),
                    Center(
                      child: InkWell(onTap: _confidentiality,
                          child: Text(DemoLocalizations.of(context).trans('politique_confidentiality'),
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

      // Processus d'authentification à l'aide du service d'authentification

      dynamic response = await AuthService.login(
          phone: _phoneController.text, password: _passwordController.text, secret: "2020babyCARECustumerCode");

      if(response.runtimeType == String){
        _showDialogLogin(response);
        setState(() {
          _buttonState = true;
        });
        return;
      }


      if(response.statusCode == 200){
        response = json.decode(response.body);
        print(response);
        // Sauvegarde des tokens dans le secure storage à l'aide du service de sauvegarde sécurisée
        SecureStorage.tokenStorage(access_token: response["access_token"].toString());
        //AuthService.savePhone(_phoneController.text);

        //redirection vers la HomePage
        Navigator.pushNamed(context, '/home', arguments: _phoneController.text);

      } else if(response.statusCode == 500){
        response = json.decode(response.body);
        print(response);
        _showDialogLogin(response["exception"]+ " " + response["message"]);
      }
      else{
        response = json.decode(response.body);
        print(response["error"]);
        _showDialogLogin(response["error"]);
      }

      setState(() {
        _buttonState = true;
      });

    }
  }

  //Lien des Mots de passe oublié
  _forgotPassword() {
    Navigator.pushNamed(context, '/forgot_password');
  }

  //Lien d'inscription
  _registerClicked(){
    Navigator.pushNamed(context, '/register');
  }

  // Fonction de validation du mot de passe
  String _passwordFieldValidator(String value) {
    if (value.isEmpty) {
      return DemoLocalizations.of(context).trans('mdp');
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the password is valid
      return null;
    }
    // The pattern of the password didn't match the regex above.
    return DemoLocalizations.of(context).trans('mdp_caracters_number');
  }


  //Fonction de validation du numéro de téléphone
  String _phoneFieldValidator(String value) {
    if (value.isEmpty) {
      return DemoLocalizations.of(context).trans('telephone');
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return DemoLocalizations.of(context).trans('phone_caracters_number');
  }


  //Lien de confidentialité
  void _confidentiality() {
    Navigator.pushNamed(context, '/confidentiality');
  }

  //boite de dialog pour les erreurs
  /*void _showDialog(String response) {
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
  }*/

  /*
   void _showDialog(String response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
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
   */


  void _showDialogLogin(String response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: new Text(DemoLocalizations.of(context).trans('connexion')),
            content: new Text(response),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: (){
                    Navigator.of(context).pop("Discard");
                  },
                isDestructiveAction: false,
                isDefaultAction: true,
                textStyle: TextStyle(),
                child: Text("OK")
              )
            ],
          );
        }
    );
  }


}

