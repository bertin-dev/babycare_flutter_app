import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:babycare_flutter_app/views/widgets/form/buttonNext.dart';
import 'package:babycare_flutter_app/views/widgets/form/dropdownField.dart';
import 'package:babycare_flutter_app/views/widgets/form/passwordField.dart';
import 'package:babycare_flutter_app/views/widgets/form/textField.dart';

import '../main.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(RegisterStepFinal());
}

class RegisterStepFinal extends StatefulWidget {
  @override
  _RegisterStepFinalState createState() => _RegisterStepFinalState();
}

class _RegisterStepFinalState extends State<RegisterStepFinal> {

  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _accountNberController = new TextEditingController();
  TextEditingController _idNumberController = new TextEditingController();
  bool _buttonState = true;
  String _genderValue = "male";
  String appBarMenuValue;
  bool _autovalidate = false;
  String userPassword;
  DateTime pickedDate;


  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }


  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    Size size = MediaQuery.of(context).size;
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
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/icons/souscription/man.png'),
                        //fit: BoxFit.cover,
                        scale: 1.5,
                      ),
                    ),
                    child: SizedBox(
                      height: hv * 20,
                      child: SizedBox(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0, right: 0.0),
                                child: Image.asset('assets/icons/souscription/woman.png', width: wv * 50,  /*
                      height: hv*10,*/),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 0.0, right: 90.0),
                                child: Image.asset('assets/icons/souscription/man.png', width: wv * 20,  /*
                      height: hv*10,*/),
                              ),*/
                            ],
                          )
                      ),
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
                            Text(DemoLocalizations.of(context).trans('veuillez_entrer_vos'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xff191934),
                                fontWeight: FontWeight.bold)),
                            Text(DemoLocalizations.of(context).trans('information'), style: TextStyle(fontSize: 15.0,
                                color: Color(0xffe8551b),
                                fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(DemoLocalizations.of(context).trans('personnelles'), style: TextStyle(fontSize: 15.0,
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


                    // Champ de texte du nom
                    CustomTextField(
                        maxLength: 9,
                        hintText: DemoLocalizations.of(context).trans('entrez_votre_nom'),
                        controller: _nameController,
                        emptyValidatorText: DemoLocalizations.of(context).trans('entrez_votre_nom'),
                        keyboardType: TextInputType.text,
                        validator: (str) => str.isEmpty ? DemoLocalizations.of(context).trans('entrez_votre_nom') : null,
                        icon: Icons.person,
                        labelColor: Color(0xff191934)
                    ),
                    
                    //champs date de naissance
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xffDCDCDC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /*Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: SizedBox(child: Text("Ecrivez votre date de naissance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff191934)),),),
                          ),*/
                          ListTile(
                            title: Text( DemoLocalizations.of(context).trans('entre_votre_date_de_naissance') + ": ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff191934)),),
                            trailing: Icon(Icons.keyboard_arrow_down),
                            onTap: _pickDate,
                          ),
                        ],
                      ),
                    ),

                    CustomDropDownField(
                      label: DemoLocalizations.of(context).trans('choississez_votre_sexe'),
                      onChangedFunc: (String value) {
                        setState(() {
                          _genderValue = value;
                        });
                      }, hintText: DemoLocalizations.of(context).trans('votre_sexe'),
                      items: [
                        DropdownMenuItem<String>(
                          child: Text(DemoLocalizations.of(context).trans('masculin'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff191934))),
                          value: 'male',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(DemoLocalizations.of(context).trans('feminin'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff191934))),
                          value: 'female',
                        )
                      ],
                      value: _genderValue,
                    ),


                    CustomPasswordField(
                      hintText: DemoLocalizations.of(context).trans('mdp'),
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: DemoLocalizations.of(context).trans('mdp'),
                      validator: _passwordFieldValidator,
                      color: Colors.black45,
                    ),

                    SizedBox(height: 30.0),


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
                            text: DemoLocalizations.of(context).trans('terminer'),
                            textColor: Colors.white,
                            onPressed: () async {
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


  _pickDate() async{
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year-50),
        lastDate: DateTime(DateTime.now().year+50),
        initialDate: pickedDate
    );

    if(date != null){
      setState(() {
        pickedDate = date;
      });
    }
  }


  // Fonction d'authentification
  _register (BuildContext context) async {

    print("Name: ${_nameController.text}\n\nPhone: ${_phoneController.text}\nNumero de compte: ${_accountNberController.text}\n");
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