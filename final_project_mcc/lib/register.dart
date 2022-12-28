import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                hintText: "Input your email",
                labelText: "Email"),
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
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your password again",
                labelText: "Password Confirmation"),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ),
        ]),
      ),
    );
  }
}
