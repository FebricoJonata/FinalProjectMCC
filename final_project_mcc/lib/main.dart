// import 'package:final_project_mcc/views/register.dart';
import 'package:final_project_mcc/route.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'views/homepage.dart';

void main() {
  runApp(const MyApp());
}

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

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
      // initialRoute: const Register(), 
      // --> ini buat inisialisasi page pertama
    );
  }
}
