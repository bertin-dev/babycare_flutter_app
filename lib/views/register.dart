// Page de souscription
import 'dart:io';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:babycare_flutter_app/views/widgets/form/button.dart';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/passwordField.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _registerFormKey = GlobalKey<FormState>();

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
    Size size = MediaQuery.of(context).size;
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
            SizedBox(height: hv*10),
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
                      height: hv * 20,
                      child: SizedBox(child:
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 0.0, right: 0.0),
                        child: Image.asset('assets/icons/souscription/route.png', width: wv * 50,  /*
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

            SizedBox(height: hv * 3),


            Center(child: Column(

              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(DemoLocalizations.of(context).trans('veuillez_entrer_vos'), style: TextStyle(fontSize: 15.0,
                            color: Color(0xff191934),
                            fontWeight: FontWeight.bold)),
                        Text(DemoLocalizations.of(context).trans('parametres'), style: TextStyle(fontSize: 15.0,
                            color: Color(0xffe8551b),
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(DemoLocalizations.of(context).trans('de_geolocalisation'), style: TextStyle(fontSize: 15.0,
                        fontWeight: FontWeight.bold)),

                    SizedBox(height: 10.0,),
                ],
                ),
              ]

            )),


            SizedBox(height: hv * 5),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                autovalidate: _autovalidate,
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[

                    //liste deroulante des pays
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CountryListPick(
                        appBar: AppBar(
                          backgroundColor: Color(0xff191934),
                          title: Text(DemoLocalizations.of(context).trans('choississez_votre_pays_de_residence')),
                        ),
                        // if you need custome picker use this
                        // pickerBuilder: (context, CountryCode countryCode) {
                        //   return Row(
                        //     children: [
                        //       Image.asset(
                        //         countryCode.flagUri,
                        //         package: 'country_list_pick',
                        //       ),
                        //       Text(countryCode.code),
                        //       Text(countryCode.dialCode),
                        //     ],
                        //   );
                        // },
                        theme: CountryTheme(
                          searchHintText: DemoLocalizations.of(context).trans('recherche'),
                          searchText: DemoLocalizations.of(context).trans('recherche_par_pays'),
                          alphabetSelectedTextColor: Color(0xff191934),
                          alphabetTextColor: Color(0xff191934),
                          alphabetSelectedBackgroundColor: Color(0xff191934),
                          isShowFlag: true,
                          isShowTitle: true,
                          isShowCode: true,
                          isDownIcon: true,
                          showEnglishName: true,
                        ),
                        initialSelection: '+237',
                        onChanged: (CountryCode code) {
                          print(code.name);
                          print(code.code);
                          print(code.dialCode);
                          print(code.flagUri);
                        },
                      ),
                    ),

                    SizedBox(height: hv * 2),

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

                    SizedBox(height: 100),

                    // Bouton de soumission

                    _buttonState ?

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: CustomButtonNext(
                            color: Color(0xff191934),
                            text: DemoLocalizations.of(context).trans('suivant'),
                            textColor: Colors.white,
                            onPressed: () async {
                              Navigator.pushNamed(context, '/activation');
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
      print("Phone number: ${_phoneController
          .text} \nPassword: ${_passwordController.text}");

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