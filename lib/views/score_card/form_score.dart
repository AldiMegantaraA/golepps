import 'package:flutter/material.dart';
import 'package:golepps/api/api_service.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/models/scoreCard_model.dart';
import 'package:golepps/views/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScore extends StatefulWidget {
  const FormScore({ Key? key }) : super(key: key);

  @override
  _FormScoreState createState() => _FormScoreState();
}

class _FormScoreState extends State<FormScore> {

  late ScoreCardRequest requestModel;


  bool isApiCallProcess = false;
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final mycontroller = TextEditingController();
  String? FieldName;
  String? userName;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async { 
      SharedPreferences pref = await SharedPreferences.getInstance();
      setState(() {
        FieldName = pref.getString("discoverName") as String?;
        userName = pref.getString("username") as String?;
      });
     });
    requestModel = ScoreCardRequest(score1: '', score10: '', score11: '', score12: '', score13: '', score14: '', score15: '', score16: '', score17: '', score18: '', score2: '', score3: '', score4: '', score5: '', score6: '', score7: '', score8: '', score9: '', username: '', play_date: '',);
  }
  
  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          '$FieldName',
          style: const TextStyle(
            fontSize: 18
          ),
        ),
        backgroundColor: kPrimaryButtonColor,
      ),
    body: Form(
          key: _formKey,
          child: ListView( shrinkWrap: true, children: [
          Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow( decoration: BoxDecoration(color: kPrimaryButtonColor,), children: [
                    TableCell(
                      child: 
                      Container(height: 32, child: Text('Hole', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 16))
                    ),
                    TableCell(
                      child: 
                      Container(height: 32, child: Text('PAR', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),margin: EdgeInsets.only(top: 16))
                    ),
                    TableCell(
                      child: 
                      Container(height: 32, child: Text('Score', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),margin: EdgeInsets.only(top: 16))
                    ),
                  ]),
                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('1', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score1 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),
                  
                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('2', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score2 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('3', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('3', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score3 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score4 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score5 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('6', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('3', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score6 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('7', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score7 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('8', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score8 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('9', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score9 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('10', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score10 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('11', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('3', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score11 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('12', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score12 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('13', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score13 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('14', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score14 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('15', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score15 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('16', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score16 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('17', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score17 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('18', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: TextFormField(
                        controller: mycontroller,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onSaved: (input) => requestModel.score18 = input!,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ))
                    ),
                  ]),

                  TableRow( decoration: BoxDecoration(color: kPrimaryButtonColor,),children: [
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('Total', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, child: Text('72', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ),
                    TableCell(
                      child: 
                      Container(height: 20, margin: EdgeInsets.only(top: 8, bottom: 4), child: Text(
                        'total'
                      ))
                    ),
                  ]),
                ],
              ),
            ),
            Container( margin: EdgeInsets.only(bottom: 12), child:
            MaterialButton(
              minWidth: size.width *0.8, height: size.height / 16,
              color: kPrimaryButtonColor,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                      requestModel.play_date = '2021-10-22';
                      requestModel.username = userName!;    
                });

                print('hit');
                if(validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;                    
                  });

                  APIService apiService = new APIService();
                  apiService.scorecard(requestModel).then((value) {
                    setState(() {
                      isApiCallProcess = false;         
                    });
                    if(value.status.isNotEmpty) {
                      print('yes');
                      requestModel.username = 'newuser';
                      final snackBar = SnackBar(
                        content: Text("Login Successfull"),
                      );
                      Navigator
                        .of(context)
                        .pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PageView()
                        )
                      );
                    }
                    else {
                      print('no');
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
                'Create Score Card',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
            )),
          ]))]
          )
          ));
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