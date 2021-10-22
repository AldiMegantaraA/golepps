import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:getwidget/getwidget.dart';


class GetUserData extends StatefulWidget {
  const GetUserData({key}) : super(key: key);

  @override
  State<GetUserData> createState() => _GetUserDataState();
}

class _GetUserDataState extends State<GetUserData> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  bool _showFab = true;
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;



  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse("https://reqres.in/api/users?per_page=12"));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column( children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          leading: 
                          GFAvatar(
                            borderRadius: BorderRadius.circular(50),
                            backgroundImage:NetworkImage(snapshot.data[index]['avatar']),
                            shape: GFAvatarShape.square
                          ),
                          title: 
                            Text(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name'],
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          subtitle: 
                            Text(snapshot.data[index]['email'],
                            style: TextStyle(color: Colors.black),
                            ),
                          // trailing: Row( 
                          //   mainAxisSize: MainAxisSize.min,         
                          //   children: <Widget>[
                          //   Container(
                          //     margin: EdgeInsets.only(right: 6),
                          //     child:
                          //       Icon(Icons.phone)),
                          //       Icon(Icons.chat),
                          // ]),
                        ),
                      ),
                      const Divider(
                        height: 6,
                        thickness: 0.4,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ]);
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
  }
}