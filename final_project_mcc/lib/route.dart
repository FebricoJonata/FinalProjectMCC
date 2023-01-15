import 'package:final_project_mcc/views/HomePage.dart';
import 'package:final_project_mcc/views/LoginPage.dart';
import 'package:final_project_mcc/views/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'Tidak ada route yang ditemukan untuk ${settings.name}')),
                ));
    }
  }
}
