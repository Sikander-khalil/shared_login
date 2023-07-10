import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passController = TextEditingController();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),

      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(21.0),
            child: Icon(Icons.account_circle, size: 100, color: Colors.blue,),

            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
            ),
            SizedBox(height: 11,),
            TextField(controller: passController,
              decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
            ),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: () async{

              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(SplashPageState.KEYLOGIN,true);
              setState(() {
                email = emailController.text;
                password = passController.text;
              });

              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MyHomePage(email: email, password: password),));

            }, child: Text("login"))

          ],
        ),
      ),
    );
  }
}
