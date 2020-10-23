import 'package:flutter/material.dart';
import 'routes.dart';

// Voici la page racine de l'application

final GlobalKey<NavigatorState> _navigatorKey = new GlobalKey<NavigatorState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        onGenerateRoute: Routes.generateRoute,           //Ici on établit une connexion entre la page racine et notre fichier de routage
        theme: ThemeData(
          primarySwatch: Colors.blue,
        )
    );
  }
}
