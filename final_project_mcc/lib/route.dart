import 'package:final_project_mcc/HomePage.dart';
import 'package:final_project_mcc/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'Tidak ada route yang ditentukan untuk ${settings.name}')),
                ));
    }
  }
}
