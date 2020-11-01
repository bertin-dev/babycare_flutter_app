import 'package:babycare_flutter_app/views/activation.dart';
import 'package:babycare_flutter_app/views/activationForgotPassword.dart';
import 'package:babycare_flutter_app/views/confidentiality.dart';
import 'package:babycare_flutter_app/views/forgotPassword.dart';
import 'package:babycare_flutter_app/views/home.dart';
import 'package:babycare_flutter_app/views/introductionViews.dart';
import 'package:babycare_flutter_app/views/login.dart';
import 'package:babycare_flutter_app/views/register.dart';
import 'package:babycare_flutter_app/views/registerStepFinal.dart';
import 'package:babycare_flutter_app/views/resetPassword.dart';
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
      case '/forgot_password':
        return MaterialPageRoute(builder: (context) => ForgotPassword());   // Route de la page du mot de passe oublié
      case '/activation_forgot_password':
        return MaterialPageRoute(builder: (context) => ActivationForgotPassword());   // Route de la page de l'envoi du code d'activation pour mot de passe oublié
      case '/reset_password':
        return MaterialPageRoute(builder: (context) => ResetPassword());   // Route de la page reinitialiser mot de passe
      case '/confidentiality':
        return MaterialPageRoute(builder: (context) => Confidentiality());   // Route de la page confidentialité


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