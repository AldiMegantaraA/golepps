import 'package:flutter/material.dart';
import 'package:golepps/views/home/components/carousel_discover.dart';
import 'package:golepps/views/home/components/feed_list.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar( isAlwaysShown: true, controller: _scrollController,
        child: RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
          },
          child: ListView(
            children: <Widget>[
              Container(
                  width: size.width * 0.8, margin: EdgeInsets.only(top: 10, bottom: 6, left: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(children: const <Widget>[
                    Icon(Icons.golf_course),
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],)
              ),
              SlidingCardsView(),
              const Divider(
                height: 6,
                thickness: 0.4,
                indent: 0,
                endIndent: 0,
              ),
              Container(
                  width: size.width * 0.8, margin: EdgeInsets.only(top: 6, bottom: 0, left: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(children: const <Widget>[
                  Icon(Icons.feed),
                  Text(
                    'Beranda',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  ])
              ),
              const GetUserData()
              ],
          ),
        )
      )
    );
  }
}