// Page de souscription
import 'dart:io';
import 'package:babycare_flutter_app/views/widgets/form/button.dart';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/passwordField.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      height: hv * 25,
                      child: SizedBox(child:
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 90.0, right: 90.0),
                        child: Image.asset('assets/icons/souscription/route.png', width: wv * 30,  /*
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

              Text("Veuillez entrer vos", style: TextStyle(fontSize: 15.0,
                  color: Color(0xff191934),
                  fontWeight: FontWeight.bold)),

                  SizedBox(width: 1.0,),

                  Text(" PARAMETRES ", style: TextStyle(fontSize: 15.0,
                      color: Color(0xffF07E10),
                      fontWeight: FontWeight.bold)),


                  SizedBox(width: 1.0,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('de géolocalisation',
                            style: TextStyle(fontSize: 15.0,
                            color: Color(0xff191934),
                            fontWeight: FontWeight.bold))
                      ],
                    )



                ],
                ),
              ]

            )),


            SizedBox(height: hv * 1),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                autovalidate: _autovalidate,
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[

                Column(crossAxisAlignment: CrossAxisAlignment
                    .center, children: <Widget>[

                  //liste déroulante des pays
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 90.0),
                    child: SizedBox(child:
                    DropdownButton<String>(
                      isExpanded: true,
                      underline: Container( //margin: EdgeInsets.only(bottom: 10.0, top: 5),
                        decoration: BoxDecoration(
                          color: Color(0xff191934),
                        ),
                        child: SizedBox(height: 2.3,),
                      ),
                      icon: Icon(Icons.arrow_drop_down,
                          color: Color(0xff191934)),
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('Cameroun',
                              style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold,
                                  fontSize: 18.0,
                                  color: Color(
                                      0xff191934))),
                          value: 'cameroun',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Senegal',
                              style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold,
                                  fontSize: 15.0,
                                  color: Color(
                                      0xff191934))),
                          value: 'sn',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Gabon',
                              style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold,
                                  fontSize: 18.0,
                                  color: Color(
                                      0xff191934))),
                          value: 'gabon',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                              'Tchad',
                              style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold,
                                  fontSize: 13.0,
                                  color: Color(
                                      0xff191934))),
                          value: 'tchad',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          //_idNumberValue = value;
                        });
                        // print(_idNumberValue);
                      },
                      hint: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0),
                        child: Text("pays de résidence"),
                      ),
                      //value: _idNumberValue
                    ),
                      width: 200,
                    ),
                  ),
                      ]),

                    // Champ de texte du numéro

                    CustomTextField(
                      //maxLength: 9,
                      hintText: 'Entrez votre numéro de téléphone',
                      controller: _phoneController,
                      emptyValidatorText: 'Entrez un numéro de téléphone',
                      keyboardType: TextInputType.phone,
                      validator: _phoneFieldValidator,
                      icon: Icons.phone,
                      labelColor: Colors.black45,
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
                          child: CustomButtonNext(
                            color: Color(0xff191934),
                            text: 'Suivant',
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