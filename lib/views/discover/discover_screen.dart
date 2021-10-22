import 'package:flutter/material.dart';
import 'package:golepps/views/discover/components/discover.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({ Key? key }) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
      Discover()
    ,);
  }
}