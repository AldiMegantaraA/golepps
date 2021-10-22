import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/detail_discover/detail_discover.dart';

class Discover extends StatefulWidget {
  get name => null;

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
//Step 3
  _DiscoverState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//Step 1
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  // ignore: deprecated_member_use
  List names = []; // names we get from API
  // ignore: deprecated_member_use
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  //step 2.1
  void _getNames() async {
    final response =
        await dio.get('http://167.172.78.242:8000/api/golf-search/');
    print(response.data);
    // ignore: deprecated_member_use
    List tempList = [];
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

//Step 2.2
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Ketik nama lapangan atau lokasi', style: TextStyle(color: kPrimaryButtonColor, fontSize: 14),);
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  //Step 4
  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      // ignore: deprecated_member_use
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Column( children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: 
              GFAvatar(
                borderRadius: BorderRadius.circular(5),
                backgroundImage:NetworkImage(filteredNames[index]['image_1']),
                shape: GFAvatarShape.square
              ),
              title: Text(filteredNames[index]['name']),
              onTap: () => Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => DetailDiscoverScreen(
                          item: filteredNames[index]["id"],
                          name: filteredNames[index]["name"],
                        ))),
              subtitle: 
                Text(filteredNames[index]['city'],
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
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ]);
      },
    );
  }

  @override
  void initState() {
    _getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
      child: AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        color: kPrimaryButtonColor,
        onPressed: _searchPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      backgroundColor: Colors.white,
      )),
      body: Container( child:
        ListView( shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: [
          SizedBox(
            height: 500,
            child: _buildList(),
          )
          
        ])),
      resizeToAvoidBottomInset: false,
//      floatingActionButton: FloatingActionButton(
//        onPressed: _postName,
//        child: Icon(Icons.add),
//      ),
    );
  }
}