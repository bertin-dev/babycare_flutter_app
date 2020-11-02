
import 'dart:io';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/passwordField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ActivationForgotPassword extends StatefulWidget {
  @override
  _ActivationForgotPasswordState createState() => _ActivationForgotPasswordState();
}

class _ActivationForgotPasswordState extends State<ActivationForgotPassword> {

  final _registerFormKey = GlobalKey<FormState>();

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
            SizedBox(height: hv*7),
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                    child: SizedBox(
                      height: hv * 25,
                      child: SizedBox(child:
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 90.0, right: 90.0),
                        child: Image.asset('assets/icons/souscription/fingerprint.png', width: wv * 30,  /*
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
                    padding: const EdgeInsets.only(left:0.0, right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(DemoLocalizations.of(context).trans('uda2'), style: TextStyle(fontSize: 20.0,
                                color: Color(0xff191934),
                                fontWeight: FontWeight.bold)),
                            Text(DemoLocalizations.of(context).trans('a_envoye_un'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xff191934),
                                fontWeight: FontWeight.bold)),
                            Text(DemoLocalizations.of(context).trans('code'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xffe8551b),
                                fontWeight: FontWeight.bold)),
                            Text(DemoLocalizations.of(context).trans('au'), style: TextStyle(fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(DemoLocalizations.of(context).trans('numero_de_telephone'), style: TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold)),

                        SizedBox(height: 10.0,),

                        Text("+237 691 520 972", style: TextStyle(fontSize: 15.0,
                            color: Color(0xffff0000),
                            fontWeight: FontWeight.bold)),
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

                    // Champ de texte du code d'activation
                    CustomPasswordField(
                      hintText: DemoLocalizations.of(context).trans('code_authentification'),
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: DemoLocalizations.of(context).trans('code_authentification'),
                      validator: _passwordFieldValidator,
                      color: Colors.black45,
                    ),


                    SizedBox(height: 100),

                    // Bouton de soumission

                    _buttonState ?

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(DemoLocalizations.of(context).trans('renvoyer_le_code_dauthentification'),
                          style: TextStyle(color: Color(0xffff0000),
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: CustomButtonNext(
                            color: Color(0xff191934),
                            text: DemoLocalizations.of(context).trans('confirmer'),
                            textColor: Colors.white,
                            onPressed: () async {
                              Navigator.pushNamed(context, '/reset_password');
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

  authentication(BuildContext context) async {
    setState(() {
      _autovalidate = true;
    });


    //REDIRECTION VERS LA PAGE D'ACCUEIL
    if (_registerFormKey.currentState.validate()) {

      setState(() {
        _buttonState = false;
      });

      // Test pour m'assurer que les valeurs sont bien recupérées

      // Processus d'authentification à l'aide du service d'authentification

      /*dynamic response = await AuthService.login(
          phone: _phoneController.text, password: _passwordController.text, secret: "Cnqactz7vnCGKBB7E12yN+17a+2Q/+d7PTkv1jOgcus=");

      if(response.statusCode == 200){
        response = json.decode(response.body);
        print(response);
        // Sauvegarde des tokens dans le secure storage à l'aide du service de sauvegarde sécurisée
        AuthService.saveToken(response["access_token"].toString());
        AuthService.savePhone(_phoneController.text);

        //SecureStorage.tokenStorage(access: response["access_token"].toString(), refresh: response["refresh_token"].toString());

        //redirection vers la HomePage
        Navigator.pushNamed(context, '/home', arguments: _phoneController.text);

      } else if(response.statusCode == 500){
        response = json.decode(response.body);
        print(response);
        _showDialog(response["exception"]+ " " + response["message"]);
      }
      else{
        response = json.decode(response.body);
        print(response["data"]["error"]);
        _showDialog(response["data"]["error"]);
      }*/

      setState(() {
        _buttonState = true;
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