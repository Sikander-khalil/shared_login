import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {


  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  static const String KEYLOGIN = "login";

  @override
  void initState(){
    super.initState();
   whereToGo();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Icon(Icons.account_circle, color: Colors.white,size: 13,),
        ),
      ),
    );
  }

  void whereToGo() async{

    var sharedPref = await SharedPreferences.getInstance();
   var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2),(){
      if(isLoggedIn!=null){
       if(isLoggedIn){
         Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => MyHomePage(email: "", password: ""),));
       } else{
         Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage(),));

       }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage(),));
      }



    });
  }
}


class MyHomePage extends StatefulWidget {

  final String email;
  final String password;
  const MyHomePage({Key? key, required this.email, required this.password}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Home'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.home, color: Colors.white.withOpacity(0.4),

              ),
              Text("Email: ${widget.email}"),
              Text("Password: ${widget.password}"),
            ],

          ),


        ),


      ),


    );
  }
}
