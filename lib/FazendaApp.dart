import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginscreen.dart';

class FazendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Estoque da Fazenda',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: LoginScreen(),
    );
  }
}