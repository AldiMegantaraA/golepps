
import 'package:flutter/material.dart';
import 'package:golepps/views/PageView.dart';
import 'package:golepps/views/home/home_screen.dart';
import 'package:golepps/views/welcome/components/body.dart';
import 'package:golepps/views/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
            child: Image(image: AssetImage("assets/images/golepps horizontal 2.png")),
          ),
      )
    ,);
  }
}