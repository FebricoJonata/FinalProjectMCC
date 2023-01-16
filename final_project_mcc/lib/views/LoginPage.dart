import 'dart:convert';

import 'package:final_project_mcc/Hosting.dart';
import 'package:final_project_mcc/models/user.dart';
import 'package:final_project_mcc/views/HomePage.dart';
import 'package:final_project_mcc/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_svg/flutter_svg.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   // navigation dah ada tapi belum validasi sama ambil API

//   @override
//   Widget build(BuildContext context) {

//   }
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Login'),
      // ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),

                Container(
                  // logo
                  height: 100,
                  // child: SvgPicture.asset('assets/logo/Logo HE FISH (2).svg'),
                  // child: Image(image: AssetImage('assets/Logo/Logo_HE_FISH.png', package: 'assets/Logo')),
                  child: Image.asset('assets/Logo/Logo_HE_FISH.png'),
                ),

                SizedBox(
                  // spacing
                  height: 36,
                ),

                TextFormField(
                  // username
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Input your Username",
                      labelText: "Username"),
                  controller: usernameController,
                ),

                SizedBox(
                  // spacing
                  height: 24,
                ),

                TextFormField(
                  // password,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Input your password",
                    labelText: "Password",
                    // suffixIcon: Icon(Icons.remove_red_eye_rounded)
                  ),
                  controller: passwordController,
                ),

                SizedBox(
                  // spacing
                  height: 44,
                ),

                ElevatedButton(
                  // login button
                  onPressed: () async {
                        // validasi
                        if (validasi(usernameController, passwordController, context)) {
                  String url =
                        "http://${Hosting.main}/users/login/${usernameController.text}"; // ganti link localhost
                        final response = await http.get(Uri.parse(url),
                        headers: {
                          "Content-Type": "application/json; charset=UTF-8",
                          "Accept": "application/json"
                        });
                        if (response.body.isNotEmpty) {
                          User user = User.fromJson(jsonDecode(response.body));
                          if (user.password==passwordController.text){
                            Navigator.pushReplacement(
                            context,
                            RouterGenerator.generateRoute(RouteSettings(
                              name: '/',
                            )));
                          }
                        }
                        
                    }               
                  },

                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      minimumSize: Size(100, 50)),
                ),

                SizedBox(
                  // spacing
                  height: 24,
                ),

                Text('or'), // text 'or'

                SizedBox(
                  // spacing
                  height: 24,
                ),

                ElevatedButton(
                  // google login button
                  onPressed: () {
                    // masukin validasi
                    Navigator.push(
                        context,
                        RouterGenerator.generateRoute(RouteSettings(
                          name: '/',
                        )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/Logo/logo_Google.png'),
                      Text("Login with Google",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      primary: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      minimumSize: Size(100, 50),
                      maximumSize: Size(220, 70)),
                ),

                SizedBox(
                  // spacing
                  height: 44,
                ),

                Row(
                  // ke register
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            RouterGenerator.generateRoute(
                                RouteSettings(name: '/register')));
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

bool validasi(
    TextEditingController usernameController,
    TextEditingController passwordController,
    context) {
  String pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
  RegExp regex = RegExp(pattern);

  if (usernameController.text.isEmpty ||
      passwordController.text.isEmpty) {
    const snackBar = SnackBar(content: Text("All fields must be filled!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  } else if (usernameController.text.length < 4) {
    const snackBar =
        SnackBar(content: Text("Username must be at least 4 characters long"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  } else if (!regex.hasMatch(passwordController.text)) {
    const snackBar = SnackBar(
        content: Text(
            "Password must contains at least 1 upper, lower, and number character"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  // } else if () {
  //   const snackBar = SnackBar(
  //       content:
  //           Text("The field Confirm Password is not the same as Password"));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   return false;
  }

  return true;
}