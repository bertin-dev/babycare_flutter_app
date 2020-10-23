import 'package:babycare_flutter_app/views/activation.dart';
import 'package:babycare_flutter_app/views/home.dart';
import 'package:babycare_flutter_app/views/introductionViews.dart';
import 'package:babycare_flutter_app/views/login.dart';
import 'package:babycare_flutter_app/views/register.dart';
import 'package:babycare_flutter_app/views/registerStepFinal.dart';
import 'package:babycare_flutter_app/views/splashScreen.dart';
import 'package:flutter/material.dart';
// La gestion du routage général se fait ici

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());   // Route de la page de chargement
      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroductionViews());   // Route de la page d'introduction
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());   // Route de la page d'authentification
      case '/register':
        return MaterialPageRoute(builder: (context) => Register());   // Route de la page d'enregistrement
      case '/register_step_final':
        return MaterialPageRoute(builder: (context) => RegisterStepFinal());   // Route de la page d'enregistrement etape finale'
      case '/home':
        return MaterialPageRoute(builder: (context) => Home());   // Route de la page d'enregistrement
      case '/activation':
        return MaterialPageRoute(builder: (context) => Activation());   // Route de la page du code d'activation



    // Cette page sera chargée par défaut au cas où on ait commit une erreur sur une route
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(
                    child:Text('Erreur 404 : Page Introuvable')
                )
            )
        );
    }
  }
}