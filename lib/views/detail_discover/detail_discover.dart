import 'package:flutter/material.dart';
import 'package:golepps/constants.dart';
import 'package:golepps/views/discover/components/discover.dart';
import 'package:golepps/views/profile/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailDiscoverScreen extends StatefulWidget {
  final int item;
  final String name;
  const DetailDiscoverScreen({ Key? key, required this.item,required this.name }) : super(key: key);

  @override
  _DetailDiscoverScreenState createState() => _DetailDiscoverScreenState();
}

class _DetailDiscoverScreenState extends State<DetailDiscoverScreen> {
  Future<List<DiscoverListDetail>>? discovers;

  @override
  void initState() {
    super.initState();
    // discovers = fetchDiscoverDetail();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<dynamic>> (
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData){
                print(snapshot.data!.length);
                return ListView(
                shrinkWrap: true,
                children: [ 
                  Image.network(snapshot.data![widget.item -1]["image_1"],),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 18, left: 12),
                    child:
                      Text(
                        snapshot.data![widget.item -1]["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                  ),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 6, left: 12),
                    child:
                      Text(
                        snapshot.data![widget.item -1]["city"],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14
                        ),
                      ),
                  ),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20, left: 12),
                    child:
                      const Text(
                        'Info',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey
                        ),
                      ),
                  ),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 6, left: 12, right: 12),
                    child:
                      Text(
                        snapshot.data![widget.item -1]["info"],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14
                        ),
                      ),
                  ),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 6, left: 12, right: 12),
                    child:
                      Text(
                        'Telepon',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey
                        ),
                      ),
                  ),
                  Container( 
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 6, left: 12, right: 12),
                    child:
                      Text(
                        snapshot.data![widget.item -1]["phone_number"],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14
                        ),
                      ),
                  ),
                ]);
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
            future: fetchDiscoverDetail(),
      )
    ,);
  }
}

class DiscoverListDetail {
    DiscoverListDetail({
        required this.id,
        required this.name,
        required this.city,
        required this.address,
        required this.image1,
        required this.email,
        required this.info,
        required this.phoneNumber,
        required this.status,
        required this.latitude,
        required this.longitude,
        required this.createdOn,
    });

    int id;
    String name;
    String city;
    String address;
    String image1;
    String email;
    String info;
    String phoneNumber;
    bool status;
    String latitude;
    String longitude;
    DateTime createdOn;

    factory DiscoverListDetail.fromJson(Map<String, dynamic> json) => DiscoverListDetail(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        address: json["address"],
        image1: json["image_1"],
        email: json["email"],
        info: json["info"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdOn: DateTime.parse(json["created_on"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "address": address,
        "image_1": image1,
        "email": email,
        "info": info,
        "phone_number": phoneNumber,
        "status": status,
        "latitude": latitude,
        "longitude": longitude,
        "created_on": "${createdOn.year.toString().padLeft(4, '0')}-${createdOn.month.toString().padLeft(2, '0')}-${createdOn.day.toString().padLeft(2, '0')}",
    };
}

Future<List<dynamic>> fetchDiscoverDetail() async {
  final response = await http.get(Uri.parse('http://167.172.78.242:8000/api/get-allgolf/'));
  // print(response.body);
  return json.decode(response.body);
}