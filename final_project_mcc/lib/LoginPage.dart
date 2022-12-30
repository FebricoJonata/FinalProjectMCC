import 'package:final_project_mcc/HomePage.dart';
import 'package:final_project_mcc/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // navigation dah ada tapi belum validasi sama ambil API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),


      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        // crossAxisAlignment: CrossAxisAlignment.center, 
        children: [

          Container( // logo
            height: 100,
            // child: SvgPicture.asset('assets/logo/Logo HE FISH (2).svg'),
            child: Image.asset('assets/Logo/Logo HE FISH.png'),
          ),

          SizedBox( // spacing
            height: 36,
          ),

          TextFormField( // username
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your Username",
                labelText: "Username"),
          ),

          SizedBox( // spacing
            height: 24,
          ),

          TextFormField( // password
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your password",
                labelText: "Password"),
                obscureText: true,
          ),

          SizedBox( // spacing
            height: 44,
          ),

          Container( // login button
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // masukin validasi
                Navigator.push(context, RouterGenerator.generateRoute(
                    RouteSettings(
                      name: '/',
                    )
                  )
                );
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox( // spacing
            height: 24,
          ),

          Text('or'), // text 'or'

          SizedBox( // spacing
            height: 24,
          ),

          Container( // google button
            width: 220,
            height: 40,
            child: ElevatedButton(
                  onPressed: () {
                    // generate token
                    Navigator.push(context, RouterGenerator.generateRoute(
                        RouteSettings(
                          name: '/',
                        )
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/Logo/logo Google.png'),
                      Text(
                        "Login with Google",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                    ],
                  )
                ),
          ),

          SizedBox( // spacing
            height: 44,
          ),

          Row( // ke register
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: TextStyle(fontSize: 16),),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, RouterGenerator.generateRoute(
                        RouteSettings(
                          name: '/register'
                        )
                      )
                    );
                  }, 
                  child: Text(
                    'Register Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )

        ]),
      ),
    );
  }
}
