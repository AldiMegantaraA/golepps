// To parse this JSON data, do
//
//     final discoverList = discoverListFromJson(jsonString);

import 'dart:convert';

List<DiscoverList> discoverListFromJson(String str) => List<DiscoverList>.from(json.decode(str).map((x) => DiscoverList.fromJson(x)));

String discoverListToJson(List<DiscoverList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiscoverList {
    DiscoverList({
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

    factory DiscoverList.fromJson(Map<String, dynamic> json) => DiscoverList(
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
