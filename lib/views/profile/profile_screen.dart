import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/login/components/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
              child: const Icon(
                Icons.people
              )
            ,),
          ),
        ],
        backgroundColor: kPrimaryButtonColor,
      ),
      body: Container( width: size.width * 0.8, height: size.height / 16,
      margin: EdgeInsets.only(left: 40, top: 20),
        child:
          Column( children: [
          Container(margin: const EdgeInsets.only(top: 20, left: 40, right: 40), child: 
          const Text('Selamat datang di fitur scorecard digital!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          TextButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: kPrimaryButtonColor))
              )
              ),
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setBool("isLogin", false);
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => PageLogin())
            );
            },
            child: Text(
              'Keluar',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
              )
          )
          ]),
    ));
  }
}