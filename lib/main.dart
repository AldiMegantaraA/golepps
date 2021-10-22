import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/PageView.dart';
import 'package:golepps/views/splash_screen.dart';
import 'package:golepps/views/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async { 
       SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool("isLogin") == false){
      Navigator
        .of(context)
        .pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => WelcomScreen())
        );
    }
    if(pref.getBool("isLogin") == true){
      Navigator
        .of(context)
        .pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage())
        );
    }
     });
        _cekLogin();
  }

  Future _cekLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool("isLogin") == false){
      Navigator
        .of(context)
        .pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => WelcomScreen())
        );
    }
    if(pref.getBool("isLogin") == true){
      Navigator
        .of(context)
        .pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage())
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golepps',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomScreen(),
    );
  }
}


