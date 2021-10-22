
import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/login/login_screen.dart';
import 'package:golepps/views/register/register_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset("assets/images/rafiki.png"),
          ),
          Container(
            child: Image(image: AssetImage("assets/images/golepps horizontal 2.png")),
          ),
          Container(
            width: size.width * 0.8,
            margin: EdgeInsets.only(top: 20, bottom: 40),
            child: Text('Kita membuat kamu mudah untuk menemukan motivasi dan tempat bermain yang cocok dengan skill kamu!',
            textAlign: TextAlign.center,),
          ),
          Container( width: size.width * 0.8, height: size.height / 16, margin: EdgeInsets.only(bottom: 12),
            child:
            TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all<Color>(kPrimaryButtonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                )
                ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
                );
              },
              child: Text(
                'Masuk',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                )
            )
          ),
          Container( width: size.width * 0.8, height: size.height / 16,
            child:
            TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: kPrimaryButtonColor))
                )
                ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => RegisterScreen())
                );
              },
              child: Text(
                'Daftar',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                )
            )
          )
        ],
      ),
    );
  }
}