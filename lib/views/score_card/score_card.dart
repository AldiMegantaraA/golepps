import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/score_card/form_score.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ScoreCardScreen extends StatefulWidget {
  const ScoreCardScreen({ Key? key }) : super(key: key);

  @override
  _ScoreCardScreenState createState() => _ScoreCardScreenState();
}

class _ScoreCardScreenState extends State<ScoreCardScreen> {

  String? _valProvince;
  List<dynamic> _dataProvince = [];

  get result => null;
  void getProvince() async {
    final response = await http.get(Uri.parse('http://167.172.78.242:8000/api/get-allgolf/'));
    var result = json.decode(response.body); 
    setState(() {
      _dataProvince = result;
    });
  }

  @override
  void initState(){
    super.initState();
    getProvince(); 
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return ListView( shrinkWrap: true, children: [
    Column( 
      children:[ 
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
        Container(margin: const EdgeInsets.only(top: 20, left: 40, right: 40), child: 
          const Text('Disini, kamu bisa mengisi scorecard golfmu secara simpel!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              hint: Text("Pilih lapangan tempat kamu bermain"),
              value: _valProvince,
              items: _dataProvince.map((item) {
                return DropdownMenuItem(
                  child: Text(item['name']),
                  value: item['name'],
                );
              }).toList(),
              onChanged: (value) {
               setState(() {
                 _valProvince = value as String?;
               });
              },
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
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString("discoverName", _valProvince!);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FormScore()));
                },
                child: Text(
                  'Masukan Skor',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                  )
              ),
              
            )],
        ),
      ),
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                    Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                    Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
                    ,
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('4', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
                      Container(height: 20, child: Text('5', textAlign: TextAlign.center,), margin: EdgeInsets.only(top: 8, bottom: 4))
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
    ])]);
  }
}