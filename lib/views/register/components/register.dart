import 'package:flutter/material.dart';
import 'package:golepps/api/api_service.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/models/login_model.dart';
import 'package:golepps/views/home/home_screen.dart';
import 'package:golepps/views/login/components/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel(password: '', username: '');
  }

  @override
  Widget build(BuildContext context) {
    return _uiSteup(context);
  }

  Widget _uiSteup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container( 
          alignment: Alignment.center,
          child: 
        new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Image(image: AssetImage("assets/images/golepps horizontal 2.png")),
            ),
            Container(
              width: size.width * 0.8, margin: EdgeInsets.only(bottom: 12),
              alignment: Alignment.topLeft,
              child: Text(
                'Daftarkan diri Anda!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: size.width * 0.8,
              alignment: Alignment.topLeft,
              child: Text(
                'Username',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              width: size.width * 0.8, height: size.height / 20, margin: EdgeInsets.only(bottom: 12, top: 6),
              child: TextFormField(
                //cek data field nya kosong
                keyboardType: TextInputType.emailAddress,
                onSaved: (input) => requestModel.username= input!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tolong masukan Username yang sesuai';
                  }
                  return null;
                },

                controller: myUsernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(12),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              width: size.width * 0.8, height: size.height / 20, margin: EdgeInsets.only(bottom: 12, top: 6),
              child: TextFormField(
                //cek data field nya kosong
                keyboardType: TextInputType.text,
                onSaved: (input) => requestModel.password = input!,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tolong masukan Password yang sesuai!';
                  }
                  return null;
                },

                controller: myPasswordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(12),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              width: size.width * 0.8, height: size.height / 20, margin: EdgeInsets.only(bottom: 12, top: 6),
              child: TextFormField(
                //cek data field nya kosong
                keyboardType: TextInputType.text,
                onSaved: (input) => requestModel.password = input!,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tolong masukan Password yang sesuai!';
                  }
                  return null;
                },

                controller: myPasswordController,
                decoration: InputDecoration(
                  hintText: 'Retype Password',
                  contentPadding: EdgeInsets.all(12),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            Container( width: size.width * 0.8, height: size.height / 20,
            child:
              TextButton(
                style: ButtonStyle(
                  alignment: Alignment.centerRight,
                  ),
                onPressed: () {
                      Navigator
                        .of(context)
                        .pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PageLogin()
                        )
                      );
                },
                child: Text(
                  'Sudah memiliki akun ? Masuk',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                  )
              )
            ),
            SizedBox(
              height: 25.0,
            ),
            Container( margin: EdgeInsets.only(bottom: 12), child:
            MaterialButton(
              minWidth: size.width *0.8, height: size.height / 20,
              color: kPrimaryButtonColor,
              textColor: Colors.white,
              onPressed: () {
                if(validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;                    
                  });

                  APIService apiService = new APIService();
                  apiService.login(requestModel).then((value) async {
                    setState(() {
                      isApiCallProcess = false;              
                    });

                    if(value.status.isNotEmpty) {
                      print('yes');
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setBool("isLogin", true);
                      pref.setString("username", myUsernameController.value.text);
                      final snackBar = SnackBar(
                        content: Text("Login Successfull"),
                      );
                      Navigator.of(context).pop();
                      Navigator
                        .of(context)
                        .pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()
                        )
                      );
                    }
                    else {
                      print('no');
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setBool("isLogin", false);
                      final snackBar = SnackBar(
                        content: Text("Identitas tidak ditemukan, tolong masukan NIK dan PIN yang sesuai"),
                      );
                    }
                  });
                  print(requestModel.toJson());
                }
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: Text(
                'Daftar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
            )),
          ],
        ),
          ))

    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if(form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
