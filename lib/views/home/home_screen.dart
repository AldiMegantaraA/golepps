import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/home/components/home.dart';
import 'package:golepps/views/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar( isAlwaysShown: true, controller: _scrollController,
        child: RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
          },
          child: Container(
            child: Home(),
          )
        ),
      )
    );
  }
}

