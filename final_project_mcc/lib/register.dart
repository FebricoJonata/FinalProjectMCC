import 'package:final_project_mcc/route.dart';
import 'package:final_project_mcc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Create New Account'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              SizedBox(
                height: 150,
              ),
              TextFormField(
                maxLength: 25,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: "Input your Username",
                    labelText: "Username"),
                controller: usernameController,
              ),
              SeparatorSizedBoxRegisterPage(),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: "Input your email",
                    labelText: "Email"),
                controller: emailController,
              ),
              SeparatorSizedBoxRegisterPage(),
              TextFormField(
                maxLength: 50,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: "Input your password",
                    labelText: "Password"),
                controller: passwordController,
              ),
              SeparatorSizedBoxRegisterPage(),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: "Input your password again",
                    labelText: "Password Confirmation"),
                controller: confirmPasswordController,
              ),
              
              SizedBox( // spacing
                height: 44,
              ),
      
              ElevatedButton( // register button
                onPressed: () {
                  // detail validasinya di paling bawah
                  if(validasi(usernameController, emailController, passwordController,
                  confirmPasswordController, context)){
                    user = User(usernameController.text, emailController.text, passwordController.text);
                    //buat cek kalo kesimpen di variabelnya
                    // print(user.username + " " + user.email + " " + user.password);

                    // variabelnya daftarin ke database pake api & sql :)  

                    Navigator.push(context, RouterGenerator.generateRoute(
                      RouteSettings(
                        name: '/login',
                      )
                    ));
                  }

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
      
              Row( // ke login
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


// buat validasinya
bool validasi(TextEditingController usernameController, TextEditingController emailController, TextEditingController passwordController, TextEditingController confirmPasswordController, context){

  String pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
  RegExp regex = RegExp(pattern);

  if(usernameController.text.isEmpty||emailController.text.isEmpty||
  passwordController.text.isEmpty||confirmPasswordController.text.isEmpty){
    const snackBar = SnackBar(content: Text("All fields must be filled!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }
    
  else if(usernameController.text.length<4){
    const snackBar = SnackBar(content: Text("Username must be at least 4 characters long"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }
  
  else if(!regex.hasMatch(passwordController.text)){
    const snackBar = SnackBar(content: Text("Password must contains at least 1 upper, lower, and number character"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }
                  
  else if(confirmPasswordController.text!=passwordController.text){
    const snackBar = SnackBar(content: Text("The field Confirm Password is not the same as Password"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }

  return true;            

}