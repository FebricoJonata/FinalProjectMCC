import 'package:final_project_mcc/register.dart';
import 'package:final_project_mcc/route.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Register(),
      onGenerateRoute: RouterGenerator.generateRoute,
      // initialRoute: , --> ini buat inisialisasi page pertama
    );
  }
}
