import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 100,
            child: SvgPicture.asset('assets/logo/Logo HE FISH.svg'),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your Username",
                labelText: "Username"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your password",
                labelText: "Password"),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
