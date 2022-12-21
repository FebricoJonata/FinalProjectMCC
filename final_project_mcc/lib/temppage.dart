import 'package:final_project_mcc/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            'return'
          ),
          onTap: () => {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => HomePage(),
              )
            ),
            (route) => false
          },
        ),
      ),
    );
  }
}