import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:golepps/models/discover_list.dart';
import 'package:golepps/views/detail_discover/detail_discover.dart';
// import 'package:golepps/models/discover_list.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}


class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;
  double pageOffset = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<DiscoverList>>? futureDiscover;

  Future <List<dynamic>> _getDiscoverList() async {
    var response = await http.get(Uri.parse("http://167.172.78.242:8000/api/get-allgolf/"));
      return json.decode(response.body);
    // if (response.statusCode == 200) {
    //   print(json.decode(response.body));
    //     // print(jsonResponse[0]["name"]);
    //     // return jsonResponse.map((data) => new DiscoverList.fromJson(data)).toList();
    // } else {
    //   throw Exception('Unexpected error occured!');
    // }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
    // futureDiscover = _getDiscoverList();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      // width: double.infinity,
      child: PageView(
        children: <Widget>[
          FutureBuilder<List<dynamic>>(
            future: _getDiscoverList(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData){
                print(snapshot.data!.length);
                return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 100,
                  width: 220,
                  child: TextButton(
                    onPressed: () { 
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => DetailDiscoverScreen(
                          item: snapshot.data![index]["id"],
                          name: snapshot.data![index]["name"],
                        )));
                     },
                    child: SlidingCard(
                    name: snapshot.data![index]["name"],
                    Date: snapshot.data![index]["city"],
                    phone_number: snapshot.data![index]["phone_number"],
                    assetName: snapshot.data![index]["image_1"],
                    offset: pageOffset,
                  )
                  ,),
                ));
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
          )
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String Date;
  final String assetName;
  final String phone_number;
  final double offset;

  const SlidingCard({
    Key? key,
    required this.name,
    required this.Date,
    required this.assetName,
    required this.phone_number,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(bottom: 24,),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                '$assetName',
                height: MediaQuery.of(context).size.height * 0.12,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: CardContent(
                name: name,
                Date: Date,
                phone_number: phone_number,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String Date;
  final String phone_number;
  final double offset;

  const CardContent(
      { Key? key,
      required this.name,
      required this.Date,
      required this.phone_number,
      required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              Date,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              phone_number,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}