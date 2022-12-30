import 'package:final_project_mcc/route.dart';
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
        title: Text('Create New Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Input your Username",
                  labelText: "Username"),
            ),
            SeparatorSizedBoxRegisterPage(),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Input your email",
                  labelText: "Email"),
            ),
            SeparatorSizedBoxRegisterPage(),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Input your password",
                  labelText: "Password"),
            ),
            SeparatorSizedBoxRegisterPage(),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Input your password again",
                  labelText: "Password Confirmation"),
            ),
            
            SizedBox( // spacing
              height: 44,
            ),

            ElevatedButton( // login button
              onPressed: () {
                // masukin validasi
                Navigator.push(context, RouterGenerator.generateRoute(
                    RouteSettings(
                      name: '/login',
                    )
                  )
                );
              }, 
              child: Text(
                "Register",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)
                ),
                minimumSize: Size(110, 50)
              ), 
            ),

            SizedBox( // spacing
              height: 44,
            ),

            Row( // ke register
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(fontSize: 16),),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, RouterGenerator.generateRoute(
                        RouteSettings(
                          name: '/login'
                        )
                      )
                    );
                  }, 
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}



class SeparatorSizedBoxRegisterPage extends StatelessWidget {
  const SeparatorSizedBoxRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
    );
  }
}
